package converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import model.Role;
import service.RoleService;

@Component
public class StringToRoleConverter implements Converter<String, Role>{
	private final RoleService roleService;
	
	@Autowired
	public StringToRoleConverter(RoleService roleService) {
		this.roleService = roleService;
	}

	@Override
	public Role convert(String source) {
		if(source==null || source.isEmpty()) return null;
		return roleService.findById(Integer.parseInt(source));
	}
}
