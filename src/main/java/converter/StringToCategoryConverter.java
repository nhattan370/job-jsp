package converter;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import model.Category;
import service.CategoryService;

@Component
public class StringToCategoryConverter implements Converter<String, Category> {

	private final CategoryService categoryService;
	
	@Autowired
	public StringToCategoryConverter(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	@Override
	public Category convert(String source) {
		if(source==null || source.isEmpty()) return null;
		return categoryService.findById(Integer.parseInt(source));
	}

}
