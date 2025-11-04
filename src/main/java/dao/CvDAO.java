package dao;

import java.util.Optional;

import model.Cv;
import model.User;

public interface CvDAO {
	Optional<Cv> findByUser(User user);
}
