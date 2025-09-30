package dao;

import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import model.ApplyPost;
import model.Recruitment;
import share.ColorExample;

@Repository
public class SearchDAOImpl implements SearchDAO{
	
	private final Logger logger = Logger.getLogger(SearchDAO.class.getName());
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Recruitment> searchTitleRecruitment(String keySearch) {
		String query = "SELECT r FROM Recruitment r "
					  + "WHERE LOWER(r.title) LIKE :kw "
					  + "OR LOWER(r.description) LIKE :kw";
		
		logger.info(ColorExample.GREEN+ "Title" +ColorExample.RESET);
		
		return em.createQuery(query,Recruitment.class)
				 .setParameter("kw", "%" + keySearch + "%")
				 .getResultList();
	}

	@Override
	public List<ApplyPost> searchUser(String keySearch) {
		String query = "SELECT a FROM ApplyPost a "
					 + "WHERE LOWER(a.user.address) LIKE :kw "
					 + "OR LOWER(a.user.fullName) LIKE :kw "
					 + "OR LOWER(a.user.phoneNumber) Like :kw";
		logger.info(ColorExample.GREEN + "User" + ColorExample.RESET);
		return em.createQuery(query, ApplyPost.class)
				 .setParameter("kw", "%"+keySearch+"%")
				 .getResultList();
	}

	@Override
	public List<Recruitment> searchAddressRecruitment(String keySearch) {
		String query = "SELECT r FROM Recruitment r "
				  + "WHERE LOWER(r.address) LIKE :kw "
				  + "OR LOWER(r.company.address) LIKE :kw";
		logger.info(ColorExample.GREEN+ "Address" +ColorExample.RESET);
		return em.createQuery(query,Recruitment.class)
				 .setParameter("kw", "%" + keySearch + "%")
				 .getResultList();
	}
	
}
