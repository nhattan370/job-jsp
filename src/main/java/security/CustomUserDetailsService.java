package security;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import dao.UserDAOImpl;
import model.User;
import service.UserService;
import share.ColorExample;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	private final Logger logger = Logger.getLogger(CustomUserDetailsService.class.getName());
	private final UserService userService;
	
	@Autowired
	public CustomUserDetailsService(UserService userService) {
		this.userService = userService;
	}
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		User user = userService.findByEmail(email);
		if(user==null) throw new UsernameNotFoundException(email);
		return new CustomUserDetails(user);
	}
}
