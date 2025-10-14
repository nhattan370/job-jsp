package dao;

import java.util.Optional;

import model.Recruitment;
import model.SaveJob;
import model.User;

public interface SaveJobDAO {
	Optional<SaveJob> findByRecruitmentAndUser(Recruitment recruitment, User user);
	SaveJob save(SaveJob saveJob);
	void delete(SaveJob saveJob);
}
