package service;

import java.util.List;

import dto.RecruitmentDTO;
import model.Recruitment;

public interface RecruitmentService {
	List<RecruitmentDTO> findTwoAndSort();
	Recruitment findById(int id);
}
