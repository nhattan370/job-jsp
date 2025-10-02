package dto;

public class ApplyPostDTO {
	private Integer id;
	private String image;
	private String fullName;
	private String address;
	private String email;
	private String description;
	private String nameCv;
	private String phoneNumber;
	
	public ApplyPostDTO(Integer id, String image, String fullName, String address, String email, String description,
			String nameCv, String phoneNumber) {
		this.id = id;
		this.image = image;
		this.fullName = fullName;
		this.address = address;
		this.email = email;
		this.description = description;
		this.nameCv = nameCv;
		this.phoneNumber = phoneNumber;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getNameCv() {
		return nameCv;
	}

	public void setNameCv(String nameCv) {
		this.nameCv = nameCv;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
}
