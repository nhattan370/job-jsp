package controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import enums.Search;
import service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	private final SearchService searchService;

	@Autowired
	public SearchController(SearchService searchService) {
		this.searchService = searchService;
	}
	
	@PostMapping
	public String search(RedirectAttributes redirectAttributes,
						 @RequestParam("keySearch") String keySearch, 
						 @RequestParam("typeSearch") String typeSearch) {
		//Check keySearch not empty
		while(keySearch.trim().equals("")) {
			//Show swal
		}
		
		//Thực hiện tác vụ tìm kiếm trong service và lưu vào redirectAttribute
		redirectAttributes.addFlashAttribute("list", searchService.searchResult(typeSearch, keySearch));
		//Lưu giá trị keySearch và typeSearch vào redirectAttribute
		redirectAttributes.addAttribute("keySearch", keySearch);
		redirectAttributes.addFlashAttribute("typeSearch", typeSearch);
		
		
		
		return "redirect:/";
	}
	
}
