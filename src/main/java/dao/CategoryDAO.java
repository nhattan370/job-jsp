package dao;

import java.util.List;
import java.util.Optional;

import model.Category;

public interface CategoryDAO {
	List<Category> findAll();
	Category getReferenceId(int id);
	Category findById(int id);
	List<Category> findAllByName(String name);
}
