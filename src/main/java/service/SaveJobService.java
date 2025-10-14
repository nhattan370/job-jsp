package service;

import model.Recruitment;
import model.SaveJob;
import model.User;

public interface SaveJobService {
	SaveJob findByRecruitmentAndUser(Recruitment recruitment, User user);
	SaveJob save(SaveJob saveJob);
	void delete(SaveJob saveJob);
}
