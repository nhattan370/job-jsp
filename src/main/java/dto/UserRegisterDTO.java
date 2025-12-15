package dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import customValidator.PasswordMatches;
import customValidator.UniqueEmailUser;
import enums.UserStatus;
import model.Role;

@PasswordMatches(message = "Mật khẩu xác nhận không trùng khớp",
				 passwordField = "password",
				 confirmPasswordField = "confirmPassword")
public class UserRegisterDTO {

    @NotBlank(message = "Email không được để trống")
    @Email(message="Email phải đúng định dạng")
    @UniqueEmailUser(message="Email đã được sử dụng, vui lòng dùng email khác")
    private String email;

    @NotBlank(message="Tên không được để trống")
    private String fullName;
    
    @Pattern(
    	    regexp = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[^a-zA-Z0-9]).{8,}$",
    	    message = "Password phải có ít nhất 8 ký tự, chứa chữ in hoa, chữ thường, chữ số và ký tự đặc biệt."
    	)
    private String password;
        
    @NotBlank(message = "Vui lòng không để trống")
    private String confirmPassword;
    
    @NotNull(message="Vui lòng chọn theo yêu cầu")
    private Role role;
    
    private UserStatus userStatus;
    
    public UserRegisterDTO() {
    }

	public UserRegisterDTO(String email, String fullName, String password, String confirmPassword, Role role) {
		this.email = email;
		this.fullName = fullName;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.role = role;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public UserStatus getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(UserStatus userStatus) {
		this.userStatus = userStatus;
	}
}
