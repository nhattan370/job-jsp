package controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import security.CustomUserDetails;

@Controller
@RequestMapping("/auth")
public class UpdateProfileController {
	@GetMapping("/profile")
	public String showProfile(@AuthenticationPrincipal CustomUserDetails details, Model model) {
		
		
		return "profile";
	}
}
