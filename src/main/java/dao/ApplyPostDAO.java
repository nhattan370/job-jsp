package dao;

import java.util.Optional;

import model.ApplyPost;
import model.Recruitment;
import model.User;

public interface ApplyPostDAO {
	ApplyPost save(ApplyPost applyPost);
	Optional<ApplyPost> findByRecruitmentAndUser(Recruitment recruitment, User user);
}
