package forgotPassword;

import java.util.UUID;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import emailVerify.EmailSender;
import emailVerify.RegisterListener;
import model.User;
import service.UserService;
import share.ColorExample;

@Component
public class ForgotPasswordListener implements ApplicationListener<OnForgotPasswordInitiatedEvent> {
	
	private final EmailSender emailSender;
	private final UserService userService;
	private final PasswordEncoder encoder;
	private final Logger logger = Logger.getLogger(RegisterListener.class.getName());

	@Autowired
	public ForgotPasswordListener(EmailSender emailSender, UserService userService, PasswordEncoder encoder) {
		this.emailSender = emailSender;
		this.userService = userService;
		this.encoder = encoder;
	}
	
	@Async
	@Override
	public void onApplicationEvent(OnForgotPasswordInitiatedEvent event) {
	    User user = event.getUser();
	    String newPassword = UUID.randomUUID().toString().substring(0,7);
	    user.setPassword(encoder.encode(newPassword));
	    userService.update(user);

	    String html =
	    	    "<h2>Xin chào " + user.getFullName() + ",</h2>"
	    	  + "<p>Bạn vừa yêu cầu <b>đặt lại mật khẩu</b> cho tài khoản tại <b>vieclamhot.vn</b>.</p>"
	    	  + "<p>Mật khẩu tạm thời của bạn là:</p>"
	    	  + "<h3 style='color:#2c7be5'>" + newPassword + "</h3>"
	    	  + "<p>Vui lòng đăng nhập bằng mật khẩu này và <b>đổi lại mật khẩu mới</b> để đảm bảo an toàn cho tài khoản.</p>"
	    	  + "<p>Nếu bạn không thực hiện yêu cầu này, vui lòng bỏ qua email hoặc liên hệ với chúng tôi để được hỗ trợ.</p>"
	    	  + "<br>"
	    	  + "<p>Thân mến,<br>"
	    	  + "Đội ngũ hỗ trợ <b>ViecLamHot</b></p>";

	    emailSender.send(user.getEmail(), "Xác thực Email", html);	    	
	}

}
