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
			    " (SELECT COUNT(DISTINCT a.user.id) FROM ApplyPost a)," +
			    " (SELECT COUNT(c.id) FROM Company c)," +
			    " (SELECT COUNT(r.id) FROM Recruitment r))" +
			    " FROM Company c2", 
			    DashboardStatus.class)
				.setMaxResults(1)
			    .getSingleResult();
		return stats;
	}
}
