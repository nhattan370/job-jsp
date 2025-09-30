package enums;

public enum Session {
	STATS("stats"),
	LIST_TYPE("listType");
	
	private final String value;

	private Session(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
	
}
