package dao;

import java.util.List;

import dto.RecruitmentDTO;
import model.Category;
import model.Company;
import model.Recruitment;
import paginationResult.PaginationResult;

public interface RecruitmentDAO {
	List<RecruitmentDTO> findTwoAndSort();
	Recruitment findById(int id);
	Recruitment findByReferenceId(int id);
	PaginationResult<RecruitmentDTO> findAllByCompany(Company company, int currentPage, int size);
	PaginationResult<RecruitmentDTO> findAllByCategory(Category category, int currentPage, int size);
	PaginationResult<RecruitmentDTO> findAll(int currentPage, int size);
	Recruitment save(Recruitment recruitment);
	Recruitment update(Recruitment recruitment);
}
