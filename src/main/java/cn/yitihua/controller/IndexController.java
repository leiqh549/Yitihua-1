package cn.yitihua.controller;

import cn.yitihua.entity.Declare;
import cn.yitihua.service.DeclareService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private DeclareService declareService;
    /*
    * 根据角色控制访问路径
    * */
    @RequestMapping("/index")
        public String list1(Model model){
        Subject subject = SecurityUtils.getSubject();
        String jumpPage="";
        /*
         * 根据角色返回首页
         * */
        if(subject.hasRole("OrdinaryAunt")){
            model.addAttribute("role","普通阿姨");
            jumpPage="ordinaryAuntIndex";
        }
        if(subject.hasRole("ManagerAunt")){
            model.addAttribute("role","管理员阿姨");
            jumpPage="managerAuntIndex";
        }
        System.out.println("indexController.class");
        return jumpPage;
    }

//    /*无权限跳转路径*/
//    @RequestMapping("/invalid")
//    public String invalid(){
//        return "viewPage/inValid";
//    }
}
