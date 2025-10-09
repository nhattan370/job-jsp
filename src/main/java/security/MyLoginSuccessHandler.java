package security;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import share.ColorExample;

@Component
public class MyLoginSuccessHandler implements AuthenticationSuccessHandler{

	private final Logger logger = Logger.getLogger(MyLoginSuccessHandler.class.getName());
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		logger.info(ColorExample.RED+ "My Login Success Handler" +ColorExample.RESET);
		request.getSession().setAttribute("mes", "Đăng nhập thành công!");
		response.sendRedirect(request.getContextPath()+"/");
		
	}

}
