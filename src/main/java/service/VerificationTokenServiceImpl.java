package service;

import java.time.LocalDateTime;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.VerificationTokenDAO;
import enums.RoleUser;
import enums.UserStatus;
import model.User;
import model.VerificationToken;

@Service
@Transactional
public class VerificationTokenServiceImpl implements VerificationTokenService {
	
	private final VerificationTokenDAO tokenDAO;
	
	@Autowired
	public VerificationTokenServiceImpl(VerificationTokenDAO tokenDAO) {
		this.tokenDAO = tokenDAO;
	}

	@Override
	public VerificationToken save(VerificationToken token) {
		return tokenDAO.updateOrSave(token);
	}

	@Override
	public VerificationToken findByToken(String token) {
		return tokenDAO.findByToken(token).orElseThrow(()->new RuntimeException("Token not found"));
	}

	@Override
	public VerificationToken createToken(User user) {
		VerificationToken verificationToken = tokenDAO.findByUser(user).orElse(new VerificationToken());
		verificationToken.setToken(UUID.randomUUID().toString());
		verificationToken.setExpireDate(LocalDateTime.now().plusHours(24));
		user.setStatus(UserStatus.PENDING);
		verificationToken.setUser(user);

		return tokenDAO.updateOrSave(verificationToken);
	}

	@Override
	public boolean verify(String tokenStr) {
		VerificationToken verificationToken = findByToken(tokenStr);
		if(verificationToken.isExpire()) return false;
		
		User user = verificationToken.getUser();
		user.setStatus(UserStatus.ACTIVE);
		user.getRole().setRoleName(RoleUser.RECRUITER);
		
//		tokenDAO.save(verificationToken);
		tokenDAO.deleteToken(verificationToken);
		return true;
	}

	@Override
	public void delete(VerificationToken verificationToken) {
		tokenDAO.deleteToken(verificationToken);
	}

	@Override
	public VerificationToken findByUser(User user) {
		return tokenDAO.findByUser(user).orElseThrow(()->new RuntimeException("Không tìm thấy người dùng"));
	}

}
