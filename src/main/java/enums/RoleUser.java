package enums;

public enum RoleUser {
	APPLICANT("Ứng viên"),
	ADMIN("Quản trị viên"),
	RECRUITER("Nhà tuyển dụng"),
	RECRUITER_PENDING("Chưa xác thực");
	
	private final String label;
	
	private RoleUser(String label) {
		this.label = label;
	}
	
	public String getLabel() {
		return label;
	}
}
