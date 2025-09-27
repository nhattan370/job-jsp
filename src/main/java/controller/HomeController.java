package controller;

import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import model.Category;
import service.CategoryService;
import service.DashboardService;
import share.ColorExample;

@Controller
public class HomeController {
	
	private final CategoryService categoryService;
	private final DashboardService dashboardService;
	private final Logger logger = Logger.getLogger(HomeController.class.getName());
	
	@Autowired
	public HomeController(CategoryService categoryService, DashboardService dashboardService) {
		this.categoryService = categoryService;
		this.dashboardService = dashboardService;
	}
	
	
	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("stats", dashboardService.getDashboardStats());
		return "home";
	}
	
	@GetMapping("/api/categories")
	@ResponseBody
	public List<Category> getAllCategories(){
		logger.info(ColorExample.GREEN + "Hello" +ColorExample.RESET);
		return categoryService.findAll();
	}

}
