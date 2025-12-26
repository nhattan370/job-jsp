package controller;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import paginationResult.PaginationResult;
import path.PublicPath;
import path.RecruiterPath;
import service.SearchService;

@Controller
public class SearchController {
	
	private final SearchService searchService;
	private final Logger logger = Logger.getLogger(SearchController.class.getName());

	@Autowired
	public SearchController(SearchService searchService) {
		this.searchService = searchService;
	}
	
	@GetMapping(PublicPath.SEARCH)
	public String showSearchPage(Model model, @RequestParam(name="page", defaultValue = "1") Integer page,
								 @RequestParam("keySearch") String keySearch,
								 @RequestParam("typeSearch") String typeSearch) {
		
		PaginationResult<?> searchResult = searchService.searchResult(typeSearch, keySearch, page);
		
		model.addAttribute("list", searchResult);
		return "result-search";
	}
	
	//Search recruitment with address or title
	@GetMapping({PublicPath.SEARCH_JOB, RecruiterPath.SEARCH_APPLICANT})
	public String searchJob(RedirectAttributes redirectAttributes,
						 @RequestParam("keySearch") String keySearch, 
						 @RequestParam("typeSearch") String typeSearch,
						 @RequestParam(name="page", defaultValue = "1") Integer page) {	

		redirectAttributes.addAttribute("keySearch", keySearch);
		redirectAttributes.addAttribute("typeSearch", typeSearch);
		redirectAttributes.addAttribute("page", page);
		
		return "redirect:"+PublicPath.SEARCH;
	}
	
	@GetMapping("/search/test")
	public String test() {
		return "post-list";
	}
	
}
