package enums;

public enum RoleUser {
	APPLICANT("Ứng viên"),
	ADMIN("Quản trị viên"),
	RECRUITER("Nhà tuyển dụng");
	
	private final String label;
	
	private RoleUser(String label) {
		this.label = label;
	}
	
	public String getLabel() {
		return label;
	}
}
