package com.frogsing.front.web.main;

import com.frogsing.heart.security.shiro.ShiroUsernamePasswordToken;
import com.frogsing.heart.security.shiro.ShiroUsernamePasswordToken.UserType;
import com.frogsing.heart.security.shiro.ShiroUsernamePasswordTokenMd5;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.S;
import com.frogsing.heart.utils.T;
import com.frogsing.member.IMemberService;
import com.frogsing.member.IUserService;
import com.frogsing.member.po.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)，
 * <p>
 * 真正登录的POST请求由Filter完成,
 *
 * @frogsing van
 */
@Controller
@RequestMapping(value = "")
public class LoginAction {

    @Autowired
    private IUserService userService;

    @Autowired
    private IMemberService memberService;

    @RequestMapping(value = "login.html", method = RequestMethod.GET)
    public String login(Model model) {
        if (SecurityUtils.getSubject().isAuthenticated()) {
            return "redirect:/index.shtml";
        }

        model.addAttribute("debug", T.isDebug());
        return "member/login";
    }

    @RequestMapping(value = "logout.html", method = RequestMethod.GET)
    public String logout() {
        return "member/login";
    }

    @RequestMapping(value = "login.html", method = RequestMethod.POST)
    public String fail(
            @RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName,
            Model model) {
        model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM,
                userName);
        User u = userService.findBySusernameOrSmobile(userName, userName);
        if (u == null)
            model.addAttribute("errormsg", "用户不存在");
        else
            model.addAttribute("bisneedword", ShiroUsernamePasswordToken.isNeedWord(u.getIerrorcount()));


        model.addAttribute("userName", userName);
        return "member/login";
    }


}
