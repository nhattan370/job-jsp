package dao;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import enums.ApplyPostStatus;
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

	@Override
	public List<ApplyPost> findAllByUser(User user) {
		List<ApplyPost> applyPosts = entityManager.createQuery("SELECT a FROM ApplyPost a WHERE a.user = :u", ApplyPost.class)
												  .setParameter("u", user)
												  .getResultList();
									
		return applyPosts;
	}

	@Override
	public ApplyPost findById(int id) {
		ApplyPost applyPost = entityManager.find(ApplyPost.class, id);
		return applyPost;
	}

	@Override
	public ApplyPost update(ApplyPost applyPost) {
		return entityManager.merge(applyPost);
	}

	@Override
	public List<ApplyPost> findAllByUserAndStatus(User user, ApplyPostStatus status, Boolean exclude) {
		List<ApplyPost> applyPosts = entityManager.createQuery("SELECT a FROM ApplyPost a WHERE a.user=:u AND "
															+ (exclude ? "a.status <> :s" : "a.status = :s"),ApplyPost.class)
												  .setParameter("u", user)
												  .setParameter("s", status)
												  .getResultList();
		return applyPosts;
	}

}
