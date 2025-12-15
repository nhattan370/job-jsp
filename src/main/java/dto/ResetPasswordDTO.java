package dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import customValidator.PasswordMatches;
import enums.RoleUser;

@PasswordMatches(passwordField = "password", confirmPasswordField = "confirmPassword")
public class ResetPasswordDTO {
	
	@NotBlank(message="Không để trống mục này")
	@Pattern(
    	    regexp = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^a-zA-Z0-9]).{8,}$",
    	    message = "Password phải có ít nhất 8 ký tự, chứa chữ in hoa, chữ thường, chữ số và ký tự đặc biệt."
    )
	private String password;
	
	@NotBlank(message="Không để trống mục này")
	private String confirmPassword;

	public ResetPasswordDTO() {
	}

	public ResetPasswordDTO(String password, String confirmPassword) {
		this.password = password;
		this.confirmPassword = confirmPassword;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
}
