package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CompanyDAO;
import dto.CompanyHomeDTO;

@Service
public class CompanyServiceImpl implements CompanyService{
	
	private final CompanyDAO companyDAO;
	
	@Autowired
	public CompanyServiceImpl(CompanyDAO companyDAO) {
		this.companyDAO = companyDAO;
	}

	@Override
	public List<CompanyHomeDTO> findTwoAndSort() {
		return companyDAO.findTwoAndSort();
	}

}
