package service;

import java.util.List;

import model.Role;

public interface RoleService {
	List<Role> findAll();
	Role findById(Integer id);
}
