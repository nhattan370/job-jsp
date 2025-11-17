package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Company;
import model.FollowCompany;
import model.User;
import security.CustomUserDetails;
import service.CompanyService;
import service.FollowCompanyService;
import share.ColorExample;

@Controller
public class CompanyController {
	
	private final CompanyService companyService;
	private final FollowCompanyService followCompanyService;
	private final Logger logger = Logger.getLogger(CompanyController.class.getName());
	
	@Autowired
	public CompanyController(CompanyService companyService, FollowCompanyService followCompanyService) {
		this.companyService = companyService;
		this.followCompanyService = followCompanyService;
	}
	
	@GetMapping("/detail-company")
	public String showDetailCompany(Model model, @RequestParam("idCompany") String id) {
		Company company = companyService.findById(Integer.parseInt(id));
		model.addAttribute(company);
		return "detail-company";
	}
	
	@GetMapping("/user/list-follow-company")
	public String getListFollowCompany(Model model, @AuthenticationPrincipal CustomUserDetails customUserDetails) {
		User user = customUserDetails.getUser();
		List<FollowCompany> followCompanies = followCompanyService.findAllByUser(user);

		model.addAttribute("followCompanies", followCompanies);

		return "list-follow-company";
	}
	
	@PostMapping("/user/follow-company")
	@ResponseBody
	public Map<String, String> followCompany(@RequestParam("idCompany") String idCompany,
											 @AuthenticationPrincipal CustomUserDetails details){
		Map<String, String> map = new HashMap<String, String>();
		User user = details.getUser();
		Company company = companyService.getReference(Integer.parseInt(idCompany));
		
		FollowCompany fc = followCompanyService.findByUserAndCompany(user, company);
		if(fc==null) {
			followCompanyService.save(new FollowCompany(company, user));
			map.put("status", "follow");
		}else {
			followCompanyService.delete(fc);
			map.put("status", "unfollow");
		}
		map.put("key", idCompany+"_"+user.getId());
		return map;
	}
	
	@PostMapping("/user/delete-follow-company")
	@ResponseBody
	public Map<String, String> deleteFollowCompany(@RequestParam("idFc") String idFc){
		Map<String, String> map = new HashMap<String, String>();
		FollowCompany fc = followCompanyService.findById(Integer.parseInt(idFc));
		
		if(fc!=null) {
			followCompanyService.delete(fc);
			map.put("status", "delete");
			map.put("key", fc.getCompany().getId()+"_"+fc.getUser().getId());
		}else {
			map.put("status", "not_found");
		}
		
		return map;
	}
	
}
