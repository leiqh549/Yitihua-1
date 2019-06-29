package cn.yitihua.controller;

import cn.yitihua.entity.Declare;
import cn.yitihua.service.DeclareService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.jws.WebParam;
import java.util.List;

@Controller
@RequestMapping("/jump")
/*
* 用来处理界面间跳转(除首界面到子界面的跳转路径)
* */
public class JumpController {

    @Autowired
    private DeclareService declareService;

    @RequestMapping("/index")
    public String jumpIndex1(Model model){
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
    @RequestMapping("/jumpGongGao")
    public String jumpGongGao(){
        return "viewPage/myDeclare";
    }

    @RequestMapping("/jumpallDeclareList")
    public String jumpallDeclareList(Model model){
     //分页显示数据库第一页数据
        //较冗余,有待封装
        List<Declare> listPageOne=declareService.findDeclareByPage(0,5);
        model.addAttribute("listByPage",listPageOne);
        return "viewPage/allDeclareList";
    }

}
