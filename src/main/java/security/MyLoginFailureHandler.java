package security;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import enums.RoleUser;
import model.User;
import path.PublicPath;
import service.UserService;
import share.ColorExample;

@Component
public class MyLoginFailureHandler implements AuthenticationFailureHandler {
	
	private final UserService userService;
	private final Logger logger = Logger.getLogger(MyLoginFailureHandler.class.getName());
	
	@Autowired
	public MyLoginFailureHandler(UserService userService) {
		this.userService = userService;
	}

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		String email = request.getParameter("email");
		User user = userService.findByEmail(email);
		
		if(user!=null && user.getRole().getRoleName().equals(RoleUser.RECRUITER_PENDING)) {
			request.getSession().setAttribute("login_error", "Tài khoản chưa được xác minh. "
															+ "Vui lòng kiểm tra email! "
															+ "<a href='https://mail.google.com' target='_blank'>"
															+ "Mở Gmail"
															+ "</a>");
		}else {
			request.getSession().setAttribute("login_error", "Mật khẩu hoặc email không đúng");
		}
		
		response.sendRedirect(request.getContextPath() + PublicPath.LOGIN_PAGE);
	}

}
