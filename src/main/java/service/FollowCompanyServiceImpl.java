package service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import dao.FollowCompanyDAO;
import model.Company;
import model.FollowCompany;
import model.User;

@Service
@Transactional
public class FollowCompanyServiceImpl implements FollowCompanyService {

	private final FollowCompanyDAO dao;
	
	public FollowCompanyServiceImpl(FollowCompanyDAO followCompanyDAO) {
		this.dao = followCompanyDAO;
	}
	
	@Override
	public FollowCompany findByUserAndCompany(User user, Company company) {
		FollowCompany followCompany = dao.findByUserAndCompany(user, company).orElse(null);
		return followCompany;
	}

	@Override
	public FollowCompany save(FollowCompany followCompany) {
		return dao.save(followCompany);
	}

	@Override
	public void delete(FollowCompany followCompany) {
		dao.delete(followCompany);
		
	}

}
