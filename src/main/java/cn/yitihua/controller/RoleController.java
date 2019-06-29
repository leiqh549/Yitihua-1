package cn.yitihua.controller;

import cn.yitihua.entity.Role;
import cn.yitihua.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;
    @RequestMapping("")
    public String role1(Model model){
        List<Role> roleList=roleService.findRoleByPage(0,5);
        model.addAttribute("roleList",roleList);
        return "viewPage/theRoleList";
    }
}
