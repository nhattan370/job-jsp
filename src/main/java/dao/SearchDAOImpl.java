package dao;

import java.util.List;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import dto.ApplyPostDTO;
import dto.RecruitmentDTO;
import model.ApplyPost;
import model.Recruitment;
import share.ColorExample;

@Repository
public class SearchDAOImpl implements SearchDAO{
	
	private final Logger logger = Logger.getLogger(SearchDAO.class.getName());
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<RecruitmentDTO> searchTitleRecruitment(String keySearch) {
		String query = "SELECT new dto.RecruitmentDTO(r.company.id, "
					  + "r.company.nameCompany, r.id, r.title, r.type, r.address) "
					  + "FROM Recruitment r "
					  + "WHERE LOWER(r.title) LIKE :kw "
					  + "OR LOWER(r.description) LIKE :kw";
		
		return em.createQuery(query,RecruitmentDTO.class)
				 .setParameter("kw", "%" + keySearch + "%")
				 .getResultList();
	}

	@Override
	public List<ApplyPostDTO> searchUser(String keySearch) {
		String query = "SELECT new dto.ApplyPostDTO(a.id, a.user.image, a.user.fullName, "
					 + "a.user.address, a.user.email, a.user.description, a.nameCv, a.user.phoneNumber) "
				     + "FROM ApplyPost a "
					 + "WHERE LOWER(a.user.address) LIKE :kw "
					 + "OR LOWER(a.user.fullName) LIKE :kw "
					 + "OR LOWER(a.user.phoneNumber) Like :kw "
					 + "OR LOWER(a.user.description) LIKE :kw";

		return em.createQuery(query, ApplyPostDTO.class)
				 .setParameter("kw", "%"+keySearch+"%")
				 .getResultList();
	}

	@Override
	public List<RecruitmentDTO> searchAddressRecruitment(String keySearch) {
		String query = "SELECT new dto.RecruitmentDTO(r.company.id, "
				  + "r.company.nameCompany, r.id, r.title, r.type, r.address) "
				  + "FROM Recruitment r "
				  + "WHERE LOWER(r.address) LIKE :kw "
				  + "OR LOWER(r.company.address) LIKE :kw";

		return em.createQuery(query,RecruitmentDTO.class)
				 .setParameter("kw", "%" + keySearch + "%")
				 .getResultList();
	}
	
}
