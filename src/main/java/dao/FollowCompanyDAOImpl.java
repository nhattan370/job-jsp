package dao;

import java.util.Map;
import java.util.Optional;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;

import model.Company;
import model.FollowCompany;
import model.User;
import paginationResult.BasePagination;
import paginationResult.PaginationResult;

@Repository
public class FollowCompanyDAOImpl extends BasePagination implements FollowCompanyDAO{
	
	@Override
	public Optional<FollowCompany> findByUserAndCompany(User user, Company company) {
		try {
			FollowCompany followCompany = em.createQuery("SELECT f FROM FollowCompany f WHERE f.user=:u AND f.company=:c", FollowCompany.class)
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
		em.persist(followCompany);
		return followCompany;
	}

	@Override
	public void delete(FollowCompany followCompany) {
		FollowCompany fc = em.contains(followCompany) ? followCompany : em.merge(followCompany);
		em.remove(fc);
	}

	@Override
	public PaginationResult<FollowCompany> findAllByUser(User user, int currentPage, int size) {
		String dataJpql = "SELECT fc FROM FollowCompany fc WHERE fc.user = :u";
		String countJpql = "SELECT COUNT(fc) FROM FollowCompany fc WHERE fc.user = :u";
		
		PaginationResult<FollowCompany> followCompanies = paginate(dataJpql, countJpql, currentPage, size, FollowCompany.class, Map.of("u",user));
		return followCompanies;
	}

	@Override
	public FollowCompany findById(int id) {
		FollowCompany followCompany = em.find(FollowCompany.class, id);
		return followCompany;
	}

}
