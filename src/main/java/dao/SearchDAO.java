package dao;

import dto.RecruitmentDTO;
import model.ApplyPost;
import model.User;
import paginationResult.PaginationResult;

public interface SearchDAO {
	PaginationResult<RecruitmentDTO> searchTitleRecruitment(String keySearch, int currentPage, int size);
	PaginationResult<RecruitmentDTO> searchAddressRecruitment(String keySearch, int currentPage, int size);
	PaginationResult<User> searchUser(String KeySearch, int currentPage, int size);
}
