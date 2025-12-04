package controller;

import java.util.List;
import java.util.logging.Logger;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.RecruitmentDTO;
import model.Category;
import model.Company;
import model.Recruitment;
import security.CustomUserDetails;
import service.CategoryService;
import service.RecruitmentService;
import share.ColorExample;

@Controller
@RequestMapping("/recruiter")
public class RecruiterPostController {
	
	private final CategoryService categoryService;
	private final RecruitmentService recruitmentService;
	private final Logger logger = Logger.getLogger(RecruiterPostController.class.getName());
	
	@Autowired
	public RecruiterPostController(CategoryService categoryService, RecruitmentService recruitmentService) {
		this.categoryService = categoryService;
		this.recruitmentService = recruitmentService;
	}
	
	@GetMapping("/show-post")
	public String showPost(Model model, @RequestParam(required = false, name="id") Integer id) {
		Recruitment recruitment = (id==null) ? new Recruitment() : recruitmentService.findById(id);
		RecruitmentDTO recruitmentDTO = new RecruitmentDTO();
		BeanUtils.copyProperties(recruitment,recruitmentDTO);
		if(id==null) logger.info(ColorExample.GREEN+"null id show post"+ColorExample.RESET);
		model.addAttribute("categories",categoryService.findAll());
		model.addAttribute("reDTO",recruitmentDTO);
		return "post-job";
	}
	
	@PostMapping("/handle-post")
	public String addOrEditPost(@Valid @ModelAttribute("reDTO") RecruitmentDTO recruitmentDTO, 
								BindingResult bindingResult,
							    Model model,RedirectAttributes redirectAttributes, 
							    @RequestParam(required = false, name =  "id") Integer id,
							    @AuthenticationPrincipal CustomUserDetails details) {
		Company company = details.getUser().getCompany();
		if(id==null) logger.info(ColorExample.GREEN+"null id handle post"+ColorExample.RESET);
		if(bindingResult.hasErrors()) {
			model.addAttribute("categories",categoryService.findAll());
			model.addAttribute("reDTO",recruitmentDTO);
			model.addAttribute("mes", "Lỗi rồi");
			model.addAttribute("status", "error");
			return "post-job";
		}
		
		Recruitment recruitment = recruitmentService.saveOrUpdate(id, recruitmentDTO, company);
		redirectAttributes.addFlashAttribute("mes", (id==null) ? "Tạo mới thành công" : "Cập nhật thành công");
		redirectAttributes.addFlashAttribute("status","success");
		return "redirect:/recruiter/show-post?id="+recruitment.getId();
	}
	
	@GetMapping("/list-post")
	public String listPost(Model model) {
		return "";
	}
}
