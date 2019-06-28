package cn.yitihua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class theAuntAddController {
    @RequestMapping("/theAunAdd")
    public String lqh() {
        return "rbac/theAuntAdd";
    }
}