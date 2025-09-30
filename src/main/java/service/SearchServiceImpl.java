package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.SearchDAO;
import enums.Search;
import exception.SearchTypeNotFoundException;
import util.SearchUtil;

@Service
public class SearchServiceImpl implements SearchService{
	
	private final SearchDAO searchDAO;

	@Autowired
	public SearchServiceImpl(SearchDAO searchDAO) {
		this.searchDAO = searchDAO;
	}

	@Override
	public List<?> searchResult(String typeSearch, String keySearch) {
		String key = SearchUtil.standardizeKeySearch(keySearch);
		
		List<?> list = null;
		if(typeSearch.equals(Search.JOB.getValue())) {
			list = searchDAO.searchTitleRecruitment(key);
		}
		else if(typeSearch.equals(Search.USER.getValue())) {
			list = searchDAO.searchUser(key);
		}else if(typeSearch.equals(Search.ADDRESS.getValue())) {
			list = searchDAO.searchAddressRecruitment(key);
		}else {
			throw new SearchTypeNotFoundException("Unsupport search type "+typeSearch);
		}
		
		return list;
	}
	

}




