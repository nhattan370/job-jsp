package dao;


import java.util.Optional;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import model.User;
import model.VerificationToken;
import share.ColorExample;

@Repository
public class VerificationTokenDAOImpl implements VerificationTokenDAO {

	@PersistenceContext
	private EntityManager entityManager;
	private Logger logger = Logger.getLogger(VerificationTokenDAOImpl.class.getName());
	
	@Override
	public VerificationToken updateOrSave(VerificationToken token) {
		return entityManager.merge(token); 
	}

	@Override
	public Optional<VerificationToken> findByToken(String token) {
		try {
			VerificationToken verificationToken = entityManager.createQuery("SELECT v FROM VerificationToken v WHERE v.token=:t", VerificationToken.class)
					.setParameter("t", token)
					.getSingleResult();
			logger.info(ColorExample.GREEN+"Can't find this token"+ColorExample.RESET);
			return Optional.of(verificationToken);	
		}catch (NoResultException e) {
			return Optional.empty();
		}
	}

	@Override
	public void deleteToken(VerificationToken token) {
		VerificationToken verificationToken = (entityManager.contains(token)) ? token : entityManager.merge(token);
		entityManager.remove(verificationToken);
	}

	@Override
	public Optional<VerificationToken> findByUser(User user) {
		try {
			VerificationToken verificationToken = entityManager.createQuery("SELECT v FROM VerificationToken v WHERE v.user=:u", VerificationToken.class)
					.setParameter("u", user)
					.getSingleResult();
			return Optional.of(verificationToken);	
		}catch (NoResultException e) {
			logger.info(ColorExample.GREEN+"Can't find this user"+ColorExample.RESET);
			return Optional.empty();
		}
	}

}
