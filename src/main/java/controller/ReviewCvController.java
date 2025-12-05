package controller;

import java.net.MalformedURLException;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;

import java.util.List;
import java.util.logging.Logger;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import enums.ApplyPostStatus;
import model.ApplyPost;
import model.Company;
import model.User;
import security.CustomUserDetails;
import service.ApplyPostService;
import share.ColorExample;

@Controller
@RequestMapping("/recruiter")
public class ReviewCvController {
	
	private ApplyPostService applyPostService;
	private Logger logger = Logger.getLogger(ReviewCvController.class.getName());
	
	@Autowired
	public ReviewCvController(ApplyPostService applyPostService) {
		this.applyPostService = applyPostService;
	}
	
	@PostMapping("/view-cv")
	public ResponseEntity<String> viewCv(@RequestParam("id") Integer id) {
		logger.info(ColorExample.CYAN+id+ColorExample.RESET);
	    try {
	        ApplyPost ap = applyPostService.findById(id);

	        // cập nhật trạng thái
	        ap.setStatus(ApplyPostStatus.VIEWED);
	        applyPostService.update(ap);

	        // trả về link Cloudinary
	        return ResponseEntity.ok(ap.getNameCv());

	    } catch (Exception e) {
	    	System.out.println(e.getMessage());
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("error");
	    }
	}

	
	@PostMapping("/handle-cv")
	public ResponseEntity<String> handleCv(@RequestParam("idApply") Integer id, @RequestParam("status") String status) {
		try {
			ApplyPost applyPost = applyPostService.findById(id);
			applyPost.setStatus(ApplyPostStatus.valueOf(status));
			applyPostService.update(applyPost);
			return ResponseEntity.ok(applyPost.getNameCv());			
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("error");
		}
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
