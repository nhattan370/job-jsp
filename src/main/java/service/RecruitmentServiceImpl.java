package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.RecruitmentDAO;
import dto.RecruitmentDTO;

@Service
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
	
}
