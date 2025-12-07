package service;

import java.util.logging.Logger;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import dao.UserDAO;
import dto.UserRegisterDTO;
import enums.RoleUser;
import enums.UserStatus;
import model.Role;
import model.User;
import share.ColorExample;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	
	private final UserDAO userDAO;
	private final RoleService roleService;
	private final PasswordEncoder encoder;
	private final Logger logger = Logger.getLogger(UserServiceImpl.class.getName());
	
	@Autowired
	public UserServiceImpl(UserDAO userDAO, 
			PasswordEncoder encoder, 
			RoleService roleService) {
		this.userDAO = userDAO;
		this.encoder = encoder;
		this.roleService = roleService;
	}

	@Override
	public User findByEmail(String email) {
		User user = userDAO.findByEmail(email).orElse(null);
		return user;
	}

	@Override
	public User update(User user) {
		return userDAO.update(user);
	}

	@Override
	public void save(User user) {
		userDAO.save(user);
	}

	@Override
	public User userRegister(UserRegisterDTO userRegisterDTO) {
		User user = new User();
		
		if(userRegisterDTO.getRole() != null && userRegisterDTO.getRole().getRoleName().equals(RoleUser.ADMIN)) {
			throw new IllegalArgumentException("Bạn không có quyền chọn ADMIN");
		}
		
		BeanUtils.copyProperties(userRegisterDTO, user, "confirmPassword", "password", "role");
		user.setPassword(encoder.encode(userRegisterDTO.getPassword()));
		
		if(userRegisterDTO.getRole().getRoleName().equals(RoleUser.RECRUITER)) {
			user.setRole(roleService.findByRoleName(RoleUser.RECRUITER_PENDING));
			user.setStatus(UserStatus.PENDING);
		}else if(userRegisterDTO.getRole().getRoleName().equals(RoleUser.APPLICANT)) {
			user.setRole(roleService.findByRoleName(RoleUser.APPLICANT));
			user.setStatus(UserStatus.ACTIVE);
		}
		
		userDAO.save(user);
		return user;
	}

}
