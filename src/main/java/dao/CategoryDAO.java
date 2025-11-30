package dao;

import java.util.List;

import model.Category;

public interface CategoryDAO {
	List<Category> findAll();
	Category getReferenceId(int id);
}
