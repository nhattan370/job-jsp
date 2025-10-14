package dao;

import java.util.List;

import dto.RecruitmentDTO;
import model.Recruitment;

public interface RecruitmentDAO {
	List<RecruitmentDTO> findTwoAndSort();
	Recruitment findById(int id);
}
