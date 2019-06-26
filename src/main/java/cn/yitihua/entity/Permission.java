package cn.yitihua.entity;
import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

//四个字段 id permission description idDeleted
    @Entity
    @Table(name = "SYS_Permission")
    public class Permission {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "id",unique = true,nullable = false)
        private long id;

        @Column(name = "permission")
        private String permission;

        @Column(name = "description")
        private String description;

        @Column(name = "isDeleted")
        private int isDeleted;

    //多对多关系 生成T_Role_Permission中间表,双向主导
    @ManyToMany
    @JoinTable(name = "T_Role_Permission",
            //与此表相连接的为role_id,与ROLE表相连的为permission_id;
            joinColumns = { @JoinColumn(name = "permission_id") },
            inverseJoinColumns = { @JoinColumn(name = "role_id") })
    // 多对多关联中Permission对象的集合
    private Set<Role> roles  = new HashSet<>();

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
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

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
