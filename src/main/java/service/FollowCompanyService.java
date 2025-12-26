package service;

import java.util.List;

import model.Company;
import model.FollowCompany;
import model.User;
import paginationResult.PaginationResult;

public interface FollowCompanyService {
	FollowCompany findByUserAndCompany(User user, Company company);
	FollowCompany save(FollowCompany followCompany);
	void delete(FollowCompany followCompany);
	PaginationResult<FollowCompany> findAllByUser(User user, int currentPage);
	FollowCompany findById(int id);
}
