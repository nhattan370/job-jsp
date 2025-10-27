package controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import service.UploadCloudinaryService;

@Controller
public class UploadController {
	
	@Autowired
	private UploadCloudinaryService cloudinaryService;
	
	@GetMapping("/upload-form")
	public String formUpload(HttpServletResponse response) {
	    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    response.setHeader("Pragma", "no-cache");
	    response.setDateHeader("Expires", 0);
	    return "upload-form";
	}
	
	@PostMapping("/upload-test")
	public String uploadTest(Model model, @RequestParam("file") MultipartFile file) {
		try {
			String url = cloudinaryService.upload(file);
			model.addAttribute("url", url);
			model.addAttribute("message", "Lưu thành công");
		}catch(Exception e) {
			model.addAttribute("message", "Lỗi rồi bồ");
		}
		return "upload-test";
	}
}
