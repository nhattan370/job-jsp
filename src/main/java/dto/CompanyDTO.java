package dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import customValidator.UniqueEmailCompany;

public class CompanyDTO {
	private Integer id;
	
	@Email(message = "Email không đúng định dạng")
	@UniqueEmailCompany
	private String email;
	
	@NotBlank(message = "Không được để trống")
	private String name;
	
	@NotBlank(message = "Không được để trống")
	private String address;
	
    @Pattern(
            regexp = "^(0|\\+84)[0-9]{8,10}$",
            message = "Số điện thoại không hợp lệ"
    )
	private String phoneNumber;
    
	private String description;
	
	private String logo;

	public CompanyDTO(Integer id,String email, String name, String address, String phoneNumber, String description) {
		this.id = id;
		this.email = email;
		this.name = name;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.description = description;
	}

	public Integer getId() {
		return id;
	}

	public String getEmail() {
		return email;
	}

	public String getName() {
		return name;
	}

	public String getAddress() {
		return address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public String getDescription() {
		return description;
	}

	public String getLogo() {
		return logo;
	}
	
}
