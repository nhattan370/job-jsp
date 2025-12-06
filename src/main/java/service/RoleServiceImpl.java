package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.RoleDAO;
import model.Role;

@Service
public class RoleServiceImpl implements RoleService{
	private final RoleDAO roleDAO;
	
	@Autowired
	public RoleServiceImpl(RoleDAO roleDAO) {
		this.roleDAO = roleDAO;
	}

	@Override
	public List<Role> findAll() {
		return roleDAO.findAll();
	}

	@Override
	public Role findById(Integer id) {
		return roleDAO.findById(id);
	}
	
}
