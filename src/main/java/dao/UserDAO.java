package dao;

import java.util.Optional;

import model.User;

public interface UserDAO {
	Optional<User> findByEmail(String email);
	User update(User user);
	void save(User user);
}
