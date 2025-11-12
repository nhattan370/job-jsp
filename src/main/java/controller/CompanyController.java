package controller;

import java.util.HashMap;
import java.util.Map;

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

@Controller
public class CompanyController {
	
	private final CompanyService companyService;
	private final FollowCompanyService followCompanyService;
	
	@Autowired
	public CompanyController(CompanyService companyService, FollowCompanyService followCompanyService) {
		this.companyService = companyService;
		this.followCompanyService = followCompanyService;
	}
	
	@GetMapping("/detail-company")
	public String showDetailCompany(Model model, @RequestParam("id") String id) {
		Company company = companyService.findById(Integer.parseInt(id));
		model.addAttribute(company);
		return "detail-company";
	}
	
	@PostMapping("/user/follow-company/")
	@ResponseBody
	public Map<String, String> followCompany(@RequestParam("idCompany") String idCompany,
											 @AuthenticationPrincipal CustomUserDetails details){
		Map<String, String> map = new HashMap<String, String>();
		User user = details.getUser();
		Company company = companyService.getReference(Integer.parseInt(idCompany));
		
		FollowCompany fc = followCompanyService.findByUserAndCompany(user, company);
		
		if(fc==null) {
			map.put("status", "follow");
			followCompanyService.save(fc);
		}else {
			map.put("status", "unfollow");
			followCompanyService.delete(fc);
		}
		map.put("key", idCompany+"_"+user.getId());
		return map;
	}
}
