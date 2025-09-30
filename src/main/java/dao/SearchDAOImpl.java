package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import enums.Search;
import model.Recruitment;
import model.User;

@Repository
public class SearchDAOImpl implements SearchDAO{
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Recruitment> searchRecruitment(String keySearch) {
		String query = "";
		if(keySearch.equals(Search.JOB.getValue())) {
			query = "SELECT r FROM Recruitment r "
					  + "WHERE LOWER(r.title) LIKE :kw "
					  + "OR LOWER(r.description) LIKE :kw";
		}
		
		if(keySearch.equals(Search.ADDRESS.getValue())) {
			query = "SELECT r FROM Recruitment r "
				  + "WHERE LOWER(r.address) LIKE :kw "
				  + "OR LOWER(r.company.address) LIKE :kw";
		}
		
		return em.createQuery(query,Recruitment.class)
				 .setParameter("kw", "%" + keySearch + "%")
				 .getResultList();
	}

	@Override
	public List<User> searchUser(String keySearch) {
		String query = "SELECT u FROM User u"
					 + "WHERE LOWER(u.address) LIKE :kw"
					 + "OR LOWER(u.fullName) LIKE :kw"
					 + "OR LOWER(u.phoneNumber) Like :kw";
		return em.createQuery(query, User.class)
				 .setParameter("kw", "%"+keySearch+"%")
				 .getResultList();
	}
	
}
