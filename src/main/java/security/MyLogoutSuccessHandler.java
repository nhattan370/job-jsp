package security;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import share.ColorExample;

@Component
public class MyLogoutSuccessHandler implements LogoutSuccessHandler{
	
	private final Logger logger = Logger.getLogger(MyLogoutSuccessHandler.class.getName());

	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		Cookie cookie = new Cookie("loginId", "-1");
		cookie.setPath("/");
		response.addCookie(cookie);
		
		request.getSession().setAttribute("mes", "Đăng xuất thành công");
		response.sendRedirect(request.getContextPath()+"/");
		
	}

}
