package dao;

import java.util.List;

import dto.RecruitmentDTO;

public interface RecruitmentDAO {
	List<RecruitmentDTO> findTwoAndSort();
}
