package service;

import java.util.logging.Logger;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDAO;
import model.User;
import share.ColorExample;

@Service
@Transactional
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

	@Override
	public User update(User user) {
		return userDAO.update(user);
	}

	@Override
	public void save(User user) {
		userDAO.save(user);
	}

}
