package service;

import java.util.List;

import enums.RoleUser;
import model.Role;

public interface RoleService {
	List<Role> findAll();
	Role findById(Integer id);
	Role findByRoleName(RoleUser roleUser);
}
