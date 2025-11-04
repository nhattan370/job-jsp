package service;

import model.ApplyPost;
import model.Recruitment;
import model.User;

public interface ApplyPostService {
	ApplyPost save(ApplyPost applyPost);
	ApplyPost findByRecruitmentAndUser(Recruitment recruitment, User user);
}
