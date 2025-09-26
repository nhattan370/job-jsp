package dto;

public class DashboardStatus {
	private Long numberCandidate;
	private Long numberCompany;
	private Long numberRecruitment;
	
	public DashboardStatus(Long numberCandidate, Long numberCompany, Long numberRecruitment) {
		this.numberCandidate = numberCandidate;
		this.numberCompany = numberCompany;
		this.numberRecruitment = numberRecruitment;
	}
	public Long getNumberCandidate() {
		return numberCandidate;
	}
	public void setNumberCandidate(Long numberCandidate) {
		this.numberCandidate = numberCandidate;
	}
	public Long getNumberCompany() {
		return numberCompany;
	}
	public void setNumberCompany(Long numberCompany) {
		this.numberCompany = numberCompany;
	}
	public Long getNumberRecruitment() {
		return numberRecruitment;
	}
	public void setNumberRecruitment(Long numberRecruitment) {
		this.numberRecruitment = numberRecruitment;
	}
	@Override
	public String toString() {
		return "DashboardStatus [numberCandidate=" + numberCandidate + ", numberCompany=" + numberCompany
				+ ", numberRecruitment=" + numberRecruitment + "]";
	}
}
