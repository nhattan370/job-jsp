package enums;

public enum Search {
	JOB("job"),
	USER("user"),
	ADDRESS("address");
	
	private final String value;

	private Search(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
	
}
