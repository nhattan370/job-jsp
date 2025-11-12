package service;

import model.Company;
import model.FollowCompany;
import model.User;

public interface FollowCompanyService {
	FollowCompany findByUserAndCompany(User user, Company company);
	FollowCompany save(FollowCompany followCompany);
	void delete(FollowCompany followCompany);
}
