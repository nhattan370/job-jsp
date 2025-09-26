package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import service.CategoryService;
import service.DashboardService;

@Controller
@RequestMapping("/")
public class HomeController {
	
	private final CategoryService categoryService;
	private final DashboardService dashboardService;
	
	@Autowired
	public HomeController(CategoryService categoryService, DashboardService dashboardService) {
		this.categoryService = categoryService;
		this.dashboardService = dashboardService;
	}
	
	
	@GetMapping
	public String home(Model model) {
		model.addAttribute("stats", dashboardService.getDashboardStats());
		model.addAttribute("categories",categoryService.findAll());
		
		return "home";
	}

}
