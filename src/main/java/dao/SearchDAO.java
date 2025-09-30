package dao;

import java.util.List;

import dto.ApplyPostDTO;
import dto.RecruitmentDTO;

public interface SearchDAO {
	List<RecruitmentDTO> searchTitleRecruitment(String keySearch);
	List<RecruitmentDTO> searchAddressRecruitment(String keySearch);
	List<ApplyPostDTO> searchUser(String KeySearch);
}
