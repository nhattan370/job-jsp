package dao;

import java.util.List;

import dto.CompanyHomeDTO;

public interface CompanyDAO {
	List<CompanyHomeDTO> findTwoAndSort();
}
