package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import model.User;

@Service
public class LoginServiceImpl implements LoginService {

	private final UserDetailsService userDetailsService;
	private final HttpServletRequest httpServletRequest;
	
	@Autowired
	public LoginServiceImpl(UserDetailsService userDetailsService, HttpServletRequest httpServletRequest) {
		this.httpServletRequest = httpServletRequest;
		this.userDetailsService = userDetailsService;
	}
	@Override
	public void loginAuto(User user) {
		UserDetails userDetails = userDetailsService.loadUserByUsername(user.getEmail());

        UsernamePasswordAuthenticationToken auth =
                new UsernamePasswordAuthenticationToken(
                        userDetails, null, userDetails.getAuthorities());

        SecurityContextHolder.getContext().setAuthentication(auth);

        HttpSession session = httpServletRequest.getSession(true);
        session.setAttribute("SPRING_SECURITY_CONTEXT", SecurityContextHolder.getContext());
	}

}
