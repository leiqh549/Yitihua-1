package cn.yitihua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GongGaoListController {
    @RequestMapping("/GongGaoList")
    public String lqh() {
        return "rbac/GongGaoList";
    }
}