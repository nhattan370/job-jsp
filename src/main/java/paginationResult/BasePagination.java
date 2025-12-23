package paginationResult;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;


public abstract class BasePagination {
	
	@PersistenceContext
	protected EntityManager em;
	
	public <T> PaginationResult<T> paginate(String dataJpql, String countJpql, 
											int currentPage, int size, Class<T> clazz,
											Map<String, Object> params){
		if(currentPage<1) throw new IllegalArgumentException("page must be >= 1");
		
		TypedQuery<T> dataQuery = em.createQuery(dataJpql,clazz)
									.setFirstResult((currentPage-1)*size)
									.setMaxResults(size);
		
		TypedQuery<Long> countQuery = em.createQuery(countJpql, Long.class);
		
		if(params!=null) {
			params.forEach((k,v)->{
				dataQuery.setParameter(k, v);
				countQuery.setParameter(k, v);
			});			
		}
		
		List<T> data = dataQuery.getResultList();
		long totalItems = countQuery.getSingleResult();
		int totalPages = (int) Math.ceil(totalItems*1.0/size);
		
		return new PaginationResult<T>(data, currentPage, totalPages, totalItems);
	}
}
