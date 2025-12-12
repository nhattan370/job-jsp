package emailVerify;

import org.springframework.context.ApplicationEvent;

import model.User;

public class OnRegistrationInitiatedEvent extends ApplicationEvent {
	
	private static final long serialVersionUID = 1L;
	private final User user;

	public OnRegistrationInitiatedEvent(User user) {
		super(user);
		this.user = user;
	}

	public User getUser() {
		return user;
	}
}
