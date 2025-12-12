package service;

import dto.UserRegisterDTO;
import model.Role;
import model.User;

public interface UserService {
	User findByEmail(String email);
	User update(User user);
	void save(User user);
	User userRegister(UserRegisterDTO userRegisterDTO);
	User updateStatusSending(User user);
}
