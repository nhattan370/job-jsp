package service;


import java.awt.Color;
import java.util.logging.Logger;

import javax.annotation.PostConstruct;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;

import dao.SaveJobDAO;
import model.Recruitment;
import model.SaveJob;
import model.User;
import share.ColorExample;

@Service
public class SaveJobServiceImpl implements SaveJobService {
	
	private final Logger logger = Logger.getLogger(SaveJobServiceImpl.class.getName());
	@PersistenceContext
	private EntityManager em; 
	private final SaveJobDAO dao;
	
	@Autowired
	public SaveJobServiceImpl(SaveJobDAO dao) {
		this.dao = dao;
	}

	@Override
	@Transactional
	public SaveJob save(SaveJob saveJob) {
		logger.info(ColorExample.GREEN+"Save Job Service"+ColorExample.RESET);
		dao.save(saveJob);
		return saveJob;
	}

	@Override
	@Transactional
	public int deleteByRecruitmentIdAndUserId(Integer idRe, Integer idUser) {
		return dao.deleteByRecruitmentIdAndUserId(idRe, idUser);
	}
	@Override
	@Transactional
	public void toggleSaveJob(int idRec, int userId) {
		Recruitment reRef = em.getReference(Recruitment.class, idRec);
		User userRef = em.getReference(User.class, userId);

		try {
			dao.save(new SaveJob(reRef, userRef));
		} catch (DataIntegrityViolationException e) {
			dao.deleteByRecruitmentIdAndUserId(idRec, userId);
		}
	}
}
