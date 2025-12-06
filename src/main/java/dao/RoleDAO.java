package dao;

import java.util.List;

import model.Role;

public interface RoleDAO {
	List<Role> findAll();
	Role findById(Integer id);
}
