package service;

import java.util.logging.Logger;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.SaveJobDAO;
import model.Recruitment;
import model.SaveJob;
import model.User;
import paginationResult.PaginationResult;

@Service
@Transactional
public class SaveJobServiceImpl implements SaveJobService{

	private final SaveJobDAO dao;
	private final Logger logger = Logger.getLogger(SaveJobServiceImpl.class.getName()); 
	private final int SIZE = 2;
	
	@Autowired
	public SaveJobServiceImpl(SaveJobDAO dao) {
		this.dao = dao;
	}

	@Override
	public SaveJob findByRecruitmentAndUser(Recruitment recruitment, User user) {
		SaveJob saveJob = dao.findByRecruitmentAndUser(recruitment, user).orElse(null);
		return saveJob;
	}

	@Override
	public SaveJob save(SaveJob saveJob) {
		return dao.save(saveJob);
	}

	@Override
	public void delete(SaveJob saveJob) {
		dao.delete(saveJob);		
	}

	@Override
	public PaginationResult<SaveJob> findAllByUser(User user, int currentPage) {	
		return dao.findAllByUser(user, currentPage, SIZE);
	}

	@Override
	public SaveJob getReferenceId(int id) {
		SaveJob saveJob = dao.getReferenceId(id);
		return saveJob;
	}

	@Override
	public SaveJob findById(int id) {
		SaveJob saveJob = dao.findById(id);
		return saveJob;
	}

}
