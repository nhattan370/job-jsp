package service;

import model.Cv;
import model.User;

public interface CvService {
	Cv findByUser(User user);
}
