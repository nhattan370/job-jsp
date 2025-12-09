package dto;

public class CategoryDTO {
	private Integer id;
	private String name;
	private Integer numberChoose;
	
	public CategoryDTO(Integer id, String name, Integer numberChoose) {
		this.id = id;
		this.name = name;
		this.numberChoose = numberChoose;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getNumberChoose() {
		return numberChoose;
	}
	public void setNumberChoose(Integer numberChoose) {
		this.numberChoose = numberChoose;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
}
