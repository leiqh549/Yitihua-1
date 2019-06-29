package cn.yitihua.entity;
import javax.persistence.*;
import java.util.*;

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

    @Column(name = "realname")
    private String realname;

    @Column(name = "salt")
    private String salt;

    @Column(name = "password")
    private String password;

    @Column(name = "isDisabled")
    private int isDisabled;

    @Column(name = "isDeleted")
    private int getIsDisabled;

    @ManyToMany
    @JoinTable(name = "T_USER_ROLE",
            joinColumns = { @JoinColumn(name = "user_id") },
            inverseJoinColumns = { @JoinColumn(name = "role_id") })
    // 多对多关联中Role对象的集合
    private Set<Role> roles = new HashSet<>();

    //通过roles集合得到所有roles的permission
    public  Set<String> getPermissionaByRoles(){
        Set<String> permissionsByRoleSet =new HashSet<String>();
        Set<String> permissionsByRole =new HashSet<String>();
        Iterator<Role> it1 = roles.iterator();
        Iterator<String> it2;
        while (it1.hasNext()){
            Role role=it1.next();
            permissionsByRole=role.permissionSet();
          //遍历并添加到permissionsByRoleSet集合中
            it2=permissionsByRole.iterator();
            while(it2.hasNext()){
                permissionsByRoleSet.add(it2.next());
            }
        }
        return permissionsByRoleSet;
    }

    //得到关联的Role对象的String
    public Set<String> roleSet(){
        Set<String> roleSet=new HashSet<String>();
        Iterator<Role> it = roles.iterator();
        while (it.hasNext()) {
            Role role = it.next();
         //Long型转成String类型
            roleSet.add(role.getName());
        }
        return roleSet;
    }

    /*
    * 一对多
    * */
    @OneToMany(fetch=FetchType.LAZY,cascade={CascadeType.MERGE,CascadeType.REMOVE})
    @JoinColumn(name="creator_id")
    private List<Declare> addresses = new ArrayList<Declare>();

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
    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }
    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
