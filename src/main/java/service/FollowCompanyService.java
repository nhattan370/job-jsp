package service;

import java.util.List;

import model.Company;
import model.FollowCompany;
import model.User;

public interface FollowCompanyService {
	FollowCompany findByUserAndCompany(User user, Company company);
	FollowCompany save(FollowCompany followCompany);
	void delete(FollowCompany followCompany);
	List<FollowCompany> findAllByUser(User user);
	FollowCompany findById(int id);
}
