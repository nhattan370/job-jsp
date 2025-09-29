package controller;

import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import enums.Search;
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
	public String home(Model model, HttpSession session) {

		session.setAttribute("listType",Arrays.asList(Search.JOB.getValue(), Search.USER.getValue(), Search.ADDRESS.getValue()));
		
		model.addAttribute("stats", dashboardService.getDashboardStats());
		model.addAttribute("recruitments", recruitmentService.findTwoAndSort());
		model.addAttribute("companies",companyService.findTwoAndSort());
		return "home";
	}
	
	@GetMapping("/api/categories")
	@ResponseBody
	public List<Category> getAllCategories(){
		return categoryService.findAll();
	}

}
