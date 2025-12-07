package security;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import enums.RoleUser;
import enums.UserStatus;
import model.User;
import share.ColorExample;

@Component
public class MyLoginSuccessHandler implements AuthenticationSuccessHandler{

	private final Logger logger = Logger.getLogger(MyLoginSuccessHandler.class.getName());

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		CustomUserDetails customUserDetails = (CustomUserDetails) authentication.getPrincipal();
		User user = customUserDetails.getUser();
		
		
		authentication.getAuthorities().forEach(a -> {
		    System.out.println("SEC AUTHORITY = " + a.getAuthority());
		});

		
		//Redirect page depend on status
		if(user.getRole().getRoleName().equals(RoleUser.RECRUITER_PENDING)) {
			response.sendRedirect(request.getContextPath() + "/re-pending/show-verified-page");
		}else if(!user.getStatus().equals(UserStatus.ACTIVE)) {
			response.sendRedirect(request.getContextPath() + "/account-status");
		}else {
			//Set cookie
			Cookie cookie = new Cookie("loginId", user.getId()+"");
			cookie.setPath("/");
			cookie.setHttpOnly(true);
			response.addCookie(cookie);
			
			//Show swal
			request.getSession().setAttribute("mes", "Đăng nhập thành công!");
			response.sendRedirect(request.getContextPath() + "/");			
		}
		
	}

}
 