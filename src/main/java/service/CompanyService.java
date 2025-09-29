package service;

import java.util.List;

import dto.CompanyHomeDTO;

public interface CompanyService {
	List<CompanyHomeDTO> findTwoAndSort();
}
