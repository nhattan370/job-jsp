package service;

import java.util.List;

import dto.CompanyHomeDTO;
import model.Company;

public interface CompanyService {
	List<CompanyHomeDTO> findTwoAndSort();
	Company findById(int id);
	Company getReference(int id);
	Company findByEmail(String email);
}
