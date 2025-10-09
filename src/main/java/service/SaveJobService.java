package service;

import model.SaveJob;

public interface SaveJobService {
	SaveJob save(SaveJob saveJob);
	int deleteByRecruitmentIdAndUserId(Integer idRe, Integer idUser);
	void toggleSaveJob(int idRec, int userId);
}
