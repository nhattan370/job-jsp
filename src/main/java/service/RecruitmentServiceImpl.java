package service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.RecruitmentDAO;
import dto.RecruitmentDTO;
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
	
}
