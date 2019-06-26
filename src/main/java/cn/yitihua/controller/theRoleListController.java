package cn.yitihua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class theRoleListController {
    @RequestMapping("/theRoleList")
    public String lqh() {
        return "rbac/theRoleList";
    }
}
