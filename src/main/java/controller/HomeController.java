package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import service.CategoryService;

@Controller
@RequestMapping("/")
@Slf4j
public class HomeController {
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping
	public String home() {
		return "home";
	}
}
