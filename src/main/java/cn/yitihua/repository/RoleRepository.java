package cn.yitihua.repository;

import cn.yitihua.entity.Declare;
import cn.yitihua.entity.Role;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
public interface RoleRepository extends CrudRepository<Role,Long>,PagingAndSortingRepository<Role,Long> {

}
