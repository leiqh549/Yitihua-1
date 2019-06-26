package cn.yitihua.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

//四个字段 id name description isDeleted
@Entity
@Table(name = "SYS_ROLE")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id",unique = true,nullable = false)
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "isDeleted")
    private int isDeleted;

    // 多对多关系 生成T_USER_ROLE中间表,双向主导
    @ManyToMany
    @JoinTable(name = "T_USER_ROLE",
            //与此表相连接的为user_id,与ROLE表相连的为role_id;
            joinColumns = { @JoinColumn(name = "role_id") },
            inverseJoinColumns = { @JoinColumn(name = "user_id") })
    // 多对多关联中User对象的集合
    private Set<User> users = new HashSet<>();

    //多对多关系 生成T_Role_Permission中间表,双向主导
    @ManyToMany
    @JoinTable(name = "T_Role_Permission",
            //与此表相连接的为role_id, 与ROLE相连的为permission_id;
            joinColumns = { @JoinColumn(name = "role_id") },
            inverseJoinColumns = { @JoinColumn(name = "permission_id") })
    // 多对多关联中Permission对象的集合
    private Set<Permission> permissions  = new HashSet<>();

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(int isDeleted) {
        this.isDeleted = isDeleted;
    }
}
