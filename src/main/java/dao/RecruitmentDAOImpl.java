package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import dto.RecruitmentDTO;

@Repository
public class RecruitmentDAOImpl implements RecruitmentDAO{
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<RecruitmentDTO> findTwoAndSort() {
	    return em.createQuery("SELECT new dto.RecruitmentDTO( "
	                        + "c.id, c.nameCompany, r.id, r.title, r.type, r.address) "
	                        + "FROM Company c "
	                        + "LEFT JOIN c.recruitments r "
	                        + "LEFT JOIN r.applyPosts a "
	                        + "GROUP BY r.id, c.id, c.nameCompany, r.title, r.type, r.address "
	                        + "ORDER BY COUNT(a.id) DESC", RecruitmentDTO.class)
	             .setMaxResults(2)
	             .getResultList();
	}

}
