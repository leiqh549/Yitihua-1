package cn.edu.nenu.service;

import cn.edu.nenu.config.orm.jpa.DynamicSpecifications;
import cn.edu.nenu.config.orm.jpa.SearchFilter;
import cn.edu.nenu.domain.Role;
import cn.edu.nenu.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * RoleService Class
 *
 * @author <b>Oxidyc</b>, Copyright &#169; 2003
 * @version 1.0, 2019-05-31 4:20
 */
@Service
public class RoleService {

    @Autowired
    private RoleRepository roleRepo;

    public Role findOne(Long id){
        return roleRepo.findOne(id);
    }

    /**
     * 保存一个实体，常用
     */
    public Role save(Role entity){
        return roleRepo.save(entity);
    }

    /**
     * 根据查询条件获取分页结果数据
     */
    public Page<Role> getEntityPage(Map<String, Object> filterParams, int pageNumber, int pageSize, String sortType){
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<Role> spec = buildSpecification(filterParams);
        return roleRepo.findAll(spec,pageRequest);
    }

    /**
     * 创建分页请求.
     */
    private PageRequest buildPageRequest(int pageNumber, int pageSize, String sortType) {
        Sort sort = null;
        if ("auto".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "id");
        } else if ("sort".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "sort");
        }
        return new PageRequest(pageNumber - 1, pageSize, sort);
    }

    /**
     * 创建动态查询条件组合.
     */
    private Specification<Role> buildSpecification(Map<String, Object> filterParams) {

        Map<String, SearchFilter> filters = SearchFilter.parse(filterParams);
        //if (StringUtils.isNotBlank(id)) {
        //    filters.put("id", new SearchFilter("id", SearchFilter.Operator.EQ, id));
        //}
        Specification<Role> spec = DynamicSpecifications.bySearchFilter(filters.values(), Role.class);
        return spec;
    }

    public float getMaxSort() {
        Role role = roleRepo.findFirstByOrderBySortDesc();
        if (role==null){
            return 0;
        }else {
            return role.getSort();
        }
    }

    public List<Role> getAll() {
        return (List<Role>) roleRepo.findAll();
    }
}
