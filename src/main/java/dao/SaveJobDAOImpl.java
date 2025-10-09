package dao;

import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.SaveJob;
import share.ColorExample;

@Repository
public class SaveJobDAOImpl implements SaveJobDAO {
	
	private final Logger logger = Logger.getLogger(SaveJobDAOImpl.class.getName());
	@PersistenceContext
	private EntityManager em;

	@Override
	public SaveJob save(SaveJob job) {
		logger.info(ColorExample.BLUE+"Save Job DAO Impl"+ColorExample.RESET);
		em.persist(job);
		return job;
	}

	@Override
	public int deleteByRecruitmentIdAndUserId(Integer idRe, Integer idUser) {
		return em.createQuery("DELETE FROM SaveJob sj WHERE sj.recruitment.id = :idRe AND sj.user.id =:idUser")
				 .setParameter("idUser", idUser)
				 .setParameter("idRe", idRe)
				 .executeUpdate();
	}

	/*
	 * @Override public Optional<SaveJob> findByRecruitmentIdAndUserId(int idRe, int
	 * idUser) { try { SaveJob saveJob = em.
	 * createQuery("SELECT sj FROM SaveJob sj WHERE sj.recruitment.id = :idRe AND sj.user.id = :idUser"
	 * , SaveJob.class) .setParameter("idRe", idRe) .setParameter("idUser", idUser)
	 * .getSingleResult(); return Optional.of(saveJob); }catch (NoResultException e)
	 * { return Optional.empty(); } }
	 */

}
