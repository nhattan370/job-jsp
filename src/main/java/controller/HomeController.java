package controller;

import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Category;
import service.CategoryService;
import service.CompanyService;
import service.DashboardService;
import service.RecruitmentService;
import share.ColorExample;

@Controller
public class HomeController {
	
	private final CategoryService categoryService;
	private final DashboardService dashboardService;
	private final RecruitmentService recruitmentService;
	private final CompanyService companyService;
	private final Logger logger = Logger.getLogger(HomeController.class.getName());
	
	@Autowired
	public HomeController(CategoryService categoryService, DashboardService dashboardService, RecruitmentService recruitmentService, CompanyService companyService) {
		this.categoryService = categoryService;
		this.dashboardService = dashboardService;
		this.recruitmentService = recruitmentService;
		this.companyService = companyService;
	}
	
	
	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("stats", dashboardService.getDashboardStats());
		model.addAttribute("recruitments", recruitmentService.findTwoAndSort());
		model.addAttribute("companies",companyService.findTwoAndSort());
		return "home";
	}
	
	@GetMapping("/api/categories")
	@ResponseBody
	public List<Category> getAllCategories(){
		logger.info(ColorExample.GREEN + "Hello" +ColorExample.RESET);
		return categoryService.findAll();
	}

}
