package emailVerify;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import model.User;
import model.VerificationToken;
import path.RecruiterPath;
import service.VerificationTokenService;
import share.ColorExample;

@Component
public class RegisterListener implements ApplicationListener<OnRegistrationInitiatedEvent> {
	
	private final VerificationTokenService verificationTokenService;
	private final EmailSender emailSender;
	private final Logger logger = Logger.getLogger(RegisterListener.class.getName());

	@Autowired
	public RegisterListener(VerificationTokenService verificationTokenService, 
							EmailSender emailSender) {
		this.verificationTokenService = verificationTokenService;
		this.emailSender = emailSender;
	}


	@Async
	@Override
	public void onApplicationEvent(OnRegistrationInitiatedEvent event) {
	    try {
		    User user = event.getUser();
		    VerificationToken token = verificationTokenService.createToken(user);
		    String link = RecruiterPath.LOCAL + RecruiterPath.VERIFY+"?token=" + token.getToken();
	
		    String html = "<h2>Xin chào " + user.getFullName() + ",</h2>"
		        + "<p>Cảm ơn bạn đã đăng ký tài khoản tại <b>vieclamhot.vn</b> 🌱</p>"
		        + "<p>Để hoàn tất quá trình đăng ký, bạn vui lòng nhấn vào nút dưới đây:</p>"
		        + "<a style=\""
		        + "display:inline-block;"
		        + "padding: 10px 20px;"
		        + "background-color:#4CAF50;"
		        + "color:white;"
		        + "border-radius:5px;"
		        + "text-decoration:none;\""
		        + " href=\"" + link + "\">Xác thực email</a>"
		        + "<br><p>Thân,<br>Đội ngũ hỗ trợ ViecLamHot</p>";
	
		    emailSender.send(user.getEmail(), "Xác thực Email", html);	    	
	    }catch(Exception e){
	    	logger.info(ColorExample.GRAY+ e.getMessage() +ColorExample.RESET);
	    }
	}
}
