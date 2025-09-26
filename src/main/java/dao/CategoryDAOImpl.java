package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import model.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO{
	
	@PersistenceContext
	private EntityManager em;

	@Override
	@Transactional(readOnly=true)
	public List<Category> findAll() {
		return em.createQuery("SELECT c FROM Category c",Category.class).getResultList();
	}

}
