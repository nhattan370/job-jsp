package controller.AuthController;

import java.util.logging.Logger;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.UserRegisterDTO;
import emailVerify.OnRegistrationInitiatedEvent;
import emailVerify.RegisterListener;
import enums.RoleUser;
import model.User;
import path.PublicPath;
import path.RecruiterPath;
import service.LoginService;
import service.RoleService;
import service.UserService;

@Controller
public class RegisterController {
	
	private final RoleService roleService;
	private final UserService userService;
	private final ApplicationEventPublisher applicationEventPublisher;

	private final LoginService loginService;
	private Logger logger = Logger.getLogger(LoginController.class.getName());
	
	@Autowired
	public RegisterController(RoleService roleService, UserService userService,
						      LoginService loginService, ApplicationEventPublisher applicationEventPublisher) {
		this.roleService = roleService;
		this.userService = userService;
		this.loginService = loginService;
		this.applicationEventPublisher = applicationEventPublisher;
	}
	
	@GetMapping("/show-register")
	public String showRegister(Model model) {
		model.addAttribute("userDTO", new UserRegisterDTO());
		model.addAttribute("roles", roleService.findAll());
		return "login-register/register";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("userDTO") UserRegisterDTO userRegisterDTO, BindingResult bindingResult,
						   RedirectAttributes redirectAttributes, Model model) {
		if(bindingResult.hasErrors()) {
			model.addAttribute("roles", roleService.findAll());
			model.addAttribute("mes", "Có lỗi rồi");
			model.addAttribute("status", "error");
			return "login-register/register";
		}
		
		//save user's information into database
		User user = userService.userRegister(userRegisterDTO);
		
		redirectAttributes.addFlashAttribute("mes", "Đăng kí thành công");
		redirectAttributes.addFlashAttribute("status","success");
		
		//Login automation after registration
		loginService.loginAuto(user);
		
		if(user.getRole().getRoleName().equals(RoleUser.RECRUITER_PENDING)) {
			//Send email verify
			applicationEventPublisher.publishEvent(new OnRegistrationInitiatedEvent(user));
			userService.updateStatusSending(user);
			
			return "redirect:"+RecruiterPath.VERIFY_PAGE;
		}

		
		return "redirect:"+PublicPath.HOME;
	}
}
