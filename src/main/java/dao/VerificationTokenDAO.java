package dao;

import java.util.Optional;

import model.User;
import model.VerificationToken;

public interface VerificationTokenDAO {
	VerificationToken updateOrSave(VerificationToken token);
	Optional<VerificationToken> findByToken(String token);
	Optional<VerificationToken> findByUser(User user);
	void deleteToken(VerificationToken token);
}
