package dto;

public class CompanyHomeDTO {
    private Integer id;
    private String nameCompany;
    private String logo;
    private Long totalRecruitments;
    private Long totalApplicants;
    
	public CompanyHomeDTO() {}

	public CompanyHomeDTO(Integer id, String nameCompany, String logo, Long totalRecruitments, Long totalApplicants) {
		this.id = id;
		this.nameCompany = nameCompany;
		this.logo = logo;
		this.totalRecruitments = totalRecruitments;
		this.totalApplicants = totalApplicants;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNameCompany() {
		return nameCompany;
	}

	public void setNameCompany(String nameCompany) {
		this.nameCompany = nameCompany;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public Long getTotalRecruitments() {
		return totalRecruitments;
	}

	public void setTotalRecruitments(Long totalRecruitments) {
		this.totalRecruitments = totalRecruitments;
	}

	public Long getTotalApplicants() {
		return totalApplicants;
	}

	public void setTotalApplicants(Long totalApplicants) {
		this.totalApplicants = totalApplicants;
	}
    
}
