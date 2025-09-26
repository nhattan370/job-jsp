package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="category")
public class Category {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String name;
	@Column(name="number_choose")
	private Integer numberChoose;
	
	public Category() {}
	
	public Category(Integer id, String name, Integer numberChoose) {
		this.id = id;
		this.name = name;
		this.numberChoose = numberChoose;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", numberChoose=" + numberChoose + "]";
	}
}
