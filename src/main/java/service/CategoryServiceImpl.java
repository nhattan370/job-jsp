package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CategoryDAO;
import model.Category;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryDAO categoryDAO;
	
	@Override
	public List<Category> findAll() {
		return categoryDAO.findAll();
	}

	@Override
	public Category getReferenceId(int id) {
		return categoryDAO.getReferenceId(id);
	}

	@Override
	public Category findById(int id) {
		return categoryDAO.findById(id);
	}
}
