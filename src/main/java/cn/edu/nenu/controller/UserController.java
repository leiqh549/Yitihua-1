package cn.edu.nenu.controller;

import cn.edu.nenu.domain.Dict;
import cn.edu.nenu.domain.Role;
import cn.edu.nenu.domain.User;
import cn.edu.nenu.service.DictService;
import cn.edu.nenu.service.RoleService;
import cn.edu.nenu.service.UserService;
import cn.edu.nenu.util.Constants;
import cn.edu.nenu.util.HttpServlet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * UserController Class
 *
 * @author <b>Oxidyc</b>, Copyright &#169; 2003
 * @version 1.0, 2019-03-15 7:55
 */
@Controller
@RequestMapping("/user")
public class UserController {

    private static final int PAGE_SIZE = 15;

    @Autowired
    public UserService userService;
    @Autowired
    public DictService dictService;
    @Autowired
    public RoleService roleService;

    @RequestMapping("")
    public String list(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
                       @RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model, ServletRequest request){
        Map<String, Object> searchParams = HttpServlet.getParametersStartingWith(request, "s_");
        Page<User> users = userService.getEntityPage(searchParams, pageNumber, PAGE_SIZE, sortType);
        model.addAttribute("users", users);
        model.addAttribute("sortType", sortType);
        model.addAttribute("PAGE_SIZE", PAGE_SIZE);
        model.addAttribute("searchParams", HttpServlet.encodeParameterStringWithPrefix(searchParams, "s_"));
        return "rbac/userList";
    }

    //@RequestMapping(value = "/create",method = RequestMethod.GET)
    @GetMapping(value = "/create")
    public String createForm(Model model){
        List<Dict> genders = dictService.findByType("GB_GENDER");
        model.addAttribute("genders", genders);
        return "rbac/userForm";
    }

    //@RequestMapping(value = "/create",method = RequestMethod.POST)
    @PostMapping(value = "/create")
    public String create(@Valid User newUser, RedirectAttributes redirectAttributes){
        newUser.setStatus(Constants.Status.ENABLE);
        userService.saveNew(newUser);
        redirectAttributes.addFlashAttribute("message", "创建用户");
        return "redirect:/user/";
    }

    @GetMapping(value = "/update/{id}")
    public String updateForm(@PathVariable("id") Long id,Model model){
        User user = userService.getUser(id);
        model.addAttribute("user",user);
        return "rbac/updateForm";
    }

    @PostMapping(value = "/update")
    public String update(){
        return "";
    }

    @PostMapping("/delete")
    public String delete(RedirectAttributes redirectAttributes, HttpServletRequest request){
        String[] ids = request.getParameterValues("ids");
        return "redirect:/user/";
    }

    @GetMapping(value = "/setroles/{id}")
    public String setRolesForm(@PathVariable("id")Long id,Model model){
        User user = userService.getUser(id);
        List<Role> roles = roleService.getAll();
        model.addAttribute("user",user);
        model.addAttribute("roles",roles);
        return "rbac/setrolesForm";
    }
    @PostMapping("/setroles")
    public String setRoles(RedirectAttributes redirectAttributes, HttpServletRequest request){
        String userId = request.getParameter("userid");
        String[] roleIds = request.getParameterValues("chkRoles");
        User user = userService.getUser(Long.valueOf(userId));
        Set<Role> roles = new HashSet<>();
        if (roleIds!=null){
            for (String roleId:roleIds){
                Role role = roleService.findOne(Long.valueOf(roleId));
                roles.add(role);
            }
        }
        user.setRoles(roles);
        userService.save(user);
        redirectAttributes.addFlashAttribute("message", "设置用户角色信息成功");
        return "redirect:/user/";
    }
}
