package dao;

import java.util.List;

import model.Recruitment;
import model.User;

public interface SearchDAO {
	List<Recruitment> searchRecruitment(String keySearch);
	List<User> searchUser(String KeySearch);
}
