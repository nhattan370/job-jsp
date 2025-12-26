package dao;

import java.util.Optional;

import model.Company;
import model.FollowCompany;
import model.User;
import paginationResult.PaginationResult;

public interface FollowCompanyDAO {
	Optional<FollowCompany> findByUserAndCompany(User user, Company company);
	FollowCompany save(FollowCompany followCompany);
	void delete(FollowCompany company);
	PaginationResult<FollowCompany> findAllByUser(User user, int currentPage, int size);
	FollowCompany findById(int id);
}
