package dao;

import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import model.User;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Optional<User> findByEmail(String email) {
		try {
			User user = em.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class)
			 .setParameter("email", email)
			 .getSingleResult();
			return Optional.of(user);
		}catch (NoResultException e) {
			return Optional.empty();
		}
	}

}
