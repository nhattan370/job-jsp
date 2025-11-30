package dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import customValidator.UniqueEmailUser;

public class UserDTO {

	@NotBlank(message = "Địa chỉ không được để trống")
    private String address;

    private String description;

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

    @Pattern(
            regexp = "^(0|\\+84)[0-9]{8,10}$",
            message = "Số điện thoại không hợp lệ"
    )
    private String phoneNumber;

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

	public String getPassword() {
		return password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}
}
