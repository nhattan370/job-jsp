package controller.AuthController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	@GetMapping("/test-account")
	public String testAccount() {
		return "login-register/test-account";
	}
	
	@GetMapping("/login")
	public String loginPage() {
		return "login-register/login";
	}
}
