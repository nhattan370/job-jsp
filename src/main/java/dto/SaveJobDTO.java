package dto;

public class SaveJobDTO {
	private Integer id;
	private Integer idUser;
	private Integer idRecruitment;
	
	public SaveJobDTO() {}

	public SaveJobDTO(Integer id, Integer idUser, Integer idRecruitment) {
		this.id = id;
		this.idUser = idUser;
		this.idRecruitment = idRecruitment;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getIdUser() {
		return idUser;
	}

	public void setIdUser(Integer idUser) {
		this.idUser = idUser;
	}

	public Integer getIdRecruitment() {
		return idRecruitment;
	}

	public void setIdRecruitment(Integer idRecruitment) {
		this.idRecruitment = idRecruitment;
	}
}
