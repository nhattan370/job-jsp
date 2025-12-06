package controller.AuthController;

import javax.validation.Valid;

import org.hibernate.validator.internal.util.privilegedactions.NewInstance;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.util.BeanUtil;

import dto.UserDTO;
import enums.RoleUser;
import enums.UserStatus;
import model.User;
import service.RoleService;
import service.UserService;

@Controller
public class LoginController {
	
	private final RoleService roleService;
	private final UserService userService;
	
	@Autowired
	public LoginController(RoleService roleService, UserService userService) {
		this.roleService = roleService;
		this.userService = userService;
	}
	
	@GetMapping("/test-account")
	public String testAccount() {
		return "login-register/test-account";
	}
	
	@GetMapping("/login")
	public String loginPage() {
		return "login-register/login";
	}
	
	@GetMapping("/show-register")
	public String showRegister(Model model) {
		model.addAttribute("userDTO", new UserDTO());
		model.addAttribute("roles", roleService.findAll());
		return "login-register/register";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("userDTO") UserDTO userDTO, BindingResult bindingResult,
						   RedirectAttributes redirectAttributes, Model model) {
		User user = new User();
		String urlSuccess="";
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("roles", roleService.findAll());
			redirectAttributes.addFlashAttribute("mes", "Có lỗi rồi");
			redirectAttributes.addFlashAttribute("status", "error");
			return "register";
		}
		if(userDTO.getRole() != null &&userDTO.getRole().getRoleName().equals(RoleUser.ADMIN)) {
			throw new IllegalArgumentException("Bạn không có quyền chọn ADMIN");
		}
		
		BeanUtils.copyProperties(userDTO, user);
		
		if(userDTO.getRole().getRoleName().equals(RoleUser.APPLICANT)) {
			user.setStatus(UserStatus.ACTIVE);
			urlSuccess="redirect:/";
		}
		else if(userDTO.getRole().getRoleName().equals(RoleUser.RECRUITER)) {
			user.setStatus(UserStatus.DISABLED);
			urlSuccess="redirect:/recruiter/show-verified-page";
		}
		
		userService.save(user);
		
		redirectAttributes.addFlashAttribute("mes", "Đăng kí thành công");
		redirectAttributes.addFlashAttribute("status","success");
		return urlSuccess;
	}
}
