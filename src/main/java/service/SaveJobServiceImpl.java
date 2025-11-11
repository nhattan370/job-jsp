package service;

import java.util.List;
import java.util.logging.Logger;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.SaveJobDAO;
import model.Recruitment;
import model.SaveJob;
import model.User;

@Service
@Transactional
public class SaveJobServiceImpl implements SaveJobService{

	private final SaveJobDAO dao;
	private final Logger logger = Logger.getLogger(SaveJobServiceImpl.class.getName()); 
	
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
	public List<SaveJob> findAllByUser(User user) {
		return dao.findAllByUser(user);
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
