package controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.ResetPasswordDTO;
import enums.RoleUser;
import forgotPassword.OnForgotPasswordInitiatedEvent;
import model.User;
import path.PasswordPath;
import path.PublicPath;
import security.CustomUserDetails;
import service.LoginService;
import service.RoleService;
import service.UserService;

@Controller
public class ForgotPasswordController {
	
	private final ApplicationEventPublisher applicationEventPublisher;
	private final UserService userService;
	private final RoleService roleService;
	private final LoginService loginService;
	
	@Autowired
	public ForgotPasswordController(ApplicationEventPublisher applicationEventPublisher,
						  			UserService userService, RoleService roleService,
						  			LoginService loginService) {
		this.applicationEventPublisher = applicationEventPublisher;
		this.userService = userService;
		this.roleService = roleService;
		this.loginService = loginService;
	}
	
	@GetMapping(PasswordPath.FORGOT_PASSWORD_PAGE)
	public String enterEmailPage() {
		return "forgot-password/email-enter";
	}
	
	@PostMapping(PasswordPath.SEND_NEW_PASSWORD)
	public String sendNewPassword(@RequestParam("email") String email, HttpSession session, 
								  RedirectAttributes redirectAttributes) {
		User user = userService.findByEmail(email);
		if(user!=null) {
			if(!user.getRole().getRoleName().equals(RoleUser.FORGOT_PASSWORD)) {
				session.setAttribute("oldRole", user.getRole().getRoleName());				
				user.setRole(roleService.findByRoleName(RoleUser.FORGOT_PASSWORD));
			}
			user.setPassword(UUID.randomUUID().toString().substring(0, 6));
			applicationEventPublisher.publishEvent(new OnForgotPasswordInitiatedEvent(user));
		}
		
		redirectAttributes.addFlashAttribute("status", user!=null ? "success" : "error");
		redirectAttributes.addFlashAttribute("mes", user!=null ? "Gửi mật khẩu thành công" : "Không thể tìm thấy email");
		return "redirect:" + (user!=null ? PublicPath.LOGIN_PAGE : PasswordPath.FORGOT_PASSWORD_PAGE);
	}
	
	@GetMapping(PasswordPath.RESET_PASSWORD_PAGE)
	public String showResetPasswordPage(Model model, @AuthenticationPrincipal CustomUserDetails details) {
		model.addAttribute("resetPasswordDTO",new ResetPasswordDTO());
		return "forgot-password/reset-password";
	}
	
	@PostMapping(PasswordPath.RESET_PASSWORD)
	public String resetPassword(@AuthenticationPrincipal CustomUserDetails details, HttpSession session, RedirectAttributes redirectAttributes,
								@Valid @ModelAttribute("resetPasswordDTO") ResetPasswordDTO resetPasswordDTO,
								BindingResult result) {
		User user = details.getUser();
		RoleUser roleUser = (RoleUser) session.getAttribute("oldRole");
		if(result.hasErrors()) {
			redirectAttributes.addFlashAttribute("status", "success");
			redirectAttributes.addFlashAttribute("mes", "Cập nhật mật khẩu thành công");
			return "forgot-password/reset-password";
		}else {
			userService.updatePassword(user, resetPasswordDTO.getPassword(), roleUser);
			loginService.loginAuto(user);
			return "redirect:" + PublicPath.HOME;
		}
	}
}
