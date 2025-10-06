package security;

import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import enums.UserStatus;
import model.User;

public class CustomUserDetails implements UserDetails {

	private static final long serialVersionUID = 1L;
	private final User user;

	public CustomUserDetails(User user) {
		this.user = user;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return Collections.singleton(new SimpleGrantedAuthority(user.getRole().getRoleName()));
	}

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return user.getEmail();
	}
	
	public User getUser() {
		return user;
	}

	@Override
	public boolean isAccountNonExpired() {
		return user.getStatus()!=UserStatus.EXPIRED;
	}

	@Override
	public boolean isAccountNonLocked() {
		return user.getStatus()!=UserStatus.LOCKED;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return user.getStatus()!=UserStatus.DISABLED;
	}

	@Override
	public boolean isEnabled() {
		return user.getStatus()==UserStatus.ACTIVE;
	}

}
