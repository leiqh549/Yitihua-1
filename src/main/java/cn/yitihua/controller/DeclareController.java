package cn.yitihua.controller;

import cn.yitihua.entity.Declare;
import cn.yitihua.repository.DeclareRepository;
import cn.yitihua.service.DeclareService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/declare")
public class DeclareController {

    @Autowired
    private DeclareService declareService;

    @RequestMapping("/returnAddDeclarePage")
    public String returnAddDeclarePage(){
        return "viewPage/addDeclare";
    }
    /*
    * 点击公告管理
    * */
    @RequestMapping("")
    public String declare1(Model model){
        //较冗余,有待封装
        List<Declare> listByPage=declareService.findDeclareByPage(0,5);
        model.addAttribute("listByPage",listByPage);
        return "viewPage/allDeclareList";
    }
    /*
    * 发布公告
    * */
    @RequestMapping("/addDeclare")
    public String addDeclare(Model model,Declare declare){
        Subject subject= SecurityUtils.getSubject();
        Date date=new Date();
        declare.setIsDeleted(0);
        declare.setCreated_time(date);
        //从session取出当前登录者id信息 经测试:注意session的坑,不要创建新的session,而是使用subject.getSession
        declare.setCreator_id((Long)subject.getSession().getAttribute("user_id"));
        declareService.save(declare);
        //较冗余,有待封装
        List<Declare> listByPage=declareService.findDeclareByPage(0,5);
        model.addAttribute("listByPage",listByPage);
        return "viewPage/allDeclareList";
    }

    /*
     * 发布公告
     * */
    @RequestMapping("/showDeclareByPage")
    public String showDeclareByPage(Model model,int page){
        //较冗余,有待封装
        List<Declare> listByPage=declareService.findDeclareByPage(page,5);
        model.addAttribute("listByPage",listByPage);
        return "viewPage/allDeclareList";
    }
    /*
    * 模糊查询
    * */
    @RequestMapping("/queryByLike")
    public String queryByLike(Model model,String title){
        List<Declare> list=declareService.LikeQuery(title);
        model.addAttribute("listByPage",list);
        return "viewPage/allDeclareList";
    }

    @RequestMapping("/declareDetails")
    public String declareDetails(Model model,int id){
        Declare declare=declareService.declareById(id);
        model.addAttribute("declareById",declare);
        return "viewPage/declareDetail";
    }

}
