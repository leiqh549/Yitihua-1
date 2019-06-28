package cn.yitihua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuntListController {
    @RequestMapping("/AuntList")
    public String lqh() {
        return "rbac/GongGao";
    }
}
