package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import enums.ApplyPostStatus;
import model.ApplyPost;
import model.Recruitment;
import model.SaveJob;
import model.User;
import security.CustomUserDetails;
import service.ApplyPostService;
import service.RecruitmentService;
import service.SaveJobService;
import service.UploadCloudinaryService;
import share.ColorExample;

@Controller
@RequestMapping("/user")
public class HandleJobUserController {
	
	private final Logger logger = Logger.getLogger(HandleJobUserController.class.getName());
	
	private final SaveJobService saveJobService;
	private final RecruitmentService recruitmentService;
	private final UploadCloudinaryService cloudinaryService;
	private final ApplyPostService applyPostService;
	
	@Autowired
	public HandleJobUserController(SaveJobService saveJobService, UploadCloudinaryService cloudinaryService,
								   RecruitmentService recruitmentService, ApplyPostService applyPostService) {
		this.saveJobService = saveJobService;
		this.recruitmentService = recruitmentService;
		this.cloudinaryService = cloudinaryService;
		this.applyPostService = applyPostService;
	}

	@GetMapping("/save-job")
	@ResponseBody
	public Map<String, String> saveJob(@RequestParam("idRe") String re,
						@AuthenticationPrincipal CustomUserDetails customUserDetails) {
		Map<String, String> map = new HashMap<String, String>();
		User user = customUserDetails.getUser();
		Recruitment recruitment = recruitmentService.findByReferenceId(Integer.parseInt(re));
		SaveJob saveJob = saveJobService.findByRecruitmentAndUser(recruitment, user);
		
		if(saveJob==null) {
			saveJobService.save(new SaveJob(recruitment,user));
			map.put("status","save");		
		}else {
			saveJobService.delete(saveJob);
			map.put("status","delete");
		}
		map.put("key", Integer.parseInt(re)+"_"+ user.getId());
		return map;
	}
	
	@PostMapping("/apply-job")
	@ResponseBody
	public Map<String, String> applyJob(@RequestParam("file") MultipartFile file,
										@RequestParam("idRe") String idRe,
										@RequestParam("text") String text, 
										@AuthenticationPrincipal CustomUserDetails customUserDetails) throws IOException{
		Map<String, String> map = new HashMap<String, String>();
		Recruitment recruitment = recruitmentService.findByReferenceId(Integer.parseInt(idRe));
		User user = customUserDetails.getUser();
		ApplyPost applyPost = applyPostService.findByRecruitmentAndUser(recruitment, user);
		
		logger.info(ColorExample.BLUE+text+ColorExample.RESET);
		if(applyPost==null) {
			String url = cloudinaryService.upload(file);
			
			//Save applyPost
			applyPostService.save(new ApplyPost(recruitment, user, url, ApplyPostStatus.PENDING, text));
			
			map.put("status", "save");
			map.put("key", Integer.parseInt(idRe)+"_"+ user.getId());
			
		}else {
			map.put("status", "already-save");
		}
		return map;
	}
	
	@PostMapping("/apply-job1")
	@ResponseBody
	public Map<String, String> applyJob1(@RequestParam("idRe") String idRe,
										 @RequestParam("text") String text,
										 @AuthenticationPrincipal CustomUserDetails details){
		Map<String, String> map = new HashMap<String, String>();
		Recruitment recruitment = recruitmentService.findByReferenceId(Integer.parseInt(idRe));
		User user = details.getUser();
		ApplyPost applyPost = applyPostService.findByRecruitmentAndUser(recruitment, user);
		
		if(applyPost!=null) {
			map.put("status", "already-save");
		}else if(user.getCv()==null) {
			map.put("status", "no_cv");
		}else {
			applyPostService.save(new ApplyPost(recruitment, user, user.getCv().getFileName(), ApplyPostStatus.PENDING, text));
			map.put("status", "save");
			map.put("key", Integer.parseInt(idRe)+"_"+ user.getId());
		}
		
		return map;
	}
}
