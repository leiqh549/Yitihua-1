package cn.edu.nenu.config.orm;

import javax.persistence.*;

/**
 * 统一定义id的entity基类
 *
 * 基类统一定义id的属性名称、数据类型、列名映射及生成策略。
 *
 * @author <b>Oxidyc</b>, Copyright &#169; 2003
 * @version 1.0, 2018-10-27 10:39
 */
//JPA 基类的标识
@MappedSuperclass
public abstract class IdEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id",length = 128,nullable = false,unique=true)
    protected Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}