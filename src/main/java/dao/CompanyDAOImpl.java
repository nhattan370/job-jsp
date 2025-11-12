package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import dto.CompanyHomeDTO;
import model.Company;

@Repository
public class CompanyDAOImpl implements CompanyDAO{
	
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
}
