package dao;

import java.util.List;

import model.Recruitment;

public interface SearchDAO {
	List<Recruitment> searchRecruitment(String value);
}
