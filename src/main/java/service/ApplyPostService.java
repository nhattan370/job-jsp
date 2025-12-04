package service;

import java.util.List;

import enums.ApplyPostStatus;
import model.ApplyPost;
import model.Company;
import model.Recruitment;
import model.User;

public interface ApplyPostService {
	ApplyPost save(ApplyPost applyPost);
	ApplyPost findByRecruitmentAndUser(Recruitment recruitment, User user);
	List<ApplyPost> findAllByUser(User user);
	List<ApplyPost> findAllByUserAndStatus(User user, ApplyPostStatus applyPostStatus, Boolean exclude);
	ApplyPost findById(int id);
	ApplyPost update(ApplyPost applyPost);
	List<ApplyPost> findByRecruitmentAndRecruiter(Recruitment recruitment, User recruiter);
	List<ApplyPost> findAllByCompany(Company company);
}
