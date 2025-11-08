package dao;

import java.util.List;
import java.util.Optional;

import model.Recruitment;
import model.SaveJob;
import model.User;

public interface SaveJobDAO {
	Optional<SaveJob> findByRecruitmentAndUser(Recruitment recruitment, User user);
	List<SaveJob> findByUser(User user);
	SaveJob save(SaveJob saveJob);
	void delete(int id);
	SaveJob getReferenceId(int id);
}
