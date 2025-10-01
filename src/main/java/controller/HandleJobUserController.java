package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class HandleJobUserController {
	
	@PostMapping("/save-job")
	@ResponseBody
	public String saveJob(@RequestParam("idRe") String idRe) {
		
		//Handle logic loggin
		//if(chưa đăng nhập){
		//return "unauthorize"
		//};
		
		//Finding it in CSDL(savejob)
		
		//Save job in CSDL if it haven't appear
		
		return null;
	}
}
