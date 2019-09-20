package com.frogsing.front.web.hy;

import com.frogsing.common.utils.MobileCodeUtils;
import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.ext.ExtResult;
import com.frogsing.heart.jpa.JJResult;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.security.utils.MD5;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.S;
import com.frogsing.heart.web.BaseAction;
import com.frogsing.heart.web.Msg;
import com.frogsing.heart.web.Result;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.Actor;
import com.frogsing.member.po.User;
import com.frogsing.member.service.MemberService;
import com.frogsing.member.service.UserService;
import com.frogsing.member.utils.MEMBERCol.hy_user;
import com.frogsing.member.vo.LoginUser;
import com.frogsing.member.vo.TRegister;
import com.frogsing.parameter.service.QueryService;
import com.google.code.kaptcha.Producer;
import com.google.common.collect.Lists;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import javax.frogsing.exception.ServiceException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)，
 * <p>
 * 真正登录的POST请求由Filter完成,
 *
 * @frogsing van
 */
@Controller
public class UserAction extends BaseAction {

    @Autowired
    private MemberService memberService;

    @Autowired
    private UserService userService;

    @Autowired
    private Producer captchaProducer = null;
    @Autowired
    private QueryService queryService;


    @RequestMapping(value = "/user/set.shtml")
    public String userSet(Model model,HttpServletRequest request){
        model.addAttribute("data",ShiroUtils.getCurrentUser());

        return "member/user-set";
    }

    /**
     * 初始账号密码修改
     * @param id
     * @param smobile
     * @param oldpassword   原始密码
     * @param spassword 新密码
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/user/set.shtml")
    public Result modifyUser(@RequestParam(value = "id") String id,
                             @RequestParam(value = "smobile") String smobile,
                             @RequestParam(value = "oldpassword") String oldpassword,
                             @RequestParam(value = "spassword") String spassword, Model model,HttpServletRequest request){
        try {
            if (B.Y(id))
                return Result.failure("请先添加用户");

            User user = this.userService.findOne(id);

            if (user == null)
                return Result.failure("请先添加用户");

            if (B.Y(smobile))
                return Result.failure("手机号不能为空");
            if (B.Y(oldpassword))
                return Result.failure("原始密码不能为空");
            if (B.Y(spassword))
                return Result.failure("新密码不能为空");

            if (!user.getSpassword().equals(MD5.encode(oldpassword)))
                return Result.failure("原始密码不正确，请修改");

            this.userService.updateSpasswordAndSmobile(id,smobile,spassword);

            return Result.success();
        }catch (ServiceException ex){
            ex.printStackTrace();
            return Result.failure(ex.getMessage());
        }catch (Exception e){
            e.printStackTrace();
            return Result.failure("系统错误，请联系管理员");
        }
    }

    @RequestMapping(value = "register.html", method = RequestMethod.GET)
    public String pageRegister(Model model, HttpServletRequest request) {

        model.addAttribute("r", new TRegister());
        return "member/register";
    }


    @RequestMapping(value = "uniqueuser.json", method = RequestMethod.GET)
    @ResponseBody
    public ExtResult uniqueuser(@RequestParam(value = "susername") String susername, Model model,
                                HttpServletRequest request) {
        boolean flag = userService.isUniqueUser(susername);
        if (flag)
            return ExtResult.success();
        else
            return ExtResult.failure();

    }

    @RequestMapping(value = "register.html", method = RequestMethod.POST)
    public String register(TRegister r, Model model, HttpSession session, HttpServletRequest request) {
        try {

            MobileCodeUtils.checkCode(session, r.getSmobile(), r.getScheckword(), "register");
            Object obj = session.getAttribute("clientno");
            if (obj != null) {
                r.setClientno((String) obj);
            }
            userService.register(r);
            model.addAttribute("r", r);
            Msg.success(model, "注册成功!", 0);
            String checkword = captchaProducer.createText();
            request.getSession().setAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY, checkword);
            model.addAttribute("checkword", checkword);
            return "member/register-ok";
        } catch (ServiceException e) {
            model.addAttribute("error", e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", e.getMessage());
        }
        model.addAttribute("r", r);
        return "member/register";
    }

    /**
     * 修改交易员信息
     */
    @RequestMapping(value = "/hy/user/deleteuser.shtml", method = RequestMethod.GET)
    //@RequiresPermissions("user:edit")
    @ResponseBody
    public Result deleteuser(Model model, String id, int isAble) {
        try {
            LoginUser u = ShiroUtils.getCurrentUser();
            this.userService.deleteuser(id, u.getLoginName(), isAble);
            return Result.success();
        } catch (ServiceException e) {
            return Result.failure(e.getMessage());
        } catch (Exception e) {
            return Result.failure("操作出错!");
        }
    }

