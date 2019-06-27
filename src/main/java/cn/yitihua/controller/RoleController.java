package cn.yitihua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/role")
public class RoleController {
    @RequestMapping("")
    public String role1(){
        return "viewPage/theRoleList";
    }
}
