package dao;

import java.util.Map;
import java.util.Optional;

import javax.persistence.NoResultException;

import org.springframework.stereotype.Repository;

import model.Recruitment;
import model.SaveJob;
import model.User;
import paginationResult.BasePagination;
import paginationResult.PaginationResult;

@Repository
public class SaveJobDAOImpl extends BasePagination implements SaveJobDAO {
	
	@Override
	public Optional<SaveJob> findByRecruitmentAndUser(Recruitment recruitment, User user) {
		try {
			SaveJob saveJob = em.createQuery("SELECT s FROM SaveJob s WHERE s.recruitment = :r AND s.user =: u", SaveJob.class)
					.setParameter("r", recruitment)
					.setParameter("u", user)
					.getSingleResult();
			return Optional.of(saveJob);
		} catch (NoResultException e) {
			return Optional.empty();
		}
	}

	@Override
	public SaveJob save(SaveJob saveJob) {
		em.persist(saveJob);
		return saveJob; 
	}

	@Override
	public void delete(SaveJob saveJob) {
		SaveJob manager = em.contains(saveJob) ? saveJob : em.merge(saveJob);
		em.remove(manager);
	}

	@Override
	public PaginationResult<SaveJob> findAllByUser(User user, int currentPage, int size) {
		String dataJpql = "SELECT s FROM SaveJob s WHERE s.user = :u";
		String countJpql = "SELECT COUNT(s) FROM SaveJob s WHERE s.user=:u";
		
		PaginationResult<SaveJob> saveJobs = paginate(dataJpql, countJpql, currentPage, size, SaveJob.class, Map.of("u",user));
		return saveJobs;
	}

	@Override
	public SaveJob getReferenceId(int id) {
		SaveJob job = em.getReference(SaveJob.class, id);
		return job;
	}

	@Override
	public SaveJob findById(int id) {
		SaveJob saveJob = em.find(SaveJob.class, id);
		return saveJob;
	}

}
