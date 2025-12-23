package service;

import java.util.List;

import enums.ApplyPostStatus;
import model.ApplyPost;
import model.Company;
import model.Recruitment;
import model.User;
import paginationResult.PaginationResult;

public interface ApplyPostService {
	ApplyPost save(ApplyPost applyPost);
	ApplyPost findByRecruitmentAndUser(Recruitment recruitment, User user);
//	List<ApplyPost> findAllByUser(User user);
	PaginationResult<ApplyPost> findAllByUserAndStatus(User user, ApplyPostStatus applyPostStatus, int currentPage, Boolean exclude);
	ApplyPost findById(int id);
	ApplyPost update(ApplyPost applyPost);
	PaginationResult<ApplyPost> findByRecruitmentAndRecruiter(Recruitment recruitment, User recruiter, int currentPage);
	PaginationResult<ApplyPost> findAllByCompany(Company company, int currentPage);
}
