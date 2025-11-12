package dao;

import java.util.Optional;

import model.Company;
import model.FollowCompany;
import model.User;

public interface FollowCompanyDAO {
	Optional<FollowCompany> findByUserAndCompany(User user, Company company);
	FollowCompany save(FollowCompany followCompany);
	void delete(FollowCompany company);
}
