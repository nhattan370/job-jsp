package enums;

public enum Role {
	USER(1),
	ADMIN(2),
	RECRUITER(3);
	
	private final int role;

	private Role(int role) {
		this.role = role;
	}

	public int getRole() {
		return role;
	}

}
