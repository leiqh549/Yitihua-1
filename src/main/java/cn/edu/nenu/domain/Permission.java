package cn.edu.nenu.domain;

import cn.edu.nenu.config.orm.IdEntity;
import cn.edu.nenu.util.Constants;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Permission Class
 *
 * @author <b>Oxidyc</b>, Copyright &#169; 2003
 * @version 1.0, 2019-05-30 13:26
 */
@Entity
@Table(name = "T_PERMISSION")
public class Permission extends IdEntity {

    private Long pId;//父编码
    private String name;
    private String resourceType;
    private String url;//
    private Constants.Status status= Constants.Status.DISABLE;//状态

    //@ManyToMany(mappedBy="roles")
    //private Set<Role> roles=new HashSet<>();//

    public Long getpId() {
        return pId;
    }

    public void setpId(Long pId) {
        this.pId = pId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getResourceType() {
        return resourceType;
    }

    public void setResourceType(String resourceType) {
        this.resourceType = resourceType;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Constants.Status getStatus() {
        return status;
    }

    public void setStatus(Constants.Status status) {
        this.status = status;
    }

}
