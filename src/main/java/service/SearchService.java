package service;

import java.util.List;

import model.Recruitment;
import model.User;

public interface SearchService {
	List<?> searchResult(String typeSearch, String keySearch);
}
