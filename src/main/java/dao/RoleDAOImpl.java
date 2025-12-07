package dao;

import java.util.List;
import java.util.Optional;

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
		List<Role> roles = entityManager.createQuery("SELECT r FROM Role r WHERE r.roleName <> :c1 AND r.roleName <> : c2",Role.class)
										.setParameter("c1", RoleUser.ADMIN)
										.setParameter("c2", RoleUser.RECRUITER_PENDING)
										.getResultList();
		return roles;
	}

	@Override
	public Role findById(Integer id) {
		return entityManager.find(Role.class, id);
	}

	@Override
	public Optional<Role> findByRoleName(RoleUser roleUser) {
		List<Role> roles = entityManager.createQuery("SELECT r FROM Role r WHERE r.roleName = :c",Role.class)
								 .setParameter("c", roleUser)
								 .getResultList();
		return roles.stream().findFirst();
	}

}
