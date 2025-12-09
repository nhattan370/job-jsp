package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import path.RecruiterPath;

@Controller
public class EmailVerified {
	
	@GetMapping(RecruiterPath.VERIFY_PAGE)
	public String showVerfiedPage() {
		return "email-confirm";
	}
}
