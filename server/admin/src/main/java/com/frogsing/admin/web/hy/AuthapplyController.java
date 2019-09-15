package com.frogsing.admin.web.hy;

import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.jpa.PageSort;
import com.frogsing.heart.jpa.PageUtils;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.S;
import com.frogsing.heart.web.Msg;
import com.frogsing.heart.web.Result;
import com.frogsing.heart.web.Servlets;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.Authapply;
import com.frogsing.member.po.CompanyHolder;
import com.frogsing.member.po.ControHolder;
import com.frogsing.member.po.NaturalHolder;
import com.frogsing.member.service.AuthapplyService;
import com.frogsing.member.utils.MEMBER;
import com.frogsing.member.utils.MEMBERCol;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.frogsing.exception.ServiceException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by haobingfu on 2019/9/13.
 */
@Controller
@RequestMapping(value = "/hy/authapply")
public class AuthapplyController {

    @Autowired
    private IQueryService queryService;

    @Autowired
    private AuthapplyService authapplyService;

    @RequestMapping(value = "list.shtml")
    public String list(@RequestParam(value = "start", defaultValue = "0") int start,
                       @RequestParam(value = "limit", defaultValue = PageUtils.Limit) int limit,
                       @RequestParam(value = "sort", defaultValue = "") String[] sort,Model model,
                       ServletRequest request){
        ILoginUser user = ShiroUtils.getCurrentUser();
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, model);
        if (!user.IsAdmin())
            searchParams.put("search_eq_sadduser",user.getId());

        Pageable pageable = PageUtils.page(start,limit, S.Desc(MEMBERCol.hy_authapply.dapplydate));

        Page<Authapply> list = queryService.fetchPage(Authapply.class,pageable,searchParams);
        model.addAttribute("list",list);

        return "/member/authapply-list";
    }

    @RequestMapping(value = "index.shtml")
    public String index(@RequestParam(value = "id") String id, Model model, HttpServletRequest request){
        model.addAttribute("id",id);
        return "/member/authapply-index";
    }

    @RequestMapping(value = "detail.shtml")
    public String detail(@RequestParam(value = "id") String id, Model model, HttpServletRequest request){
        Authapply authapply = queryService.fetchOne(Authapply.class,id);

        model.addAttribute("data",authapply);
        return "/member/authapply-detail";
    }

    @RequestMapping(value = "natural_detail.shtml")
    public String naturalDetail(@RequestParam(value = "id") String id, Model model, HttpServletRequest request) {
        List<NaturalHolder> naturalHolders = queryService.fetchList(NaturalHolder.class,null, PageSort.Asc(MEMBERCol.hy_naturalholder.isortno),
                SearchFilter.eq(MEMBERCol.hy_naturalholder.smemberid,id));

        model.addAttribute("list",naturalHolders);
        return "/member/authapply-natural-detail";
    }

    @RequestMapping(value = "company_detail.shtml")
    public String companyDetail(@RequestParam(value = "id") String id, Model model, HttpServletRequest request) {
        List<CompanyHolder> companyHolders = queryService.fetchList(CompanyHolder.class,null, PageSort.Asc(MEMBERCol.hy_companyholder.isortno),
                SearchFilter.eq(MEMBERCol.hy_companyholder.smemberid,id));

        model.addAttribute("list",companyHolders);
        return "/member/authapply-company-detail";
    }

    @RequestMapping(value = "control_detail.shtml")
    public String controlDetail(@RequestParam(value = "id") String id, Model model, HttpServletRequest request) {
        List<ControHolder> controHolders = queryService.fetchList(ControHolder.class,null, PageSort.Asc(MEMBERCol.hy_controholder.isortno),
                SearchFilter.eq(MEMBERCol.hy_controholder.smemberid,id));

        model.addAttribute("list",controHolders);
        return "/member/authapply-control-detail";
    }

    /**
     * 通过注册地址查询
     * @param sregaddress
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "register-address.shtml")
    @RequiresPermissions("authapply:register-address")
    public String registerAddress(@RequestParam(value = "type",defaultValue = "1") int type,
            @RequestParam(value = "sregaddress",defaultValue = "") String sregaddress,Model model,HttpServletRequest request){
        try {
            if (Consts.BoolType.NO.isEq(type)) {
                return "/member/authapply-register-address";
            }else {

                model.addAttribute("search_eq_sregaddress", sregaddress);
//                if (B.Y(sregaddress))
//                    E.S("注册地址不能为空");

                Authapply authapply = queryService.fetchOne(MEMBERCol.hy_authapply.xspec().and(
                        SearchFilter.eq(MEMBERCol.hy_authapply.sregaddress, sregaddress)).and(
                        SearchFilter.eq(MEMBERCol.hy_authapply.istatus, MEMBER.CheckStatus.CHECKED.val())).and(
                        SearchFilter.eq(MEMBERCol.hy_authapply.iapprovalstatus, MEMBER.ApprovalStatus.CHECKED.val())));
                if (authapply == null)
                    model.addAttribute("obj",null);
                else
                    model.addAttribute("obj", authapply);
            }
        }catch (Exception e){
            e.printStackTrace();
            Msg.error(model,e.getMessage());
        }

        return "/member/authapply-register-address";
    }


    /**
     * 审核
     * @param id
     * @param istatus
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "check.json")
    @ResponseBody
    @RequiresPermissions("authapply:check")
    public Result check(@RequestParam(value = "id")String id,
                        @RequestParam(value = "istatus") int istatus,Model model,HttpServletRequest request){
        try {
            ILoginUser user = ShiroUtils.getCurrentUser();

            if (Consts.BoolType.YES.isEq(istatus))
                this.authapplyService.checkOk(id,"",user);
            else
                this.authapplyService.reject(id,"",user);

            return Result.success();
        }catch (ServiceException ex){
            ex.printStackTrace();
            return Result.failure(ex.getMessage());
        }catch (Exception ex){
            ex.printStackTrace();
            return Result.failure("系统错误，请联系管理员");
        }
    }
}