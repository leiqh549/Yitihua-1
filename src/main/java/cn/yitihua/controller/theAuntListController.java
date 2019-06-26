package cn.yitihua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class theAuntListController {
    @RequestMapping("/theAuntList")
    public String lqh() {
        return "rbac/theAuntList";
    }
}
