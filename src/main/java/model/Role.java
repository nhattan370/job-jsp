package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import enums.RoleUser;

@Entity
@Table(name="role")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "role_name", nullable = false, length = 255)
    @Enumerated(EnumType.STRING)
    private RoleUser roleName;
    
	public Role() {}
	
	public Role(Integer id, RoleUser roleName) {
		this.id = id;
		this.roleName = roleName;
	}

	public Integer getId() {
		return id;
	}

	public RoleUser getRoleName() {
		return roleName;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setRoleName(RoleUser roleName) {
		this.roleName = roleName;
	}

	@Override
	public String toString() {
		return "Role [id=" + id + ", roleName=" + roleName + "]";
	}
    
}
