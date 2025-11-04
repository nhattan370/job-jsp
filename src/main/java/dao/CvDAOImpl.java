package dao;

import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import model.Cv;
import model.User;

@Repository
public class CvDAOImpl implements CvDAO{
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Optional<Cv> findByUser(User user) {
		try {
			Cv cv = entityManager.createQuery("SELECT c FROM Cv WHERE c.user=:u", Cv.class)
					.setParameter("u", user)
					.getSingleResult();
			return Optional.of(cv);
		}catch(NoResultException e) {
			return Optional.empty();
		}
	}

}
