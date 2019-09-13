package com.frogsing.front.web.hy;

import com.frogsing.file.utils.FtpUtils;
import com.frogsing.heart.ext.ExtResult;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.BaseAction;
import com.frogsing.heart.web.Msg;
import com.frogsing.heart.web.Result;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.*;
import com.frogsing.member.service.AuthapplyService;
import com.frogsing.member.service.MemberService;
import com.frogsing.member.service.UserService;
import com.frogsing.member.utils.MEMBER.AuthenticateType;
import com.frogsing.member.utils.MEMBER.ImageType;
import com.frogsing.member.utils.MEMBER.MemberType;
import com.frogsing.member.vo.LoginUser;
import com.frogsing.member.vo.MemVo;
import com.frogsing.member.vo.SearchMember;
import com.frogsing.parameter.service.QueryService;
import com.google.common.collect.Lists;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.frogsing.exception.ServiceException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)，
 * <p>
 * 真正登录的POST请求由Filter完成,
 *
 * @frogsing van
 */
@Controller
@RequestMapping(value = "/hy/member")
public class MemberAction extends BaseAction {

    @Autowired
    private MemberService memberService;

    @Autowired
    private UserService userService;
    @Autowired
    private AuthapplyService authapplyService;
    @Autowired
    private QueryService queryService;


    /**
     * 会员首页
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "index.shtml")
    //@RequiresPermissions("member:query")
    public String memberList(Model model, ServletRequest request) {
        try{
            LoginUser user = ShiroUtils.getCurrentUser();
            Member member = memberService.findByID(user.getMemberId());

            Double LoanAmount = 0D;//借款余额 = 实际放款金额 - 还款金额
            int frequency = 0;//借款笔数
            Double feeTotalWeight = 0D;//自由货物库存量 = 总重量 - 注册锁定重量
            Double feelock = 0D;//质押货物库存量

            //List<PeriodFinance> list = periodFinanceService.getRepayment(user.getMemberId());

            model.addAttribute("member", member);
            model.addAttribute("userName", user.getLoginName());
            model.addAttribute("LoanAmount", "￥"+LoanAmount);
            model.addAttribute("frequency", frequency);
            model.addAttribute("feeTotalWeight", feeTotalWeight);
            model.addAttribute("feelock", feelock);
            //model.addAttribute("list", list);
        }catch(Exception e){
            Msg.error(model,"系统出错，请联系管理员");
            e.printStackTrace();
        }
        return "member/member";
    }

    /**
     * 会员认证
     * @author haobingfu
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "authapply.shtml",method = RequestMethod.GET)
    public String authApply(@RequestParam(defaultValue = "0") int type, Model model, ServletRequest request) {
    	LoginUser user = ShiroUtils.getCurrentUser();
        try {
            Member member = queryService.fetchOne(Member.class,user.getMemberId());

            model.addAttribute("member",member);

        } catch (Exception e) {
            Msg.error(model, "系统异常，请联系管理员");
            e.printStackTrace();
        }

        return "member/authapplyed";
    }


    
    /**
     * 会员认证申请
     * @author haobingfu
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "authapply.shtml", method = RequestMethod.POST)
    //@RequiresPermissions("member:auth")
    public String doAuthApply(MemVo memVo,
    		Model model, RedirectAttributes rmodel, ServletRequest request) {
        try {
            ILoginUser user = ShiroUtils.getCurrentUser();
            model.addAttribute("issuccess",true);
            return "member/authapply";
        } catch (ServiceException e) {
            Msg.error(model, e.getMessage());
        } catch (Exception e) {
            Msg.error(model, "系统出错，请联系管理员");
            e.printStackTrace();
        }
        return authApply(500,model, request);
    }

    @RequestMapping(value = "uploadimg.html")
    @RequiresAuthentication
    @ResponseBody
    public void upImage(
            @RequestParam("imgFile") CommonsMultipartFile orginalFile,
            @RequestParam("memberno") String memberno,
            @RequestParam(value = "imagetype", defaultValue = "0") int imagetype,
            Model model, HttpServletResponse response) {
        try {
            String rs = FtpUtils.uploadToFtpServerImg(orginalFile, "auth/"
                    + memberno, 3);
            ILoginUser user = ShiroUtils.getCurrentUser();
            // 保存图片地址
            memberService.saveFtpImages(user.getId(), user.getMemberId(),
                    "营业执照", rs, imagetype);
            ExtResult.success("上传成功", rs).toJson(response);
        } catch (ServiceException e) {
            ExtResult.failure("上传失败，" + e.getMessage()).toJson(response);
        } catch (Exception e) {
            ExtResult.failure("上传失败，" + e.getMessage()).toJson(response);
        }
    }

    /**
     * 校验企业全称是否重复
     */
    @RequestMapping(value = "checkScnname.shtml")
    @ResponseBody
    public String checkScnname(String oldScnname, String scnname) {
        if (B.N(scnname) && scnname.equals(oldScnname))
            return "true";
        else if (B.N(scnname) && memberService.findByScnname(scnname) == null)
            return "true";
        return "false";
    }

    @RequestMapping(value = "searchMember.json", method = RequestMethod.POST)
    @ResponseBody
    @RequiresRoles("chain")
    public Result searchMember(@RequestParam(value = "keyword", defaultValue = "") String keyword) {
        List<SearchMember> list=Lists.newArrayList();
        try{
            if(B.Y(keyword))
                return Result.success("",list);
             List<Member> members=this.memberService.queryMemberByKey(keyword, MemberType.MEMBER);
            members.forEach(obj->{
                SearchMember member=new SearchMember();
                member.setId(obj.getId());
                member.setTitle(obj.getScnname());
                list.add(member);
            });
            return Result.success("",list);
        }catch (ServiceException e){
            e.getMessage();
        }catch (Exception e){
            e.printStackTrace();
        }
        return Result.success("",list);
    }

}