package dao;

import java.util.Optional;

import model.Recruitment;
import model.SaveJob;
import model.User;
import paginationResult.PaginationResult;

public interface SaveJobDAO {
	Optional<SaveJob> findByRecruitmentAndUser(Recruitment recruitment, User user);
	PaginationResult<SaveJob> findAllByUser(User user, int currentPage, int size);
	SaveJob save(SaveJob saveJob);
	void delete(SaveJob saveJob);
	SaveJob getReferenceId(int id);
	SaveJob findById(int id);
}
