package model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Where;

import enums.RecruitmentStatus;

@Entity
@Table(name="recruitment")
@Where(clause = "status = 'NORMAL'")
public class Recruitment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length = 255)
    private String address;

    @Column(name = "created_at")
    private LocalDateTime createdAt = LocalDateTime.now();

    @Column(length = 255)
    private String description;

    @Column(length = 255)
    private String experience;

    @Column
    private Integer quantity;

    @Column(name = "`rank`", length = 255)
    private String rank;

    @Column(length = 255)
    private String salary;

    @Column
    @Enumerated(EnumType.STRING)
    private RecruitmentStatus status;

    @Column(length = 255)
    private String title;

    @Column(length = 255)
    private String type;

    @Column
    private Integer views;

    @Column
    private LocalDate deadline;

    @ManyToOne
    @JoinColumn(name = "category_id", referencedColumnName = "id")
    private Category category;

    @ManyToOne
    @JoinColumn(name = "company_id", referencedColumnName = "id")
    private Company company;
    
    @OneToMany(mappedBy = "recruitment")
    private List<ApplyPost> applyPosts;

	public Recruitment() {}

	public Recruitment(Integer id, String address, String description, String experience,
			Integer quantity, String rank, String salary, RecruitmentStatus status, String title, String type, Integer views,
			LocalDate deadline, Category category, Company company) {
		this.id = id;
		this.address = address;
		this.description = description;
		this.experience = experience;
		this.quantity = quantity;
		this.rank = rank;
		this.salary = salary;
		this.status = status;
		this.title = title;
		this.type = type;
		this.views = views;
		this.deadline = deadline;
		this.category = category;
		this.company = company;
		this.applyPosts = new ArrayList<ApplyPost>();
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

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public RecruitmentStatus getStatus() {
		return status;
	}

	public void setStatus(RecruitmentStatus status) {
		this.status = status;
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

	public Integer getView() {
		return views;
	}

	public void setView(Integer views) {
		this.views = views;
	}

	public LocalDate getDeadline() {
		return deadline;
	}

	public void setDeadline(LocalDate deadline) {
		this.deadline = deadline;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	@Override
	public String toString() {
		return "Recruitment [id=" + id + ", address=" + address + ", createdAt=" + createdAt + ", description="
				+ description + ", experience=" + experience + ", quantity=" + quantity + ", rank=" + rank + ", salary="
				+ salary + ", status=" + status + ", title=" + title + ", type=" + type + ", view=" + views
				+ ", deadline=" + deadline + "]";
	}
    
}
