package controller;

import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Recruitment;
import model.SaveJob;
import model.User;
import security.CustomUserDetails;
import service.RecruitmentService;
import service.SaveJobService;
import share.ColorExample;

@Controller
@RequestMapping("/user")
public class HandleJobUserController {
	
	private final Logger logger = Logger.getLogger(HandleJobUserController.class.getName());
	private final SaveJobService saveJobService;
	private final RecruitmentService recruitmentService;
	
	@Autowired
	public HandleJobUserController(SaveJobService saveJobService, 
								   RecruitmentService recruitmentService) {
		this.saveJobService = saveJobService;
		this.recruitmentService = recruitmentService;
	}

	@GetMapping("/save-job")
	@ResponseBody
	public Map<String, String> saveJob(@RequestParam("idRe") String re, HttpSession session,
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
}
