package exception;

public class SearchTypeNotFoundException extends RuntimeException{

	private static final long serialVersionUID = 1L;
	
	public SearchTypeNotFoundException(String message) {
		super(message);
	}
}
