package cn.yitihua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuntGongGaoController {
    @RequestMapping("/ AuntGongGao")
    public String lqh() {
        return "rbac/Aunt AuntGongGao";
    }
}
