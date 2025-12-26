package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.SearchDAO;
import enums.Search;
import exception.SearchTypeNotFoundException;
import paginationResult.PaginationResult;
import util.SearchUtil;

@Service
public class SearchServiceImpl implements SearchService{
	
	private final SearchDAO searchDAO;
	private final int SIZE = 2;

	@Autowired
	public SearchServiceImpl(SearchDAO searchDAO) {
		this.searchDAO = searchDAO;
	}

	@Override
	public PaginationResult<?> searchResult(String typeSearch, String keySearch, int currentPage) {
		String key = SearchUtil.standardizeKeySearch(keySearch);
		
		PaginationResult<?> list = null;
		if(typeSearch.equals(Search.JOB.getValue())) {
			list = searchDAO.searchTitleRecruitment(key, currentPage, SIZE);
		}
		else if(typeSearch.equals(Search.USER.getValue())) {
			list = searchDAO.searchUser(key, currentPage, SIZE);
		}else if(typeSearch.equals(Search.ADDRESS.getValue())) {
			list = searchDAO.searchAddressRecruitment(key, currentPage, SIZE);
		}else {
			throw new SearchTypeNotFoundException("Unsupport search type "+typeSearch);
		}
		
		return list;
	}
	

}




