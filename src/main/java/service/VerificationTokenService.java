package service;

import model.User;
import model.VerificationToken;

public interface VerificationTokenService {
	VerificationToken save(VerificationToken token);
	VerificationToken findByToken(String token);
	VerificationToken findByUser(User user);
	VerificationToken createToken(User user);
	boolean verify(String tokenStr);
	void delete(VerificationToken verificationToken);
}