    /**
     * 交易员查询
     */
    @RequestMapping(value = "/hy/user/list.shtml", method = RequestMethod.GET)
    //@RequiresPermissions("user:query")
    @RequiresAuthentication
    public String userlist(Model model) {
        return "member/user-list";
    }

    /**
     * 交易员查询
     */
    @RequestMapping(value = "/hy/user/list.json")
    @RequiresAuthentication
    @ResponseBody
    public JJResult userlist(Model model, HttpServletRequest request) {


        JJResult rs = JJResult.jj(User.class, request, queryService, x -> {

            x.and(SearchFilter.eq(hy_user.smemberid, ShiroUtils.getCurrentMemberId()));
            if (!ShiroUtils.getSubject().isPermitted("user:edit")) {
                x.and(SearchFilter.eq("id", ShiroUtils.getCurrentUserId()));
            }
            x.fetch("actorList");
        });
        rs.getData().forEach(x -> {
            User u = (User) x;
            List<String> r = Lists.newArrayList();
            u.setSpassword(null);
            u.getActorList().forEach(y -> {
                r.add(y.getSrolename());
            });
            u.setRole((r.toArray(new String[r.size()])));
        });
        return rs;
    }


    /**
     * 修改登录密码
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/hy/user/gopassword.shtml")
    @RequiresAuthentication
    public String updatePassword(@RequestParam(value = "id", defaultValue = "") String id, Model model) {
        LoginUser u = ShiroUtils.getCurrentUser();
        if (B.N(id)) {
            User us = userService.fetchUser(id);
            model.addAttribute(us);
        } else
            model.addAttribute("user", u);
        return "member/user-password";
    }

    @RequestMapping(value = "/hy/user/password.shtml")
    @RequiresAuthentication
    public String doUpUpdatePassword(@RequestParam(value = "id", defaultValue = "") String id,
                                     @RequestParam(value = "code") String code, HttpSession session, @RequestParam(value = "newpassword") String newpassword,
                                     @RequestParam(value = "oldpassword", defaultValue = "") String oldpassword, RedirectAttributes redirect,
                                     Model model) {

        try {
            LoginUser u = ShiroUtils.getCurrentUser();
            MobileCodeUtils.checkCode(session, u.getSmobile(), code, "modifySpassword");//验证短信验证码是否正确
            userService.updatePassword(oldpassword, newpassword, B.Y(id) ? u.getId() : id, u.getMemberId(), 0);
            return "member/modisuccessful";
        } catch (ServiceException e) {
            Msg.error(model, e.getMessage());
            return updatePassword(id, model);
        } catch (Exception e) {
            e.printStackTrace();
            Msg.error(model, e.getMessage());
            return updatePassword(id, model);
        }

    }

    /**
     * 修改绑定手机号码
     **/
    @RequestMapping(value = "/hy/user/modifysmobile.shtml")
    public String modifySmobile(Model model, HttpServletRequest request) {
        LoginUser u = ShiroUtils.getCurrentUser();
        User user = userService.fetchUser(u.getId());
        StringBuffer bf = new StringBuffer(user.getSmobile());
        StringBuffer smobile = bf.replace(3, 7, "****");
        model.addAttribute("smobile", smobile);
        model.addAttribute("sphone", user.getSmobile());
        model.addAttribute("user", user);
        return "member/modify-smobile";
    }

