package dao;

import java.util.List;
import java.util.Optional;

import enums.ApplyPostStatus;
import model.ApplyPost;
import model.Company;
import model.Recruitment;
import model.User;
import paginationResult.PaginationResult;

public interface ApplyPostDAO {
	ApplyPost save(ApplyPost applyPost);
	Optional<ApplyPost> findByRecruitmentAndUser(Recruitment recruitment, User user);
//	List<ApplyPost> findAllByUser(User user);
	ApplyPost findById(int id);
	ApplyPost update(ApplyPost applyPost);
	PaginationResult<ApplyPost> findAllByUserAndStatus(User user, ApplyPostStatus status, int currentPage, int size, Boolean exclude);
	PaginationResult<ApplyPost> findByRecruitmentAndRecruiter(Recruitment recruitment, User recruiter, int currentPage, int size);
	PaginationResult<ApplyPost> findAllByCompany(Company company, int currentPage, int size);
}
