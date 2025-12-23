package service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ApplyPostDAO;
import enums.ApplyPostStatus;
import model.ApplyPost;
import model.Company;
import model.Recruitment;
import model.User;
import paginationResult.PaginationResult;

@Service
@Transactional
public class ApplyPostServiceImpl implements ApplyPostService {
	
	private final ApplyPostDAO dao;
	private final int SIZE = 2;
	
	@Autowired
	public ApplyPostServiceImpl(ApplyPostDAO applyPostDAO) {
		this.dao = applyPostDAO;
	}

	@Override
	public ApplyPost save(ApplyPost applyPost) {
		return dao.save(applyPost);
	}

	@Override
	public ApplyPost findByRecruitmentAndUser(Recruitment recruitment, User user) {
		ApplyPost applyPost = dao.findByRecruitmentAndUser(recruitment, user).orElse(null);
		return applyPost;
	}

//	@Override
//	public List<ApplyPost> findAllByUser(User user) {
//		return user.getRole().getRoleName()==RoleUser.APPLICANT ? dao.findAllByUser(user) : Collections.emptyList();
//	}

	@Override
	public ApplyPost findById(int id) {
		ApplyPost applyPost = dao.findById(id);
		return applyPost;
	}

	@Override
	public ApplyPost update(ApplyPost applyPost) {
		return dao.update(applyPost);
	}

	@Override
	public PaginationResult<ApplyPost> findAllByUserAndStatus(User user, ApplyPostStatus applyPostStatus, int currentPage, Boolean exclude) {
		return dao.findAllByUserAndStatus(user, applyPostStatus, currentPage, SIZE, exclude);
	}

	@Override
	public PaginationResult<ApplyPost> findByRecruitmentAndRecruiter(Recruitment recruitment, User recruiter, int currentPage) {
		PaginationResult<ApplyPost> applyPosts = dao.findByRecruitmentAndRecruiter(recruitment, recruiter, currentPage, SIZE);
		return applyPosts;
	}

	@Override
	public PaginationResult<ApplyPost> findAllByCompany(Company company, int currentPage) {
		return dao.findAllByCompany(company, currentPage, SIZE);
	}
	
}
