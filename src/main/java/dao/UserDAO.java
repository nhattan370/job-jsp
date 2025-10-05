package dao;

import java.util.Optional;

import model.User;

public interface UserDAO {
	Optional<User> findByEmail(String email);
}