    @RequestMapping(value = "/hy/user/boundsmobile.shtml", method = {RequestMethod.POST, RequestMethod.GET})
    public String boundSmobile(Model model,
                               @RequestParam(value = "id", defaultValue = "") String id,
                               String smobile, String spassword, String scheckword,
                               RedirectAttributesModelMap rmodel,
                               HttpServletRequest request, HttpSession session) {
        try {
            LoginUser u = ShiroUtils.getCurrentUser();
            User user = new User();
            if (B.Y(id))
                user = userService.fetchUser(u.getId());
            else
                user = userService.fetchUser(id);
            if (!user.getSmobile().equals(smobile))
                E.S("手机号不正确！");
            if (!user.getSpassword().equals(MD5.encode(spassword)))
                E.S("登录密码不正确！");
            MobileCodeUtils.checkCode(session, smobile, scheckword, "modifyToOldSmobile");//验证短信验证码是否正确

            StringBuffer bf = new StringBuffer(user.getSmobile());
            StringBuffer phone = bf.replace(3, 7, "****");
            model.addAttribute("smobile", phone);
            model.addAttribute("sphone", user.getSmobile());
            model.addAttribute("user", user);

            return "member/bound-smobile";
        } catch (ServiceException ex) {
            Msg.error(rmodel, ex.getMessage());
            ex.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return S.redirect("/hy/user/modifysmobile.shtml");
    }

    @RequestMapping(value = "/hy/user/modifysuccesssmobile.shtml")
    public String modifySuccessSmobile(String smobile, String scheckword,
                                       @RequestParam(value = "id", defaultValue = "") String id,
                                       @RequestParam(value = "smemberid", defaultValue = "") String smemberid,
                                       Model model, HttpServletRequest request, HttpSession session) {
        try {
            LoginUser user = ShiroUtils.getCurrentUser();
            StringBuffer bf = new StringBuffer(user.getSmobile());
            StringBuffer phone = bf.replace(3, 7, "****");
            model.addAttribute("smobile", phone);
            if (B.Y(smobile))
                E.S("手机号码不能为空！");
            if (B.Y(scheckword))
                E.S("短信验证码不能为空！");
            MobileCodeUtils.checkCode(session, smobile, scheckword, "modifyToNewSmobile");//验证短信验证码是否正确
            if (Consts.BoolType.YES.isEq(user.getBisadmin())) {//如果是管理员
                if (B.Y(smemberid))
                    memberService.UpdateMemeberSmobile(user.getMemberId(), smobile);
                else
                    memberService.UpdateMemeberSmobile(smemberid, smobile);
            }
            if (B.Y(id))
                userService.UpdateUserSmobile(user.getId(), smobile);
            else
                userService.UpdateUserSmobile(id, smobile);
            return "member/modifysuccess-smobile";
        } catch (ServiceException ex) {
            Msg.error(model, ex.getMessage());

        } catch (Exception e) {
            e.printStackTrace();
        }
        LoginUser u = ShiroUtils.getCurrentUser();
        User user = userService.fetchUser(u.getId());
        model.addAttribute("user", user);
        model.addAttribute("smobile", smobile);
        return "member/bound-smobile";
    }

    /**
     * 找回密码
     *
     * @param model
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/hy/user/forgetpwdindex.html")
    public String forgetPwdIndex(Model model, HttpServletRequest request, HttpSession session) {
        return "member/forgetPwdIndex";
    }

    /**
     * 查找手机号
     *
     * @param model
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/hy/user/findSmobile.json")
    public String findSmobile(String smobile, Model model, HttpServletRequest request, HttpSession session) {
        boolean flag = false;
        List<User> users = queryService.findAll(User.class);
        for (User user : users) {
            if (smobile.equals(user.getSmobile())) {
                flag = true;
            }
        }
        if (!flag) {
            model.addAttribute("errormsg", "手机号不存在");
        }
        model.addAttribute("flag", flag);
        return "member/forgetPwdSmobile";
    }

    @RequestMapping(value = "/hy/user/forgetpwd.html")
    public String forgetPassword(Model model, HttpServletRequest request, HttpSession session, RedirectAttributes rmodel,
                                 @RequestParam(value = "smobile", defaultValue = "") String smobile,
                                 //@RequestParam(value="susername",defaultValue="")String susername,
                                 @RequestParam(value = "scheckword", defaultValue = "") String scheckword,
                                 @RequestParam(value = "spassword", defaultValue = "") String spassword) {
        try {
            if (B.Y(smobile))
                E.S("手机号不能为空");
            User user = userService.findOneBySmobile(smobile);
            if (user == null)
                E.S("用户不存在");
            //判断短信验证码是否正确
            MobileCodeUtils.checkCode(session, smobile, scheckword, "forgetpwd");
            model.addAttribute("susername", user.getSmobile());
        } catch (ServiceException ex) {
            Msg.error(model, ex.getMessage());
            return "member/forgetPwdIndex";
        } catch (Exception e) {
            e.printStackTrace();
            return "member/forgetPwdIndex";
        }
        return "member/forgetPwd";
    }

    @RequestMapping(value = "/hy/user/forgetpwdsuccess.html")
    public String forgetPwdSuccess(Model model, HttpServletRequest request, HttpSession session,
                                   @RequestParam(value = "susername", defaultValue = "") String susername,
                                   @RequestParam(value = "spassword", defaultValue = "") String spassword) {
        try {
            //更新user密码
            if (susername.equals(spassword)) {
                model.addAttribute("errormsg", "密码不一致，请确认！");
            }
            userService.UpdateUserSpassword(susername, spassword);
            Msg.success(model, "密码找回成功", 1);
        } catch (ServiceException ex) {
            Msg.error(model, ex.getMessage());
            return "member/forgetPwd";
        } catch (Exception e) {
            e.printStackTrace();
            return "member/forgetPwd";
        }
        return "member/forgetPwd_ok";
    }

    /**
     * 找回密码验证账号和手机号是否匹配
     *
     * @param susername
     * @param smobile
     * @param model
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "checkuser.json", method = RequestMethod.POST)
    @ResponseBody
    public ExtResult checkuser(
            @RequestParam(value = "susername", defaultValue = "") String susername,
            @RequestParam(value = "smobile", defaultValue = "") String smobile,
            Model model, HttpServletRequest request, HttpSession session) {
        try {
            boolean flag = userService.findBySusernameAndSmobile(susername, smobile);
            if (flag) {
                return ExtResult.success();
            } else {
                return ExtResult.failure("账户名和手机号不匹配");
            }
        } catch (ServiceException ex) {
            return ExtResult.failure(ex.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return ExtResult.failure(e.getMessage());
        }
    }

    /**
     * @author XiaoYao
     * 进入员工子账号
     */
    @RequestMapping(value = "/user/addChild.shtml", method = RequestMethod.GET)
    @RequiresPermissions("user:query")
    public String memberChild(Model model, ServletRequest request,
                              @RequestParam(value = "type", defaultValue = "0") int type) {
        try {
            LoginUser u = ShiroUtils.getCurrentUser();
            model.addAttribute("actors", userService.findDefaultRole(u.getAuthtype(), u.getMembertype(), u.getMemberId()));
            if (!model.containsAttribute("user"))
                model.addAttribute("user", new User());
        } catch (Exception e) {
            Msg.error(model, "网络连接失败");
            e.printStackTrace();
        }
        return "member/user-add";

    }

    /**
     * @param model
     * @param request
     * @return
     * @author XiaoYao
     * 添加员工子账号
     */
    @RequestMapping(value = "/user/addChild.json", method = RequestMethod.POST)
    @RequiresPermissions("user:add")
    @ResponseBody
    public ExtResult addMemberChild(User user, Model model, String scheckword, HttpSession session, ServletRequest request, RedirectAttributes rmodel) {

        LoginUser u = ShiroUtils.getCurrentUser();
        //MobileCodeUtils.checkCode(session, user.getSmobile(), scheckword, "addMemberChild");
        user.setId(null);
        user.setSmemberid(u.getMemberId());
        //user.setSusername(user.getSmobile());
        if (user != null && u.getMemberId().equals(user.getSmemberid())) {
            userService.addUser(user, u);
        }
        return ExtResult.success("子账号添加成功");

    }

    /**
     * @param id
     * @param isable
     * @return
     * @author XiaoYao
     * 禁用或启用会员
     */
    @RequestMapping(value = "/user/deleteChild.shtml")
    @RequiresPermissions("user:edit")
    public String deleteChild(String id, int isable, Model model, RedirectAttributes rmodel) {
        try {
            LoginUser u = ShiroUtils.getCurrentUser();
            userService.deleteuser(id, u.getLoginName(), isable);
            if (isable == 1)
                Msg.success(rmodel, "启用会员成功!", 1);
            if (isable == 0)
                Msg.success(rmodel, "禁用会员成功!", 1);

        } catch (Exception e) {
            e.printStackTrace();
            Msg.error(rmodel, "系统出错，请联系管理员!");
        }
        return "redirect:/hy/member/memberchild.shtml";
    }

    /**
     * XiaoYao
     * 修改会员
     *
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = "/user/useredit.shtml", method = RequestMethod.GET)
    @RequiresAuthentication
    public String editChildPage(User user, Model model) {


        try {
            LoginUser u = ShiroUtils.getCurrentUser();
            user = userService.findOne(user.getId());
            if (!user.getSmemberid().equals(u.getMemberId()))
                E.S("您没有权限!");
            model.addAttribute("user", user);
            model.addAttribute("actors", userService.findDefaultRole(u.getAuthtype(), u.getMembertype(), u.getMemberId()));
            List<Actor> list = userService.findCheckedActor(user.getId());
            String[] ids = new String[list.size()];
            int i = 0;
            for (Actor a : list) {
                ids[i] = a.getId();
                i++;
            }
            user.setSroleids(ids);
        } catch (Exception e) {
            Msg.error(model, "网络连接失败");
            e.printStackTrace();
        }
        return "member/useredit";
    }

    @RequestMapping(value = "/user/editChild.json", method = RequestMethod.POST)
    @RequiresAuthentication
    @ResponseBody
    public ExtResult editChild(User user, RedirectAttributes rmodel, Model model) {

        if (!ShiroUtils.getSubject().isPermitted("user:edit") && !user.getId().equals(ShiroUtils.getCurrentUserId())) {
            E.S("您没有权限!");
        }
        LoginUser u = ShiroUtils.getCurrentUser();
        user.setSmemberid(u.getMemberId());
        userService.updateUser(user, u);
        return ExtResult.success();

    }


    /**
     * 用户信息
     *
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/user/userinfo.shtml", method = RequestMethod.GET)
    public String userinfo(Model model, ServletRequest request) {
        try {
            LoginUser u = ShiroUtils.getCurrentUser();
            User user = userService.findOne(u.getId());

            model.addAttribute("user", user);
            model.addAttribute("actors", userService.findDefaultRole(u.getAuthtype(), u.getMembertype(), u.getMemberId()));
            List<Actor> list = userService.findCheckedActor(user.getId());
            String[] ids = new String[list.size()];
            int i = 0;
            for (Actor a : list) {
                ids[i] = a.getId();
                i++;
            }
            user.setSroleids(ids);
        } catch (Exception e) {
            Msg.error(model, "网络连接失败");
            e.printStackTrace();
        }
        return "member/userinfo";
    }

    @RequestMapping(value = "/user/userinfo.shtml", method = RequestMethod.POST)
    @RequiresAuthentication
    public String userinfo(
            User user,
            RedirectAttributes rmodel, ServletRequest request) {
        try {
            userService.saveUser(ShiroUtils.getCurrentUser().getId(), user);
            Msg.success(rmodel, "修改成功了!", 1);
            return S.redirect("/user/userinfo.shtml");

        } catch (Exception e) {
            Msg.error(rmodel, e.getMessage());
            // e.printStackTrace();
        }
        return S.redirect("/user/userinfo.shtml");
    }

    /*
     * 修改交易密码
     */
    @RequestMapping(value = "/user/gotradepassword.shtml")
    @RequiresPermissions("user:tradepassword")
    public String updateTradePassword(Model model) {
        try {
            LoginUser u = ShiroUtils.getCurrentUser();
            User user = userService.findOne(u.getId());
            model.addAttribute("user", user);
        } catch (Exception e) {
            e.printStackTrace();
            Msg.error(model, "操作出错，请联系客服");
        }
        return "member/user-tradepassword";
    }

    @RequestMapping(value = "/user/tradepassword.shtml")
    @RequiresAuthentication
    public String doUpdateTradePassword(@RequestParam(value = "id", defaultValue = "") String id,
                                        @RequestParam(value = "newpassword") String newpassword,
                                        @RequestParam(value = "oldpassword", defaultValue = "") String oldpassword, String scheckword,
                                        HttpSession session, RedirectAttributes redirect, Model model) {
        LoginUser u = ShiroUtils.getCurrentUser();
        try {
            userService.tradepassword(id, oldpassword, newpassword);
            Msg.success(model, "操作成功!", 1);
        } catch (ServiceException e) {
            Msg.error(model, e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            Msg.error(model, e.getMessage());
        }
        return updateTradePassword(model);
    }

    /**
     * 跳转到找回交易密码
     *
     * @param model
     * @param session
     * @param request
     * @return
     */
    @RequestMapping(value = "/user/gofindtradepasswd.shtml", method = RequestMethod.GET)
    @RequiresAuthentication
    public String findtradepasswd(Model model, HttpSession session, HttpServletRequest request) {
        try {
            ILoginUser u = ShiroUtils.getCurrentUser();
            User user = this.userService.findOne(u.getId());
            if (B.Y(user.getSmobile())) {
                E.S("您的手机信息不完整，请先完善基本信息");
            }
            // MobileCodeUtils.mobileCodeHandle(session, user.getSmobile());
            model.addAttribute("user", user);
        } catch (ServiceException e) {
            Msg.error(model, e.getMessage());
        } catch (Exception e) {
            Msg.error(model, "找回密码失败!");
        }
        return "member/user-findtradepassword";
    }

    /**
     * 找回交易密码
     *
     * @param id
     * @param smobile
     * @param scheckword
     * @param model
     * @param session
     * @param request
     * @return
     */
    @RequestMapping(value = "/user/dofindtradepasswd.shtml", method = RequestMethod.POST)
    public String settradepasswd(@RequestParam(value = "id", defaultValue = "") String id,
                                 @RequestParam(value = "smobile", defaultValue = "") String smobile,
                                 @RequestParam(value = "scheckword", defaultValue = "") String scheckword, Model model,
                                 RedirectAttributesModelMap rmodel, HttpSession session, HttpServletRequest request) {
        try {
            MobileCodeUtils.checkCode(session, smobile, scheckword, "findTradePwd");
            this.userService.findTradePassword(id);
            return "redirect:/user/gotradepassword.shtml";
        } catch (ServiceException e) {
            Msg.error(rmodel, e.getMessage());
        } catch (Exception e) {
            Msg.error(rmodel, "找回密码失败!");
        }
        return "redirect:/user/gofindtradepasswd.shtml";
    }
}
