package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.SaveJob;
import model.User;
import security.CustomUserDetails;
import service.SaveJobService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	private final SaveJobService saveJobService;
	
	@Autowired
	public UserController(SaveJobService saveJobService) {
		this.saveJobService = saveJobService;
	}

	@GetMapping("/list-save-job")
	public String getListSaveJob(Model model, @AuthenticationPrincipal CustomUserDetails details) {
		User user = details.getUser();
		List<SaveJob> saveJobs = saveJobService.findByUser(user);
		
		model.addAttribute("saveJobList", saveJobs);
		return "list-save-job";
	}
	
	@PostMapping("/delete-save-job")
	public String deleteSaveJob(@RequestParam("id-save-job") int idSaveJob, HttpSession session) {
		session.setAttribute("mes", "Bỏ lưu thành công");
		saveJobService.delete(idSaveJob);
		return "redirect:/user/list-save-job";
	}
}
