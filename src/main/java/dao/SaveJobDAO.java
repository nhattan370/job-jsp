package dao;

import java.util.List;
import java.util.Optional;

import model.Recruitment;
import model.SaveJob;
import model.User;

public interface SaveJobDAO {
	Optional<SaveJob> findByRecruitmentAndUser(Recruitment recruitment, User user);
	List<SaveJob> findAllByUser(User user);
	SaveJob save(SaveJob saveJob);
	void delete(SaveJob saveJob);
	SaveJob getReferenceId(int id);
	SaveJob findById(int id);
}
