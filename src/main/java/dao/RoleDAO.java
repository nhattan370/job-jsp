package dao;

import java.util.List;
import java.util.Optional;

import enums.RoleUser;
import model.Role;

public interface RoleDAO {
	List<Role> findAll();
	Role findById(Integer id);
	Optional<Role> findByRoleName(RoleUser roleUser);
}
