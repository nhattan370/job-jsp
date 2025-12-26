package service;

import paginationResult.PaginationResult;

public interface SearchService {
	PaginationResult<?> searchResult(String typeSearch, String keySearch, int currentPage);
}
