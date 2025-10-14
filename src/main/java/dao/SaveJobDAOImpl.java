package dao;

import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import model.Recruitment;
import model.SaveJob;
import model.User;

@Repository
public class SaveJobDAOImpl implements SaveJobDAO {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public Optional<SaveJob> findByRecruitmentAndUser(Recruitment recruitment, User user) {
		try {
			SaveJob saveJob = entityManager.createQuery("SELECT s FROM SaveJob s WHERE s.recruitment = :r AND s.user =: u", SaveJob.class)
					.setParameter("r", recruitment)
					.setParameter("u", user)
					.getSingleResult();
			return Optional.of(saveJob);
		} catch (NoResultException e) {
			return Optional.empty();
		}
	}

	@Override
	public SaveJob save(SaveJob saveJob) {
		entityManager.persist(saveJob);
		return saveJob; 
	}

	@Override
	public void delete(SaveJob saveJob) {
		SaveJob manager = entityManager.contains(saveJob) ? saveJob : entityManager.merge(saveJob);
		entityManager.remove(manager);
	}

}
