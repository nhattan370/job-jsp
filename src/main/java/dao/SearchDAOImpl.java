package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import model.Recruitment;
import model.User;

@Repository
public class SearchDAOImpl implements SearchDAO{
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Recruitment> searchRecruitment(String keySearch) {
		String query = "SELECT r FROM Recruitment r "
				  + "WHERE LOWER(r.title) LIKE :kw "
				  + "OR LOWER(r.description) LIKE :kw";
		
		return em.createQuery(query,Recruitment.class)
				 .setParameter("kw", "%" + keySearch + "%")
				 .getResultList();
	}

	@Override
	public List<User> searchUser(String keySearch) {
		
		return null;
	}
	
}
