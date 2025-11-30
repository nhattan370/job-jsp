package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.CompanyDTO;
import model.Company;
import model.User;
import security.CustomUserDetails;
import service.CompanyService;
import service.UploadCloudinaryService;
import service.UserService;
import share.ColorExample;

@Controller
@RequestMapping("/recruiter")
public class RecruiterController {
	
	private CompanyService companyService;
	private UserService userService;
	private UploadCloudinaryService cloudinaryService;
	private Logger logger = Logger.getLogger(RecruiterController.class.getName());
	
	@Autowired
	public RecruiterController(CompanyService companyService, UserService userService, UploadCloudinaryService cloudinaryService) {
		this.companyService = companyService;
		this.userService = userService;
		this.cloudinaryService = cloudinaryService;
	}
	
	@GetMapping("/profile-company")
	public String showProfilePage(Model model, @AuthenticationPrincipal CustomUserDetails details) {
		Company company = details.getUser().getCompany();
		CompanyDTO companyDTO = new CompanyDTO(company.getId(), company.getEmail(), company.getNameCompany(), company.getAddress(), company.getPhoneNumber(), company.getDescription());
		
		model.addAttribute("companyDTO",companyDTO);
		return "profile-company";
	}
	
	@PostMapping("/update-company")
	public String updateCompany(@Valid @ModelAttribute("companyDTO") CompanyDTO companyDTO, BindingResult bindingResult, Model model,
								RedirectAttributes redirectAttributes, @AuthenticationPrincipal CustomUserDetails details) {
		User user = details.getUser();
		Company company = user.getCompany();
		if(!bindingResult.hasErrors()) {
			company.setEmail(companyDTO.getEmail());
			company.setNameCompany(companyDTO.getName());
			company.setAddress(companyDTO.getAddress());
			company.setPhoneNumber(companyDTO.getPhoneNumber());
			company.setDescription(companyDTO.getDescription());
			
			user.setCompany(company);
			userService.update(user);
			
			redirectAttributes.addFlashAttribute("mes", "Cập nhật thành công");
			redirectAttributes.addFlashAttribute("status","success");
			return "redirect:/recruiter/profile-company";
		}else {
			model.addAttribute("mes", "Lỗi Cập nhật");
			model.addAttribute("status", "error");
			return "profile-company";
		}
	}
	
	@PostMapping("/upload-logo")
	@ResponseBody
	public Map<String, String> uploadLogo(@RequestParam("file") MultipartFile file, @AuthenticationPrincipal CustomUserDetails details){
		Map<String, String> map = new HashMap<String, String>();
		User user = details.getUser();
		Company company = user.getCompany();
		
		try {
			String url = cloudinaryService.upload(file);
			
			company.setLogo(url);
			user.setCompany(company);
			userService.update(user);
			
			map.put("url", url);
			map.put("status", "success");
		} catch (IOException e) {
			map.put("status", "error");
			logger.info(ColorExample.CYAN+e.getMessage()+ColorExample.RESET);
		}
		return map;
	}
}
