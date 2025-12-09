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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.UserDTO;
import model.Cv;
import model.User;
import path.AuthPath;
import security.CustomUserDetails;
import service.UploadCloudinaryService;
import service.UserService;
import share.ColorExample;

@Controller
public class UpdateProfileController {
	
	private final UploadCloudinaryService cloudinaryService;
	private final UserService userService;
	private final Logger logger = Logger.getLogger(UpdateProfileController.class.getName());
	
	@Autowired
	public UpdateProfileController(UploadCloudinaryService cloudinaryService, UserService userService) {
		this.cloudinaryService = cloudinaryService;
		this.userService = userService;
	}
	
	@PostMapping(AuthPath.UPLOAD_AVATAR)
	@ResponseBody
	public Map<String, String> showProfile(@AuthenticationPrincipal CustomUserDetails details, 
							  			   @RequestParam("file") MultipartFile file) {
		Map<String, String> map = new HashMap<String, String>();
		User user = details.getUser();
		try {
			String url = cloudinaryService.upload(file);	
			user.setImage(url);
			userService.update(user);
			
			map.put("url", url);
			map.put("status", "success");
		}catch(IOException e) {
			map.put("status", "error");
			logger.info(ColorExample.BLUE+e.getMessage()+ColorExample.RESET);
		}
		return map;
	}
	
	@PostMapping(AuthPath.UPLOAD_CV)
	@ResponseBody
	public Map<String, String> uploadCv(@AuthenticationPrincipal CustomUserDetails details,
										@RequestParam("file") MultipartFile file){
		Map<String, String> map = new HashMap<String, String>();
		User user = details.getUser();
		Cv cv = user.getCv();
		try {
			String url = cloudinaryService.upload(file);
			
			if(cv!=null) {
				cv.setFileName(url);	
				user.setCv(cv);
			}else {
				user.setCv(new Cv(url,user));
			}
			userService.update(user);
			map.put("status", "success");
			map.put("url", url);
		} catch (IOException e) {
			logger.info(ColorExample.GRAY+e.getMessage()+ColorExample.RESET);
			map.put("status", "error");
		}
		return map;
	}
	
	
	@GetMapping(AuthPath.PROFILE_USER)
	public String showProfile(@AuthenticationPrincipal CustomUserDetails details, Model model) {
		User user = details.getUser();
		model.addAttribute("userInformation", user);
		
		UserDTO userDto = new UserDTO(user.getAddress(), user.getDescription(), user.getEmail(), user.getFullName(), user.getPhoneNumber());
		model.addAttribute("userDto",userDto);
		return "profile-user";
	}
	
	@PostMapping(AuthPath.UPDATE_USER)
	public String updateProfile(@Valid @ModelAttribute("userDto") UserDTO userDTO, BindingResult result, Model model,
								@AuthenticationPrincipal CustomUserDetails details, RedirectAttributes redirectAttributes) {
		User user = details.getUser();
		
		if(!result.hasErrors()) {
			user.setAddress(userDTO.getAddress());
			user.setDescription(userDTO.getDescription());
			user.setEmail(userDTO.getEmail());
			user.setFullName(userDTO.getFullName());
			user.setPhoneNumber(userDTO.getPhoneNumber());
			
			userService.update(user);
			redirectAttributes.addFlashAttribute("mes", "Cập nhật thành công");
			redirectAttributes.addFlashAttribute("status", "success");
			return "redirect:"+AuthPath.PROFILE_USER;
		}else {
		    model.addAttribute("mes", "Lỗi cập nhật");
		    model.addAttribute("status", "error");
			return "profile-user";
		}
	}
}
