package cn.yitihua.entity;


import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

//四个字段 id permission description idDeleted
@Entity
@Table(name = "SYS_DECLARE")
public class Declare {
    @Id
    @SequenceGenerator(name = "RBBTJ_SEQ", sequenceName = "RBBTJ_SEQ", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.IDENTITY, generator = "RBBTJ_SEQ")
    @Column(name = "id",unique = true,nullable = false)
    private long id;

    @Column(name = "creator_id")
    private long creator_id;

    @Column(name = "title")
    private String title;

    @Column(name = "content")
    private String content;

    @Column(name = "created_time")
    private Date created_time;

    @Column(name = "isDeleted")
    private int isDeleted;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    /*
    * 多对一
    * */
    @ManyToOne(cascade={CascadeType.MERGE})
    @JoinColumn(name = "creator_id",insertable=false,updatable=false)
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public long getCreator_id() {
        return creator_id;
    }

    public void setCreator_id(long creator_id) {
        this.creator_id = creator_id;
    }

    public Date getCreated_time() {
        return created_time;
    }

    public void setCreated_time(Date created_time) {
        this.created_time = created_time;
    }

    public int getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(int isDeleted) {
        this.isDeleted = isDeleted;
    }
}
