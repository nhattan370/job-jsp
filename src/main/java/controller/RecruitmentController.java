package controller;

import java.util.List;
import java.util.logging.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dto.RecruitmentDTO;
import model.Company;
import model.Recruitment;
import service.CompanyService;
import service.RecruitmentService;
import share.ColorExample;

@Controller
public class RecruitmentController {
	
	private final RecruitmentService recruitmentService;
	private final CompanyService companyService;
	private Logger logger = Logger.getLogger(RecruitmentController.class.getName());
	
	public RecruitmentController(RecruitmentService recruitmentService, CompanyService companyService) {
		this.recruitmentService = recruitmentService;
		this.companyService = companyService;
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
	public String getDetailRecruitment(Model model, @RequestParam("idRe") String idRe) {
		Recruitment recruitment = recruitmentService.findById(Integer.parseInt(idRe));
		
		model.addAttribute(recruitment);
		return "detail-post";
	}
}
