package dao;

import java.util.List;

import dto.CompanyHomeDTO;
import model.Company;

public interface CompanyDAO {
	List<CompanyHomeDTO> findTwoAndSort();
	Company findById(int id);
	Company getReference(int id);
}
