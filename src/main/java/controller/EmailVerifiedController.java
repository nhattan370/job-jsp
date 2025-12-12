package controller;

import java.util.logging.Logger;

import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import emailVerify.OnRegistrationInitiatedEvent;
import enums.UserStatus;
import model.User;
import model.VerificationToken;
import path.PublicPath;
import path.RecruiterPath;
import service.LoginService;
import service.UserService;
import service.VerificationTokenService;
import share.ColorExample;

@Controller
public class EmailVerifiedController {
	
	private final VerificationTokenService verificationTokenService;
	private final ApplicationEventPublisher applicationEventPublisher;
	private final UserService userService;
	private final LoginService loginService;
	private Logger logger = Logger.getLogger(EmailVerifiedController.class.getName());
	
	public EmailVerifiedController(VerificationTokenService verificationTokenService,
						 ApplicationEventPublisher applicationEventPublisher,
						 UserService userService, LoginService loginService) {
		this.verificationTokenService = verificationTokenService;
		this.applicationEventPublisher = applicationEventPublisher;
		this.userService = userService;
		this.loginService = loginService;
	}
	
	@GetMapping(RecruiterPath.VERIFY_PAGE)
	public String showVerfiedPage() {		
		return "email-confirm";
	}
	
	@GetMapping(RecruiterPath.VERIFY)
	public String verifyEmail(@RequestParam("token") String token, RedirectAttributes redirectAttributes) {
		Boolean verify = verificationTokenService.verify(token);
		
		redirectAttributes.addFlashAttribute("mes", verify ? "Xác minh thành công" : "Xác minh thất bại");
		redirectAttributes.addFlashAttribute("status", verify ? "success" : "error");
		return "redirect:"+PublicPath.LOGIN_PAGE;
	}
	
	@PostMapping(RecruiterPath.CONFIRM_EMAIL)
	public String sendVerify(@RequestParam("email") String email, RedirectAttributes redirectAttributes) {
		User user = userService.findByEmail(email);
		
		applicationEventPublisher.publishEvent(new OnRegistrationInitiatedEvent(user));
		if(!user.getStatus().equals(UserStatus.SENDING)) {
			logger.info(ColorExample.RED+user.getStatus()+ColorExample.RESET);
			userService.updateStatusSending(user);
			logger.info(ColorExample.RED+user.getStatus()+ColorExample.RESET);
		}
		
		return "redirect:"+RecruiterPath.VERIFY_PAGE;
	}
	
}
