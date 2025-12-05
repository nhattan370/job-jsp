package controller;

import java.util.List;
import java.util.logging.Logger;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dto.RecruitmentDTO;
import enums.RoleUser;
import model.ApplyPost;
import model.Category;
import model.Company;
import model.Recruitment;
import security.CustomUserDetails;
import service.ApplyPostService;
import service.CategoryService;
import service.CompanyService;
import service.RecruitmentService;
import share.ColorExample;

@Controller
public class RecruitmentController {
	
	private final RecruitmentService recruitmentService;
	private final CompanyService companyService;
	private final ApplyPostService applyPostService;
	private final CategoryService categoryService;
	private Logger logger = Logger.getLogger(RecruitmentController.class.getName());
	
	public RecruitmentController(RecruitmentService recruitmentService, CompanyService companyService, 
								 ApplyPostService applyPostService, CategoryService categoryService) {
		this.recruitmentService = recruitmentService;
		this.companyService = companyService;
		this.applyPostService = applyPostService;
		this.categoryService = categoryService;
	}
	
	@GetMapping("/company-post")
	public String listRecruitment(Model model, @RequestParam("idCompany") String id) {
		Company company = companyService.getReference(Integer.parseInt(id));
		
		List<RecruitmentDTO> recruitments = recruitmentService.findAllByCompany(company);
		
		logger.info(ColorExample.GRAY+recruitments.size()+ColorExample.RESET);
		model.addAttribute("recruitments",recruitments);
		return "list-re";
	}
	
	@GetMapping("/detail-recruitment")
	public String getDetailRecruitment(Model model, @AuthenticationPrincipal CustomUserDetails details,
										@RequestParam("idRe") String idRe) {
		Recruitment recruitment = recruitmentService.findById(Integer.parseInt(idRe));
		
		if(details==null || details.getUser().getRole().getRoleName().equals(RoleUser.USER)) {
			List<RecruitmentDTO> recruitments = recruitmentService.findAll();
			model.addAttribute("recruitments",recruitments);
		}else if(details.getUser().getRole().getRoleName().equals(RoleUser.RECRUITER) && details.getUser().getId().equals(recruitment.getCompany().getUser().getId())) {
			List<ApplyPost> applyPosts = applyPostService.findByRecruitmentAndRecruiter(recruitment, details.getUser());
			model.addAttribute("applyPosts",applyPosts);
		}
		model.addAttribute(recruitment);
		return "detail-post";
	}
	
	@GetMapping("/job-show")
	public String getListJob(Model model) {
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		return "list-job";
	}
	
	@GetMapping("/recruitments-by-category")
	public String getListRecruitmentByCategory(Model model, @RequestParam("idCa") String id) {
		Category category = categoryService.getReferenceId(Integer.parseInt(id));
		List<RecruitmentDTO> recruitments = recruitmentService.findAllByCategory(category);
		
		model.addAttribute("recruitments",recruitments);
		return "list-re";
	}
}
