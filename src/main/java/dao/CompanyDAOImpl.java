package dao;

import java.util.List;
import java.util.Optional;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import dto.CompanyHomeDTO;
import model.Company;
import share.ColorExample;

@Repository
public class CompanyDAOImpl implements CompanyDAO{
	
	private Logger logger = Logger.getLogger(CompanyDAOImpl.class.getName());
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<CompanyHomeDTO> findTwoAndSort() {
		List<CompanyHomeDTO> list = em.createQuery("SELECT new dto.CompanyHomeDTO(c.id, c.nameCompany, c.logo, "
				+ "COUNT(DISTINCT r.id), COUNT(a.id)) "
				+ "FROM Company c "
				+ "LEFT JOIN c.recruitments r "
				+ "LEFT JOIN r.applyPosts a "
				+ "GROUP BY c.id, c.nameCompany, c.logo "
				+ "ORDER BY COUNT(a.id) DESC ",CompanyHomeDTO.class)
				.setMaxResults(2)
				.getResultList();
		return list;
	}

	@Override
	public Company findById(int id) {
		Company company = em.find(Company.class, id);
		return company;
	}

	@Override
	public Company getReference(int id) {
		Company company = em.getReference(Company.class, id);
		return company;
	}

	@Override
	public Optional<Company> findByEmail(String email) {
		try {
			Company company = em.createQuery("SELECT c FROM Company c WHERE c.email= :e", Company.class)
					 .setParameter("e", email)
					 .getSingleResult();
			return Optional.of(company);
		}catch(NoResultException e) {
			logger.info(ColorExample.CYAN+e.getMessage()+ColorExample.RESET);
			return Optional.empty();
		}
	}
}
