package cn.yitihua.entity;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

//六个字段 id name salt password isDisabled isDeleted

@Entity
@Table(name = "SYS_USER")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id",unique = true,nullable = false)
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "salt")
    private String salt;

    @Column(name = "password")
    private String password;

    @Column(name = "isDisabled")
    private int isDisabled;

    @Column(name = "isDeleted")
    private int getIsDisabled;

    //多对多关系 生成T_USER_ROLE中间表,双向主导
    @ManyToMany
    @JoinTable(name = "T_USER_ROLE",
            //与此表相连接的为user_id,与ROLE表相连的为role_id;
            joinColumns = { @JoinColumn(name = "user_id") },
            inverseJoinColumns = { @JoinColumn(name = "role_id") })
    // 多对多关联中Role对象的集合
    private Set<Role> roles = new HashSet<>();

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

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIsDisabled() {
        return isDisabled;
    }

    public void setIsDisabled(int isDisabled) {
        this.isDisabled = isDisabled;
    }

    public int getGetIsDisabled() {
        return getIsDisabled;
    }

    public void setGetIsDisabled(int getIsDisabled) {
        this.getIsDisabled = getIsDisabled;
    }
}
