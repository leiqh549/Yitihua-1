package cn.yitihua.service;

import cn.yitihua.entity.Declare;
import cn.yitihua.entity.Role;
import cn.yitihua.repository.DeclareRepository;
import cn.yitihua.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleService {
    @Autowired
    RoleRepository roleRepository;

    public List<Role> findRoleByPage(int page, int size){
        /*
         * 指定大小与页数
         * */
        Pageable pageObject=new PageRequest(page,size);
        List<Role> declareListByPage =roleRepository.findAll(pageObject).getContent();
        return declareListByPage;
    }

}
