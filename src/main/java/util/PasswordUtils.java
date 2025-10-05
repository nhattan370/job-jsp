package util;

import java.security.SecureRandom;

public class PasswordUtils {
	
	public static String generateRandomPassword(int length) {
		String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@#$%";
		SecureRandom random = new SecureRandom();
		StringBuilder sbd = new StringBuilder();
		for(int i=0; i<length; i++) {
			sbd.append(chars.charAt(random.nextInt(chars.length())));
		}
		return sbd.toString();
	}
	
	public static Boolean isStrongPassword(String password) {
        return  password.length() >= 8 &&
                password.matches(".*[A-Z].*") &&
                password.matches(".*[a-z].*") &&
                password.matches(".*\\d.*") &&
                password.matches(".*[@#$%^&+=!].*");
	}
}
