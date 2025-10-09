package dao;

import java.util.Optional;

import model.SaveJob;

public interface SaveJobDAO {
	SaveJob save(SaveJob job);
	int deleteByRecruitmentIdAndUserId(Integer idRe, Integer idUser);
//	Optional<SaveJob> findByRecruitmentIdAndUserId(int idRe, int idUser);
}
