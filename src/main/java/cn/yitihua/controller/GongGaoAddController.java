package cn.yitihua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GongGaoAddController {
    @RequestMapping("/GongGaoAdd")
    public String lqh() {
        return "page/GongGaoAdd";
    }
}