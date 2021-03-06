package com.frogsing.front.web.main;

import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.member.po.*;
import com.frogsing.member.service.AuthapplyService;
import com.frogsing.member.service.UserService;
import com.frogsing.member.vo.LoginUser;
import com.frogsing.parameter.service.QueryService;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)，
 * <p>
 * 真正登录的POST请求由Filter完成,
 *
 * @frogsing van
 */
@Controller
public class OfficeAction {

    @Autowired
    private UserService userService;

    @Autowired
    private AuthapplyService authapplyService;

    @Autowired
    private QueryService queryService;


    //后台管理首页
    @RequestMapping(value = "index.shtml", method = RequestMethod.GET)
    @RequiresAuthentication
    public String index(Model model, HttpServletRequest request) {
        LoginUser u = ShiroUtils.getCurrentUser();
        User user = userService.fetchUser(u.getId());
        model.addAttribute("user", user);
        Member member = queryService.fetchOne(Member.class, u.getMemberId());

        model.addAttribute("member",member);
        return "of/member_index";

    }

    /**
     * 账号设置
     *
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "setup.shtml", method = RequestMethod.GET)
    public String setup(Model model, HttpServletRequest request) {
        LoginUser u = ShiroUtils.getCurrentUser();
        User user = userService.fetchUser(u.getId());
        model.addAttribute("user", user);
        return "of/setup";
    }

    /**
     * 修改登陆密码
     *
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "resetpw.shtml", method = RequestMethod.GET)
    public String resetpw(Model model, HttpServletRequest request) {
        return "of/resetpw";
    }

    /**
     * 修改手机号
     *
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "resetphone.shtml", method = RequestMethod.GET)
    public String resetphone(Model model, HttpServletRequest request) {
        return "of/resetphone";
    }

    @RequestMapping(value = "resetph_ch.shtml", method = RequestMethod.GET)
    public String resetph_ch(Model model, HttpServletRequest request) {
        return "of/resetph_ch";
    }

    @RequestMapping(value = "resetph_done.shtml", method = RequestMethod.GET)
    public String resetph_done(Model model, HttpServletRequest request) {
        return "of/resetph_done";
    }


    @RequestMapping(value = "shopcar_min.shtml", method = RequestMethod.GET)
    public String shopcar_min(Model model, HttpServletRequest request) {
        return "of/shopcar_min";
    }


    @RequestMapping(value = "invoice.shtml", method = RequestMethod.GET)
    public String invoice(Model model, HttpServletRequest request) {
        return "of/invoice";
    }

    @RequestMapping(value = "collect.shtml", method = RequestMethod.GET)
    public String collect(Model model, HttpServletRequest request) {
        return "of/collect";
    }


}
