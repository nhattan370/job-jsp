package dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import dto.DashboardStatus;

@Repository
public class DashboardStatusDAOImpl implements DashboardStatusDAO{

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public DashboardStatus getDashboardStats() {
		DashboardStatus stats = em.createQuery(
			    "SELECT new dto.DashboardStatus(" +
			    " COUNT(DISTINCT a.user.id)," +
			    " COUNT(DISTINCT r.company.id)," +
			    " COUNT(a.recruitment.id))" +
			    " FROM ApplyPost a" +
			    " JOIN a.recruitment r" +
			    " RIGHT JOIN r.company c", 
			    DashboardStatus.class)
			    .getSingleResult();
		return stats;
	}

}
