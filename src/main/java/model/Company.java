package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="company")
public class Company {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length = 255)
    private String address;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(length = 255)
    private String email;

    @Column(length = 255)
    private String logo;

    @Column(name = "name_company", length = 255)
    private String nameCompany;

    @Column(name = "phone_number", length = 255)
    private String phoneNumber;

    @Column
    private Integer status;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;
    
    @OneToMany(mappedBy = "company")
    private List<Recruitment> recruitments = new ArrayList<Recruitment>();
    
	public Company() {}

	public Company(Integer id, String address, String description, String email, String logo, String nameCompany,
			String phoneNumber, Integer status, User user) {
		this.id = id;
		this.address = address;
		this.description = description;
		this.email = email;
		this.logo = logo;
		this.nameCompany = nameCompany;
		this.phoneNumber = phoneNumber;
		this.status = status;
		this.user = user;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getNameCompany() {
		return nameCompany;
	}

	public void setNameCompany(String nameCompany) {
		this.nameCompany = nameCompany;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Company [id=" + id + ", address=" + address + ", description=" + description + ", email=" + email
				+ ", logo=" + logo + ", nameCompany=" + nameCompany + ", phoneNumber=" + phoneNumber + ", status="
				+ status + ", user=" + user + "]";
	}

}
