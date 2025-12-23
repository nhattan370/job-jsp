package dao;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.logging.Logger;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;

import enums.ApplyPostStatus;
import model.ApplyPost;
import model.Company;
import model.Recruitment;
import model.User;
import paginationResult.BasePagination;
import paginationResult.PaginationResult;
import share.ColorExample;

@Repository
public class ApplyPostDAOImpl extends BasePagination implements ApplyPostDAO {
	
	private final Logger logger = Logger.getLogger(ApplyPostDAOImpl.class.getName());

	@Override
	public ApplyPost save(ApplyPost applyPost) {
		em.persist(applyPost);
		return applyPost;
	}

	@Override
	public Optional<ApplyPost> findByRecruitmentAndUser(Recruitment recruitment, User user) {
		try {
			ApplyPost applyPost = em.createQuery("SELECT a FROM ApplyPost a WHERE a.recruitment = :r AND a.user = :u",ApplyPost.class)
											   .setParameter("r", recruitment)
											   .setParameter("u", user)
											   .getSingleResult();
			return Optional.of(applyPost);
		}catch (NoResultException e) {
			return Optional.empty();
		}
	}

//	@Override
//	public List<ApplyPost> findAllByUser(User user) {
//		List<ApplyPost> applyPosts = em.createQuery("SELECT a FROM ApplyPost a WHERE a.user = :u", ApplyPost.class)
//												  .setParameter("u", user)
//												  .getResultList();
//									
//		return applyPosts;
//	}

	@Override
	public ApplyPost findById(int id) {
		ApplyPost applyPost = em.find(ApplyPost.class, id);
		return applyPost;
	}

	@Override
	public ApplyPost update(ApplyPost applyPost) {
		return em.merge(applyPost);
	}

	@Override
	public PaginationResult<ApplyPost> findAllByUserAndStatus(User user, ApplyPostStatus status, 
															  int currentPage, int size, Boolean exclude) {
		String condition = exclude ? "a.status <> :s" : "a.status = :s";
		String dataJpql = "SELECT a FROM ApplyPost a WHERE a.user=:u AND " + condition;
		String countJpql = "SELECT COUNT(a) FROM ApplyPost a WHERE a.user=:u AND " + condition;
		PaginationResult<ApplyPost> applyPosts = paginate(dataJpql, countJpql, 
														  currentPage, size, ApplyPost.class, 
														  Map.of("u", user, "s", status));
		return applyPosts;
	}

	@Override
	public PaginationResult<ApplyPost> findByRecruitmentAndRecruiter(Recruitment recruitment, User recruiter, int currentPage, int size) {
		String condition = "WHERE a.recruitment =: r AND a.recruitment.company.user = :u";
		String dataJpql = "SELECT a FROM ApplyPost a "+condition;
		String countJpql = "SELECT COUNT(a) FROM ApplyPost a "+condition;
		
		PaginationResult<ApplyPost> applyPosts = paginate(dataJpql, countJpql, currentPage, size, ApplyPost.class, Map.of("r", recruitment, "u", recruiter));
		return applyPosts;
	}

	@Override
	public PaginationResult<ApplyPost> findAllByCompany(Company company, int currentPage, int size) {
		String dataJpql = "SELECT a FROM ApplyPost a WHERE a.recruitment.company= :c";
		String countJpql = "SELECT COUNT(a) FROM ApplyPost a WHERE a.recruitment.company=:c";
		
		PaginationResult<ApplyPost> applyPosts = paginate(dataJpql, countJpql, currentPage, size, ApplyPost.class, Map.of("c",company));
		return applyPosts;
	}

}
