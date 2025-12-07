package dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import customValidator.PasswordMatches;
import customValidator.UniqueEmailUser;
import model.Role;

public class UserDTO {

	@NotBlank(message = "Địa chỉ không được để trống")
    private String address;

    private String description;

    @NotBlank(message = "Email không được để trống")
    @Email(message="Email phải đúng định dạng")
    @UniqueEmailUser(message="Email đã được sử dụng, vui lòng dùng email khác")
    private String email;

    @NotBlank(message="Tên không được để trống")
    private String fullName;

    @Pattern(
            regexp = "^(0|\\+84)[0-9]{8,10}$",
            message = "Số điện thoại không hợp lệ"
    )
    private String phoneNumber;

    public UserDTO() {}
    
	public UserDTO(String address, String description, String email, String fullName, String phoneNumber) {
		this.address = address;
		this.description = description;
		this.email = email;
		this.fullName = fullName;
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public String getDescription() {
		return description;
	}

	public String getEmail() {
		return email;
	}

	public String getFullName() {
		return fullName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
}
