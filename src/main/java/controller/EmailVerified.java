package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/recruiter")
public class EmailVerified {
	@GetMapping("/show-verified-page")
	public String showVerfiedPage() {
		return "email-comfirm";
	}
}
