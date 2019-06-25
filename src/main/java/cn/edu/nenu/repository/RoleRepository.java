package cn.edu.nenu.repository;

import cn.edu.nenu.config.orm.PlatformRepository;
import cn.edu.nenu.domain.Role;

/**
 * RoleRepository Class
 *
 * @author <b>Oxidyc</b>, Copyright &#169; 2003
 * @version 1.0, 2019-05-31 4:22
 */
public interface RoleRepository extends PlatformRepository<Role,Long> {

    Role findFirstByOrderBySortDesc();
}
