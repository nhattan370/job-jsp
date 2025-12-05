package service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.RecruitmentDAO;
import dto.RecruitmentDTO;
import enums.RecruitmentStatus;
import model.Category;
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

	@Override
	public List<RecruitmentDTO> findAll() {
		return recruitmentDAO.findAll();
	}

	@Override
	public List<RecruitmentDTO> findAllByCategory(Category category) {
		return recruitmentDAO.findAllByCategory(category);
	}

	@Override
	public Recruitment save(Recruitment recruitment) {
		return recruitmentDAO.save(recruitment);
	}

	@Override
	public Recruitment update(Recruitment recruitment) {
		return recruitmentDAO.update(recruitment);
	}

	@Override
	public Recruitment saveOrUpdate(Integer id, RecruitmentDTO recruitmentDTO, Company company) {
		Recruitment recruitment = (id==null) ? new Recruitment() : recruitmentDAO.findByReferenceId(id);
		BeanUtils.copyProperties(recruitmentDTO, recruitment);
		recruitment.setStatus(RecruitmentStatus.NORMAL);
		if(id==null) recruitment.setCompany(company);
		recruitmentDAO.save(recruitment);
		return recruitment;
	}	
	
}
