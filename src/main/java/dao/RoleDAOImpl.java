package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import enums.RoleUser;
import model.Role;

@Repository
public class RoleDAOImpl implements RoleDAO{

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public List<Role> findAll() {
		List<Role> roles = entityManager.createQuery("SELECT r FROM Role r WHERE r.roleName <> :c",Role.class)
										.setParameter("c", RoleUser.ADMIN)
										.getResultList();
		return roles;
	}

	@Override
	public Role findById(Integer id) {
		return entityManager.find(Role.class, id);
	}

}
