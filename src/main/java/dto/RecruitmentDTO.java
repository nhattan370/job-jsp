package dto;

public class RecruitmentDTO {
	private Integer idCompany;
	private String nameCompany;
	private Integer id;
	private String title;
	private String type;
	private String address;
	
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
	
}
