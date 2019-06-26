package cn.yitihua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminListController {
    @RequestMapping("/AdminList")
    public String lqh() {
        return "rbac/AdminList";
    }
}