package dao;

import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import model.ApplyPost;
import model.Recruitment;
import model.User;

@Repository
public class ApplyPostDAOImpl implements ApplyPostDAO {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public ApplyPost save(ApplyPost applyPost) {
		entityManager.persist(applyPost);
		return applyPost;
	}

	@Override
	public Optional<ApplyPost> findByRecruitmentAndUser(Recruitment recruitment, User user) {
		try {
			ApplyPost applyPost = entityManager.createQuery("SELECT a FROM ApplyPost a WHERE a.recruitment = :r AND a.user = :u",ApplyPost.class)
											   .setParameter("r", recruitment)
											   .setParameter("u", user)
											   .getSingleResult();
			return Optional.of(applyPost);
		}catch (NoResultException e) {
			return Optional.empty();
		}
	}

}
