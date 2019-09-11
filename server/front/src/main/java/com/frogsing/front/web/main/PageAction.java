package com.frogsing.front.web.main;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.jpa.PageUtils;
import com.frogsing.heart.log.Lg;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.security.utils.AnnotationUtils;
import com.frogsing.heart.utils.S;
import com.frogsing.heart.web.Msg;
import com.frogsing.member.po.MemberShop;
import com.frogsing.member.po.MemberShopApply;
import com.frogsing.member.po.Right;
import com.frogsing.member.service.MemberService;
import com.frogsing.member.service.UserService;
import com.frogsing.member.vo.LoginUser;
import com.frogsing.parameter.service.QueryService;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.frogsing.exception.ServiceException;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Set;

/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)，
 * <p>
 * 真正登录的POST请求由Filter完成,
 *
 * @frogsing van
 */
@Controller
@RequestMapping(value = "")
public class
PageAction {

    @Autowired
    private UserService userService;

    @Autowired
    private QueryService iQueryService;

    @Autowired
    private MemberService memberService;



    @RequestMapping(value = "index.html", method = RequestMethod.GET)
    public String index(Model model, HttpServletRequest request) {

        return S.redirect("/login.html");
//        return "page/index";
    }



    /**
     *
     *
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "market.html", method = RequestMethod.GET)
    public String market(
            @RequestParam(value = "skeywords", defaultValue = "") String skeywords,
            @RequestParam(value = "categoryid", defaultValue = "") String categoryid,
            @RequestParam(value = "start", defaultValue = "0") int start,
            @RequestParam(value = "limit", defaultValue = PageUtils.Limit) int limit,
            @RequestParam(value = "sort", defaultValue = "") String sort,
            Model model,
            HttpServletRequest request) {

        return "page/market";
    }




    @RequestMapping(value = "home.html", method = RequestMethod.GET)
    public String home(Model model, HttpServletRequest request) {
        return "page/home";
    }

    @RequestMapping(value = "find.html", method = RequestMethod.GET)
    public String find(Model model, HttpServletRequest request) {
        return "page/find";
    }

    @RequestMapping(value = "about.html", method = RequestMethod.GET)
    public String about(Model model, HttpServletRequest request) {
        return "page/about";
    }


    @RequestMapping(value = "contact.html", method = RequestMethod.GET)
    public String contact(Model model, HttpServletRequest request) {
        return "page/contact";
    }

    @RequestMapping(value = "cloud.html", method = RequestMethod.GET)
    public String cloud(Model model, HttpServletRequest request) {
        return "page/cloud";
    }

    @RequestMapping(value = "finance.html", method = RequestMethod.GET)
    public String finance(Model model, HttpServletRequest request) {
        return "page/finance";
    }

    @RequestMapping(value = "unity.html", method = RequestMethod.GET)
    public String unity(Model model, HttpServletRequest request) {
        model.addAttribute("isAuthenticated", SecurityUtils.getSubject().isAuthenticated());//是否登录
        return "page/unity";
    }

    @RequestMapping(value = "auction.html", method = RequestMethod.GET)
    public String auction(Model model, HttpServletRequest request) {
        return "page/auction";
    }

    @RequestMapping(value = "auction_view.html", method = RequestMethod.GET)
    public String auction_view(Model model, HttpServletRequest request) {
        return "page/auction_view";
    }

    @RequestMapping(value = "supervise.html", method = RequestMethod.GET)
    public String supervise(Model model, HttpServletRequest request) {
        return "page/supervise";
    }


    @RequestMapping(value = "resource_view.html", method = RequestMethod.GET)
    public String resource_view(Model model, HttpServletRequest request) {
        return "page/resource_view";
    }

    @RequestMapping(value = "myshop.html", method = RequestMethod.GET)
    public String myshop(Model model, HttpServletRequest request) {
        return "page/myshop";
    }

    @RequestMapping(value = "newer.html", method = RequestMethod.GET)
    public String newer(Model model, HttpServletRequest request) {
        return "page/newer";
    }

    @RequestMapping(value = "logistical.html", method = RequestMethod.GET)
    public String logistical(Model model, HttpServletRequest request) {
        return "page/logistical";
    }

    @RequestMapping(value = "controls.html", method = RequestMethod.GET)
    public String controls(Model model, HttpServletRequest request) {
        return "page/controls";
    }

    @RequestMapping(value = "chain.html", method = RequestMethod.GET)
    public String chain(Model model, HttpServletRequest request) {
        return "page/chain";
    }

    @RequestMapping(value = "declaration.html", method = RequestMethod.GET)
    public String declaration(Model model, HttpServletRequest request) {
        return "page/declaration";
    }






    //开通店铺预览
    @RequestMapping(value = "shop.html", method = RequestMethod.GET)
    public String shop(@RequestParam(value = "id", required = true) String id,
                       Model model, HttpServletRequest request) {
        try {
            MemberShop memberShop = iQueryService.fetchOne(MemberShop.class, id);
            if (memberShop == null)
                E.S("抱歉，还未开通店铺");
            model.addAttribute("membershop", memberShop);
        } catch (ServiceException ex) {
            ex.printStackTrace();
            Msg.error(model,ex.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            Msg.error(model,"系统错误，请联系管理员");
        }
        return "page/shop";
    }
    //未开通店铺预览
    @RequestMapping(value = "apply.html", method = RequestMethod.GET)
    public String shopApply(@RequestParam(value = "id", required = true) String id,
                       Model model, HttpServletRequest request) {
        try {
            MemberShopApply memberShopApply = iQueryService.fetchOne(MemberShopApply.class,id);
            if (memberShopApply == null)
                E.S("抱歉，还未申请开通店铺");
            model.addAttribute("membershop", memberShopApply);
        } catch (ServiceException ex) {
            ex.printStackTrace();
            Msg.error(model,ex.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            Msg.error(model,"系统错误，请联系管理员");
        }
        return "page/shop";
    }
   /* @RequestMapping(value = "combinebuy.html", method = RequestMethod.GET)
    public String combinebuy(Model model, HttpServletRequest request) {
        return "page/combinebuy";
    }*/

    /*@RequestMapping(value = "combinebuy_view.html", method = RequestMethod.GET)
    public String combinebuy_view(Model model, HttpServletRequest request) {
        return "page/combinebuy_view";
    }*/


    @RequestMapping(value = "check.shtml", method = RequestMethod.GET)
    @ResponseBody
    public List<Set<String>> checkRight() {
        List<Right> list = iQueryService.findAll(Right.class);


        final Set<String> allRight = AnnotationUtils.getAllRight("com.frogsing.*.action");
        Set<String> rs = Sets.newHashSet(allRight);
        for (Right right : list) {
            String p = right.getSurlpath();
            String[] ps = p.split(",");
            for (int i = 0; i < ps.length; i++) {
                rs.remove(ps[i]);
            }
        }
        for (String x : rs) {
            Lg.error(String.format("未定义的权限码:%s", x));
        }
        return Lists.newArrayList(rs, allRight);
    }


}
