package service;

import java.util.List;

import dto.RecruitmentDTO;
import model.Category;
import model.Company;
import model.Recruitment;
import paginationResult.PaginationResult;

public interface RecruitmentService {
	List<RecruitmentDTO> findTwoAndSort();
	Recruitment findById(int id);
	Recruitment findByReferenceId(int id);
	PaginationResult<RecruitmentDTO> findAllByCompany(Company company, int currentPage);
	PaginationResult<RecruitmentDTO> findAllByCategory(Category category, int currentPage);
	PaginationResult<RecruitmentDTO> findAll(int currentPage);
	Recruitment save(Recruitment recruitment);
	Recruitment update(Recruitment recruitment);
	Recruitment saveOrUpdate(Integer id, RecruitmentDTO recruitmentDTO, Company company);
}
