package service;

import java.util.List;

import model.Recruitment;
import model.SaveJob;
import model.User;

public interface SaveJobService {
	SaveJob findByRecruitmentAndUser(Recruitment recruitment, User user);
	SaveJob save(SaveJob saveJob);
	void delete(SaveJob job);
	List<SaveJob> findAllByUser(User user);
	SaveJob getReferenceId(int id);
	SaveJob findById(int id);
}
