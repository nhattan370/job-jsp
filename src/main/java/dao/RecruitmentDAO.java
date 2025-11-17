package dao;

import java.util.List;

import dto.RecruitmentDTO;
import model.Company;
import model.Recruitment;

public interface RecruitmentDAO {
	List<RecruitmentDTO> findTwoAndSort();
	Recruitment findById(int id);
	Recruitment findByReferenceId(int id);
	List<RecruitmentDTO> findAllByCompany(Company company);
}
