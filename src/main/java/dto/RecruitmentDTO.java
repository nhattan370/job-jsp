package dto;

import java.time.LocalDate;

import javax.validation.constraints.FutureOrPresent;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;

import org.springframework.format.annotation.DateTimeFormat;

import model.Category;

public class RecruitmentDTO {
	private Integer idCompany;
	private String nameCompany;
	
	private Integer id;
	
	@NotBlank(message = "Không được để trống")
	private String title;
	@NotBlank(message = "Không được để trống")
	private String description;
	@NotBlank(message = "Không được để trống")
	private String experience;
	
	@Positive(message = "Giá trị nhập vào phải >0")
	private Integer quantity;
	@NotBlank(message = "Không được để trống")
	private String address;
	@FutureOrPresent(message = "Ngày phải lớn hơn ngày hiện tại")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate deadline;
	@NotBlank(message = "Không được để trống")
	private String salary;
	@NotBlank(message = "Vui lòng chọn theo yêu cầu")
	private String type;
	@NotNull(message = "Vui lòng chọn theo yêu cầu")
	private Category category;
	
	
	public RecruitmentDTO() {}

	public RecruitmentDTO(Integer idCompany, String nameCompany, Integer id, String title, String type,
			String address) {
		this.idCompany = idCompany;
		this.nameCompany = nameCompany;
		this.id = id;
		this.title = title;
		this.type = type;
		this.address = address;
	}
	
	public RecruitmentDTO( String title, String description, String experience, Integer quantity, 
			String address, LocalDate deadline, String salary, String type, Category category) {
		this.title = title;
		this.description = description;
		this.experience = experience;
		this.quantity = quantity;
		this.address = address;
		this.deadline = deadline;
		this.salary = salary;
		this.type = type;
		this.category = category;
	}

	public Integer getIdCompany() {
		return idCompany;
	}

	public void setIdCompany(Integer idCompany) {
		this.idCompany = idCompany;
	}

	public String getNameCompany() {
		return nameCompany;
	}

	public void setNameCompany(String nameCompany) {
		this.nameCompany = nameCompany;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public String getExperience() {
		return experience;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public LocalDate getDeadline() {
		return deadline;
	}

	public String getSalary() {
		return salary;
	}

	public Category getCategory() {
		return category;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public void setDeadline(LocalDate deadline) {
		this.deadline = deadline;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
}
