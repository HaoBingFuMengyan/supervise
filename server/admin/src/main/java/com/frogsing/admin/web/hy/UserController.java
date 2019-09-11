package com.frogsing.admin.web.hy;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.jpa.PageUtils;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.S;
import com.frogsing.heart.web.Layer;
import com.frogsing.heart.web.Msg;
import com.frogsing.heart.web.Servlets;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.User;
import com.frogsing.member.service.UserService;
import com.frogsing.member.utils.MEMBERCol;
import com.frogsing.parameter.service.QueryService;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.frogsing.exception.ServiceException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by haobingfu on 2019/9/11.
 */
@Controller
@RequestMapping(value = "/hy/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private QueryService queryService;

    @ModelAttribute
    public void prepareData(@RequestParam(value = "id", defaultValue = "") String id, Model model, HttpServletRequest request) {
        if (B.N(id)) {
            User product = queryService.findOne(User.class, id);
            if (product != null) {
                try {
                    model.addAttribute("oriObj", BeanUtils.cloneBean(product));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                model.addAttribute("data", product);
            } else
                model.addAttribute("data", new User());
        }
    }

    @RequestMapping(value = "list.shtml")
    public String list(@RequestParam(value = "start", defaultValue = "0") int start,
                       @RequestParam(value = "limit", defaultValue = PageUtils.Limit) int limit,
                       @RequestParam(value = "sort", defaultValue = "") String[] sort,Model model,
                       ServletRequest request){
        ILoginUser user = ShiroUtils.getCurrentUser();
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, model);
        if (!user.IsAdmin())
            searchParams.put("search_eq_saddoperator",user.getId());

        Pageable pageable = PageUtils.page(start,limit, S.Desc(MEMBERCol.hy_user.dadddate));

        Page<User> list = queryService.fetchPage(User.class,pageable,searchParams);
        model.addAttribute("list",list);

        return "/member/user-list";
    }


    @RequestMapping(value = "save.shtml")
    public String userList(User user, Model model, RedirectAttributes rmodel, HttpServletRequest request) {
        try {
            ILoginUser u = ShiroUtils.getCurrentUser();

            if (user == null) {
                Msg.success(model, "非法操作", 0);
                return Layer.close();
            }
            // 会员信息记录到会员表,交易员信息记录到交易员表,初始化系统信息
            if (B.Y(user.getSusername())) {
                Msg.success(model, "用户名不能为空", 0);
                return Layer.close();
            }
            if (B.Y(user.getSname())) {
                Msg.success(model, "真实姓名不能为空", 0);
                return Layer.close();
            }

            if (B.Y(user.getId())) {//新增
                if (B.Y(user.getSpassword())) {
                    Msg.success(model, "请输入用户密码", 0);
                    return Layer.close();
                }
                if (user.getSpassword().length() < 6) {
                    Msg.success(model, "密码至少要6位", 0);
                    return Layer.close();
                }

                this.userService.newUser(user, u);
                Msg.success(model, "保存成功了", 0);
                return Layer.close();
            } else {//修改
                this.userService.modifyUser(user, u);
                Msg.success(model, "修改成功了", 0);
                return Layer.close();
            }

        } catch (ServiceException ex) {
            ex.printStackTrace();
            return Layer.error(model, ex.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return Layer.error(model, "系统错误，请联系管理员");
        }
    }

    @RequestMapping(value = "reset.shtml")
    public String reset(@RequestParam(value = "id") String id,
                        @RequestParam(value = "spassword") String spassword, Model model, RedirectAttributes rmodel, HttpServletRequest request) {

        ILoginUser user = ShiroUtils.getCurrentUser();
        try {
            this.userService.updateSpassword(id, spassword, user);
            Msg.success(model, "密码修改成功了", 0);
            return Layer.close();
        } catch (ServiceException ex) {
            ex.printStackTrace();
            return Layer.error(model, ex.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return Layer.error(model, "系统错误，请联系管理员");
        }

    }

}
