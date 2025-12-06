package service;

import java.util.Collections;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ApplyPostDAO;
import enums.ApplyPostStatus;
import enums.RoleUser;
import model.ApplyPost;
import model.Company;
import model.Recruitment;
import model.User;

@Service
@Transactional
public class ApplyPostServiceImpl implements ApplyPostService {
	
	private final ApplyPostDAO dao;
	
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

	@Override
	public List<ApplyPost> findAllByUser(User user) {
		return user.getRole().getRoleName()==RoleUser.APPLICANT ? dao.findAllByUser(user) : Collections.emptyList();
	}

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
	public List<ApplyPost> findAllByUserAndStatus(User user, ApplyPostStatus applyPostStatus, Boolean exclude) {
		List<ApplyPost> applyPosts = dao.findAllByUserAndStatus(user, applyPostStatus, exclude);
		return applyPosts;
	}

	@Override
	public List<ApplyPost> findByRecruitmentAndRecruiter(Recruitment recruitment, User recruiter) {
		List<ApplyPost> applyPosts = dao.findByRecruitmentAndRecruiter(recruitment, recruiter);
		return applyPosts;
	}

	@Override
	public List<ApplyPost> findAllByCompany(Company company) {
		return dao.findAllByCompany(company);
	}
	
}
