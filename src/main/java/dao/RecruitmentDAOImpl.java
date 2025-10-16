package dao;

import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import dto.RecruitmentDTO;
import model.Recruitment;
import share.ColorExample;

@Repository
public class RecruitmentDAOImpl implements RecruitmentDAO{
	
	@PersistenceContext
	private EntityManager em;
	private final Logger logger = Logger.getLogger(RecruitmentDAOImpl.class.getName());
	
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

	@Override
	public Recruitment findById(int id) {
		Recruitment recruitment = em.find(Recruitment.class, id);
		return recruitment;
	}

	@Override
	public Recruitment findByReferenceId(int id) {
		Recruitment recruitment = em.getReference(Recruitment.class, id);
		return recruitment;
	}

}
