package dao;

import java.util.List;
import java.util.Optional;

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

	@Override
	public Category getReferenceId(int id) {
		Category category = em.getReference(Category.class, id);
		return category;
	}

	@Override
	public Category findById(int id) {

		return em.find(Category.class, id);
	}

	@Override
	public List<Category> findAllByName(String name) {
		List<Category> category = em.createQuery("SELECT c FROM Category c WHERE LOWER(c.name) LIKE :n",Category.class)
									.setParameter("n","%"+name.toLowerCase()+"%")
									.getResultList();
		return category;
	}

}
