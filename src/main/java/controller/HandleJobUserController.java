package controller;

import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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
import service.SaveJobService;
import share.ColorExample;

@Controller
@RequestMapping("/user")
public class HandleJobUserController {
	
	private final Logger logger = Logger.getLogger(HandleJobUserController.class.getName());
	private final SaveJobService saveJobService;
	
	@Autowired
	public HandleJobUserController(SaveJobService saveJobService) {
		this.saveJobService = saveJobService;
	}

	@GetMapping("/save-job")
	@ResponseBody
	public String[] saveJob(@RequestParam("idRe") String idRe,
						   @AuthenticationPrincipal CustomUserDetails customUserDetails) {

		int idRec = Integer.parseInt(idRe);
		int idUser = customUserDetails.getUser().getId();
		
		try {
			logger.info(ColorExample.WHITE + idUser + ColorExample.RESET);
			saveJobService.toggleSaveJob(idRec, idUser);
			return new String[]{"Thành Công", "Lưu công việc thành công!"};
		}catch(DataIntegrityViolationException e) {
			logger.info(ColorExample.WHITE + "Không lưu việc 1" + ColorExample.RESET);
			saveJobService.deleteByRecruitmentIdAndUserId(idRec, idUser);
//			logger.info(ColorExample.WHITE + "Không lưu việc 2" + ColorExample.RESET);
			return new String[]{"Đã bỏ lưu!","Công việc đã được gỡ khỏi danh sách lưu."};
		}
	}
}
