package model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "applypost")
public class ApplyPost {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "created_at")
    private LocalDateTime createdAt = LocalDateTime.now();

    @ManyToOne
    @JoinColumn(name = "recruitment_id", referencedColumnName = "id")
    private Recruitment recruitment;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    @Column(name = "name_cv", length = 255)
    private String nameCv;

    @Column
    private Integer status;

    @Column(length = 255)
    private String text;

    public ApplyPost() {
    }

    public ApplyPost(Recruitment recruitment, User user, String nameCv, Integer status, String text) {
        this.recruitment = recruitment;
        this.user = user;
        this.nameCv = nameCv;
        this.status = status;
        this.text = text;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public Recruitment getRecruitment() {
        return recruitment;
    }

    public void setRecruitment(Recruitment recruitment) {
        this.recruitment = recruitment;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getNameCv() {
        return nameCv;
    }

    public void setNameCv(String nameCv) {
        this.nameCv = nameCv;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

	@Override
	public String toString() {
		return "ApplyPost [id=" + id + ", createdAt=" + createdAt + ", recruitment=" + recruitment + ", user=" + user
				+ ", nameCv=" + nameCv + ", status=" + status + ", text=" + text + "]";
	}
    
}
