package dao;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import dto.ApplyPostDTO;
import dto.RecruitmentDTO;
import enums.RoleUser;
import model.ApplyPost;
import model.User;
import paginationResult.BasePagination;
import paginationResult.PaginationResult;

@Repository
public class SearchDAOImpl extends BasePagination implements SearchDAO{
	
	private final Logger logger = Logger.getLogger(SearchDAO.class.getName());

	@Override
	public PaginationResult<RecruitmentDTO> searchTitleRecruitment(String keySearch, int currentPage, int size) {
		String condition = "WHERE LOWER(r.title) LIKE :kw OR LOWER(r.description) LIKE :kw";
		String dataJpql = "SELECT new dto.RecruitmentDTO(r.company.id, "
					  + "r.company.nameCompany, r.id, r.title, r.type, r.address) "
					  + "FROM Recruitment r " + condition;
		String countJpql = "SELECT COUNT(r) FROM Recruitment r "+condition;
		
		PaginationResult<RecruitmentDTO> result = paginate(dataJpql, countJpql, currentPage, size, 
														   RecruitmentDTO.class, Map.of("kw","%"+keySearch.toLowerCase()+"%"));
		return result;
	}

	@Override
	public PaginationResult<User> searchUser(String keySearch, int currentPage, int size) {
		String condition = "WHERE (LOWER(u.address) LIKE :kw "
						 + "OR LOWER(u.fullName) LIKE :kw "
						 + "OR u.phoneNumber LIKE :kw "
						 + "OR LOWER(u.description) LIKE :kw) "
						 + "AND u.role.roleName = :role";
		String dataJpql = "SELECT u FROM User u " + condition;
		String countJpql = "SELECT COUNT(u) FROM User u " + condition;
		PaginationResult<User> result = paginate(dataJpql, countJpql, currentPage, size, 
														 User.class, Map.of("kw","%"+keySearch.toLowerCase()+"%", "role", RoleUser.APPLICANT));

		return result;
	}

	@Override
	public PaginationResult<RecruitmentDTO> searchAddressRecruitment(String keySearch, int currentPage, int size) {
		String condition = "WHERE LOWER(r.address) LIKE :kw OR LOWER(r.company.address) LIKE :kw";
		String dataJpql = "SELECT new dto.RecruitmentDTO(r.company.id, "
						+ "r.company.nameCompany, r.id, r.title, r.type, r.address) FROM Recruitment r "+condition;
		String countJpql = "SELECT COUNT(r) FROM Recruitment r "+condition;

		PaginationResult<RecruitmentDTO> result = paginate(dataJpql, countJpql, currentPage, size, 
														   RecruitmentDTO.class, Map.of("kw","%" + keySearch + "%"));
		return result;
	}
	
}
