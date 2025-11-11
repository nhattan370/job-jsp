package dao;

import java.util.List;
import java.util.Optional;

import enums.ApplyPostStatus;
import model.ApplyPost;
import model.Recruitment;
import model.User;

public interface ApplyPostDAO {
	ApplyPost save(ApplyPost applyPost);
	Optional<ApplyPost> findByRecruitmentAndUser(Recruitment recruitment, User user);
	List<ApplyPost> findAllByUser(User user);
	ApplyPost findById(int id);
	ApplyPost update(ApplyPost applyPost);
	List<ApplyPost> findAllByUserAndStatus(User user, ApplyPostStatus status, Boolean exclude);
}
