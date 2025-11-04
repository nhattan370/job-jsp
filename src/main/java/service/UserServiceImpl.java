package service;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDAO;
import model.User;
import share.ColorExample;

@Service
public class UserServiceImpl implements UserService{
	
	private final UserDAO userDAO;
	private final Logger logger = Logger.getLogger(UserServiceImpl.class.getName());
	
	@Autowired
	public UserServiceImpl(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public User findByEmail(String email) {
		User user = userDAO.findByEmail(email).orElse(null);
		return user;
	}

}
