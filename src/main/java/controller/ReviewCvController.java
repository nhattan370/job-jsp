package controller;

import java.net.MalformedURLException;

import org.springframework.http.HttpHeaders;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import enums.ApplyPostStatus;
import model.ApplyPost;
import model.Company;
import model.User;
import security.CustomUserDetails;
import service.ApplyPostService;

@Controller
@RequestMapping("/recruiter")
public class ReviewCvController {
	
	private ApplyPostService applyPostService;
	
	@Autowired
	public ReviewCvController(ApplyPostService applyPostService) {
		this.applyPostService = applyPostService;
	}
	
	@GetMapping("/handle-cv/{id}")
	public ResponseEntity<Resource> showCv(@PathVariable("id") String id, @RequestParam("status") String status) throws MalformedURLException {
		ApplyPost applyPost = applyPostService.findById(Integer.parseInt(id));
		
		applyPost.setStatus(ApplyPostStatus.VIEWED);
		applyPostService.update(applyPost);
		
		Resource resource = new UrlResource(applyPost.getNameCv());
		return ResponseEntity.ok()
				.contentType(MediaType.APPLICATION_PDF)
				.body(resource);
	}
	
	@GetMapping("/applicants")
	public String showApplicants(Model model, @AuthenticationPrincipal CustomUserDetails customUserDetails) {
		User user = customUserDetails.getUser();
		Company company = user.getCompany();
		List<ApplyPost> applyPosts = applyPostService.findAllByCompany(company);
		
		model.addAttribute("applyPosts", applyPosts);
		return "list-user";
	}
}
