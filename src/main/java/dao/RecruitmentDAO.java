package dao;

import java.util.List;

import dto.RecruitmentDTO;
import model.Category;
import model.Company;
import model.Recruitment;

public interface RecruitmentDAO {
	List<RecruitmentDTO> findTwoAndSort();
	Recruitment findById(int id);
	Recruitment findByReferenceId(int id);
	List<RecruitmentDTO> findAllByCompany(Company company);
	List<RecruitmentDTO> findAllByCategory(Category category);
	List<RecruitmentDTO> findAll();
	Recruitment save(Recruitment recruitment);
	Recruitment update(Recruitment recruitment);
}
