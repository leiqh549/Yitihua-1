package cn.yitihua.controller;

import com.sun.deploy.net.HttpResponse;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
/*
经测试,是否通过authc均会进入该控制器
* */
public class LoginController {
    @RequestMapping("/login")
    public String login() {

        return "login";
    }
}
