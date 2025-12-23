package service;

import model.Recruitment;
import model.SaveJob;
import model.User;
import paginationResult.PaginationResult;

public interface SaveJobService {
	SaveJob findByRecruitmentAndUser(Recruitment recruitment, User user);
	SaveJob save(SaveJob saveJob);
	void delete(SaveJob job);
	PaginationResult<SaveJob> findAllByUser(User user, int currentPage);
	SaveJob getReferenceId(int id);
	SaveJob findById(int id);
}
