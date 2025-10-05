package service;

import model.User;

public interface UserService {
	User findByEmail(String email);
}
