package service;

import java.util.List;

import dto.RecruitmentDTO;
import model.Category;
import model.Company;
import model.Recruitment;

public interface RecruitmentService {
	List<RecruitmentDTO> findTwoAndSort();
	Recruitment findById(int id);
	Recruitment findByReferenceId(int id);
	List<RecruitmentDTO> findAllByCompany(Company company);
	List<RecruitmentDTO> findAllByCayegory(Category category);
	List<RecruitmentDTO> findAll();
}
