package controller;


import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.SearchService;

@Controller
public class SearchController {
	
	private final SearchService searchService;
	private final Logger logger = Logger.getLogger(SearchController.class.getName());

	@Autowired
	public SearchController(SearchService searchService) {
		this.searchService = searchService;
	}
	
	@GetMapping("/search")
	public String showSearchPage(Model model, 
								 @RequestParam("keySearch") String keySearch,
								 @RequestParam("typeSearch") String typeSearch) {
		
		List<?> searchResult = searchService.searchResult(typeSearch, keySearch);
		
		model.addAttribute("list", searchResult);
		return "result-search";
	}
	
	
	//Search recruitment with address or title
	@PostMapping({"/search/search-job", "/recruiter/search"})
	public String searchJob(RedirectAttributes redirectAttributes,
						 @RequestParam("keySearch") String keySearch, 
						 @RequestParam("typeSearch") String typeSearch) {	

		redirectAttributes.addAttribute("keySearch", keySearch);
		redirectAttributes.addAttribute("typeSearch", typeSearch);
		
		return "redirect:/search";
	}
	
}
