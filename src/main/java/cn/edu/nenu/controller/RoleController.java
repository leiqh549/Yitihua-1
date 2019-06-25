package cn.edu.nenu.controller;

import cn.edu.nenu.domain.Role;
import cn.edu.nenu.service.RoleService;
import cn.edu.nenu.util.Constants;
import cn.edu.nenu.util.HttpServlet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletRequest;
import javax.validation.Valid;
import java.util.Map;

/**
 * RoleController Class
 *
 * @author <b>Oxidyc</b>, Copyright &#169; 2003
 * @version 1.0, 2019-05-24 0:55
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    private static final int PAGE_SIZE = 15;

    @Autowired
    private RoleService roleService;

    @RequestMapping("")
    public String list(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
                       @RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model, ServletRequest request){

        Map<String, Object> searchParams = HttpServlet.getParametersStartingWith(request, "s_");
        Page<Role> roles = roleService.getEntityPage(searchParams, pageNumber, PAGE_SIZE, sortType);
        model.addAttribute("roles", roles);
        model.addAttribute("sortType", sortType);
        model.addAttribute("PAGE_SIZE", PAGE_SIZE);
        model.addAttribute("searchParams", HttpServlet.encodeParameterStringWithPrefix(searchParams, "s_"));
        return "rbac/roleList";
    }

    @GetMapping(value = "create")
    public String createForm(Model model) {
        model.addAttribute("role", new Role());
        model.addAttribute("action", "create");
        return "rbac/roleForm";
    }

    @PostMapping(value = "create")
    public String create(@Valid Role newRole, RedirectAttributes redirectAttributes) {
        float sort = roleService.getMaxSort();
        newRole.setSort(sort+1);
        newRole.setStatus(Constants.Status.ENABLE);
        roleService.save(newRole);
        redirectAttributes.addFlashAttribute("message", "创建角色成功");
        return "redirect:/role/";
    }
}
