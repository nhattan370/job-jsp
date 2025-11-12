package dao;

import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import model.Company;
import model.FollowCompany;
import model.User;

@Repository
public class FollowCompanyDAOImpl implements FollowCompanyDAO{

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public Optional<FollowCompany> findByUserAndCompany(User user, Company company) {
		try {
			FollowCompany followCompany = entityManager.createQuery("SELECT f FROM FollowCompany f WHERE f.user=:u AND f.company=:c", FollowCompany.class)
					.setParameter("u", user)
					.setParameter("c", company)
					.getSingleResult();
			return Optional.of(followCompany);			
		}catch (NoResultException e) {
			return Optional.empty();
		}
	}

	@Override
	public FollowCompany save(FollowCompany followCompany) {
		entityManager.persist(followCompany);
		return followCompany;
	}

	@Override
	public void delete(FollowCompany company) {
		entityManager.remove(company);
	}

}
