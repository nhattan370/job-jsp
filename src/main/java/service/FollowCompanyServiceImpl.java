package service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import dao.FollowCompanyDAO;
import model.Company;
import model.FollowCompany;
import model.User;
import paginationResult.PaginationResult;

@Service
@Transactional
public class FollowCompanyServiceImpl implements FollowCompanyService {

	private final FollowCompanyDAO dao;
	private final int SIZE = 2;
	
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

	@Override
	public PaginationResult<FollowCompany> findAllByUser(User user, int currentPage) {
		return dao.findAllByUser(user, currentPage, SIZE);
	}

	@Override
	public FollowCompany findById(int id) {
		return dao.findById(id);
	}

}
