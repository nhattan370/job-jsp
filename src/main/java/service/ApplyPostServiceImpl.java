package service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ApplyPostDAO;
import model.ApplyPost;
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
	
}
