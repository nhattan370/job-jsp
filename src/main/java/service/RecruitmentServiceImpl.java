package service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.RecruitmentDAO;
import dto.RecruitmentDTO;
import model.Company;
import model.Recruitment;

@Service
@Transactional
public class RecruitmentServiceImpl implements RecruitmentService{
	
	private final RecruitmentDAO recruitmentDAO;

	@Autowired
	public RecruitmentServiceImpl(RecruitmentDAO recruitmentDAO) {
		this.recruitmentDAO = recruitmentDAO;
	}

	@Override
	public List<RecruitmentDTO> findTwoAndSort() {
		return recruitmentDAO.findTwoAndSort();
	}

	@Override
	public Recruitment findById(int id) {
		return recruitmentDAO.findById(id);
	}

	@Override
	public Recruitment findByReferenceId(int id) {
		Recruitment recruitment = recruitmentDAO.findByReferenceId(id);
		return recruitment;
	}

	@Override
	public List<RecruitmentDTO> findAllByCompany(Company company) {
		return recruitmentDAO.findAllByCompany(company);
	}	
	
}
