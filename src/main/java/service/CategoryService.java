package service;

import java.util.List;

import model.Category;

public interface CategoryService {
	List<Category> findAll();
	Category getReferenceId(int id);
	Category findById(int id);
}
