package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import enums.ApplyPostStatus;
import model.ApplyPost;
import model.SaveJob;
import model.User;
import paginationResult.PaginationResult;
import path.ApplicantPath;
import security.CustomUserDetails;
import service.ApplyPostService;
import service.SaveJobService;

@Controller
public class UserController {
	
	private final SaveJobService saveJobService;
	private final ApplyPostService applyPostService;
	
	@Autowired
	public UserController(SaveJobService saveJobService, ApplyPostService applyPostService) {
		this.saveJobService = saveJobService;
		this.applyPostService = applyPostService;
	}

	@GetMapping(ApplicantPath.LIST_SAVE_JOB)
	public String getListSaveJob(Model model, @RequestParam(name="page", defaultValue = "1") Integer page,
								 @AuthenticationPrincipal CustomUserDetails details) {
		User user = details.getUser();
		PaginationResult<SaveJob> saveJobs = saveJobService.findAllByUser(user, page);
		
		model.addAttribute("saveJobList", saveJobs);
		return "list-save-job";
	}
	
	@GetMapping(ApplicantPath.LIST_APPLY)
	public String getListApply(Model model, @RequestParam(name="page", defaultValue = "1") Integer page, 
							   @AuthenticationPrincipal CustomUserDetails details) {
		User user = details.getUser();
		PaginationResult<ApplyPost> applyPosts = applyPostService.findAllByUserAndStatus(user, ApplyPostStatus.WITHDRAWN, page, true);
		
		model.addAttribute("applyJobList", applyPosts);
		return "list-apply-job";
	}
	
	@PostMapping(ApplicantPath.DELETE_SAVE_JOB)
	@ResponseBody
	public Map<String, String> deleteSaveJob(@RequestParam("idSa") String idSa,
			@AuthenticationPrincipal CustomUserDetails details) {
		User user = details.getUser();
		Map<String, String> map = new HashMap<String, String>();
		SaveJob saveJob = saveJobService.findById(Integer.parseInt(idSa));
		
		saveJobService.delete(saveJob);
		map.put("key", saveJob.getRecruitment().getId() + "_" + user.getId());
		map.put("status", "delete");
		return map;
	}
	
	@PostMapping(ApplicantPath.DELETE_APPLY_JOB)
	@ResponseBody
	public Map<String, String> deleteApply(@RequestParam("idApply") String idApply,
										   @AuthenticationPrincipal CustomUserDetails details){
		User user = details.getUser();
		Map<String, String> map = new HashMap<String, String>();
		ApplyPost applyPost = applyPostService.findById(Integer.parseInt(idApply));
		
		applyPost.setStatus(ApplyPostStatus.WITHDRAWN);
		applyPostService.update(applyPost);
		
		map.put("status", "delete");
		map.put("key", applyPost.getRecruitment().getId()+"_"+user.getId());
		
		return map;
	}
}
