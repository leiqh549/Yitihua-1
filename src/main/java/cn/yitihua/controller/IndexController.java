package cn.yitihua.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
    @RequestMapping("/index")
        public String list(Model model){
            System.out.println("indexController.class");
            return "index";
    }
    /*无权限跳转路径*/
    @RequestMapping("/invalid")
    public String invalid(){
        return "viewPage/inValid";
    }

}
