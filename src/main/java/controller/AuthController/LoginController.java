package controller.AuthController;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.UserRegisterDTO;
import enums.RoleUser;
import enums.UserStatus;
import model.Role;
import model.User;
import path.PublicPath;
import security.CustomUserDetails;
import service.LoginService;
import service.RoleService;
import service.UserService;
import share.ColorExample;

@Controller
public class LoginController {
	
	private final RoleService roleService;
	private final UserService userService;

	private final LoginService loginService;
	private Logger logger = Logger.getLogger(LoginController.class.getName());
	
	@Autowired
	public LoginController(RoleService roleService, UserService userService,
						   LoginService loginService) {
		this.roleService = roleService;
		this.userService = userService;
		this.loginService = loginService;
	}
	
	@GetMapping("/test-account")
	public String testAccount() {
		return "login-register/test-account";
	}
	
	@GetMapping("/account-status")
	public String accountStatus() {
		return "login-register/account-status";
	}
	
	@GetMapping(PublicPath.LOGIN_PAGE)
	public String loginPage() {
		return "login-register/login";
	}
	
}
