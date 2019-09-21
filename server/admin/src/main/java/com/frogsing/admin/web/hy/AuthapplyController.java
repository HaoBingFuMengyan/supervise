package com.frogsing.admin.web.hy;

import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.jpa.PageSort;
import com.frogsing.heart.jpa.PageUtils;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.persistence.XSpec;
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
import com.frogsing.operator.po.Operator;
import com.frogsing.operator.utils.OPERATOR;
import org.apache.http.auth.AUTH;
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

        Operator operator = queryService.findOne(Operator.class,user.getId());

        XSpec<Authapply> xSpec = MEMBERCol.hy_authapply.xspec();
        xSpec.and(searchParams);

        //审批科内部审核申请入驻的企业
        if (OPERATOR.OperatorType.SPK.isEq(operator.getIoperatortype())) {
//            xSpec.or(SearchFilter.eq(MEMBERCol.hy_authapply.iprocess,MEMBER.Process.ZSJG.val()),
//                    SearchFilter.eq(MEMBERCol.hy_authapply.iprocess,MEMBER.Process.REJECT.val()),
//                    SearchFilter.eq(MEMBERCol.hy_authapply.iprocess, MEMBER.Process.OK.val()));
        }else if (!user.IsAdmin() && OPERATOR.OperatorType.SYSTEM.isNot(operator.getIoperatortype()))
            xSpec.and(SearchFilter.eq(MEMBERCol.hy_authapply.sadduser,user.getId()));

        Pageable pageable = PageUtils.page(start,limit, S.Desc(MEMBERCol.hy_authapply.dapplydate));

        Page<Authapply> list = queryService.listPage(pageable,xSpec);
        model.addAttribute("list",list);
        model.addAttribute("operator",operator);

        return "/member/authapply-list";
    }

    /**
     * 街道办事处待审核
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "jdbsccheck.shtml")
    @RequiresPermissions("authapply:againquery")
    public String againCheck(@RequestParam(value = "start", defaultValue = "0") int start,
                             @RequestParam(value = "limit", defaultValue = PageUtils.Limit) int limit,
                             @RequestParam(value = "sort", defaultValue = "") String[] sort,Model model,
                             ServletRequest request){
        ILoginUser user = ShiroUtils.getCurrentUser();
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, model);

        searchParams.put("search_eq_iprocess", MEMBER.Process.JDBSC.val());

        Pageable pageable = PageUtils.page(start,limit, S.Desc(MEMBERCol.hy_authapply.dapplydate));

        Page<Authapply> list = queryService.fetchPage(Authapply.class,pageable,searchParams);
        model.addAttribute("list",list);

        return "/member/authapply-again-list";
    }


    @RequestMapping(value = "index.shtml")
    public String index(@RequestParam(value = "id") String id, Model model, HttpServletRequest request){
        ILoginUser user = ShiroUtils.getCurrentUser();
        model.addAttribute("data",queryService.findOne(Authapply.class,id));
        model.addAttribute("operator",queryService.findOne(Operator.class,user.getId()));
        return "/member/authapply-index";
    }

    @RequestMapping(value = "detail.shtml")
    public String detail(@RequestParam(value = "id") String id, Model model, HttpServletRequest request){
        Authapply authapply = queryService.fetchOne(Authapply.class,id);

        model.addAttribute("data",authapply);

        ILoginUser user = ShiroUtils.getCurrentUser();

        Operator operator = queryService.findOne(Operator.class,user.getId());
        model.addAttribute("operator",operator);
        model.addAttribute("isAdmin",user.IsAdmin() == true ? 1 : 0);
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

    @RequestMapping(value = "report_detail.shtml")
    public String reportDetail(@RequestParam(value = "id") String id, Model model, HttpServletRequest request) {
        return "/member/authapply-report-detail";
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
                ILoginUser user = ShiroUtils.getCurrentUser();

                Operator operator = queryService.findOne(Operator.class,user.getId());

                XSpec<Authapply> spec = MEMBERCol.hy_authapply.xspec().and(
                        SearchFilter.eq(MEMBERCol.hy_authapply.sregaddress, sregaddress)).and(
                        SearchFilter.eq(MEMBERCol.hy_authapply.istatus, MEMBER.CheckStatus.CHECKED.val())).and(
                        SearchFilter.eq(MEMBERCol.hy_authapply.iapprovalstatus, MEMBER.ApprovalStatus.CHECKED.val()));


                if (OPERATOR.OperatorType.SPK.isEq(operator.getIoperatortype())){
                    spec.or(SearchFilter.eq(MEMBERCol.hy_authapply.iprocess,MEMBER.Process.ZSJG.val()),
                            SearchFilter.eq(MEMBERCol.hy_authapply.iprocess,MEMBER.Process.JDBSC.val()));
                }

                Authapply authapply = queryService.fetchOne(spec);

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

    /**
     * 复审
     * @param id
     * @param iapprovalstatus
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "changeinfocheck.json")
    @ResponseBody
    @RequiresPermissions("authapply:check")
    public Result changeInfoCheck(@RequestParam(value = "id")String id,
                        @RequestParam(value = "iapprovalstatus") int iapprovalstatus,Model model,HttpServletRequest request){
        try {
            ILoginUser user = ShiroUtils.getCurrentUser();

            this.authapplyService.changeInfoCheck(id,iapprovalstatus,"",user);

            return Result.success();
        }catch (ServiceException ex){
            ex.printStackTrace();
            return Result.failure(ex.getMessage());
        }catch (Exception ex){
            ex.printStackTrace();
            return Result.failure("系统错误，请联系管理员");
        }
    }

    /**
     * 招商机构初审 (内部审核专员直接审核，不需要两部操作)
     * @param id
     * @param iprocess
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "zscheck.json")
    @ResponseBody
    @RequiresPermissions("authapply:firstcheck")
    public Result zscheck(@RequestParam(value = "id")String id,
                        @RequestParam(value = "iprocess") int iprocess,Model model,HttpServletRequest request){
        try {
            ILoginUser user = ShiroUtils.getCurrentUser();

            this.authapplyService.firstcheck(id,iprocess,user);

            return Result.success();
        }catch (ServiceException ex){
            ex.printStackTrace();
            return Result.failure(ex.getMessage());
        }catch (Exception ex){
            ex.printStackTrace();
            return Result.failure("系统错误，请联系管理员");
        }
    }

    /**
     * 街道办事处审核
     * @param id
     * @param iprocess
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "againcheck.json")
    @ResponseBody
    @RequiresPermissions("authapply:againcheck")
    public Result againCheck(@RequestParam(value = "id")String id,
                        @RequestParam(value = "iprocess") int iprocess,Model model,HttpServletRequest request){
        try {
            ILoginUser user = ShiroUtils.getCurrentUser();

            this.authapplyService.againcheck(id,iprocess,user);

            return Result.success();
        }catch (ServiceException ex){
            ex.printStackTrace();
            return Result.failure(ex.getMessage());
        }catch (Exception ex){
            ex.printStackTrace();
            return Result.failure("系统错误，请联系管理员");
        }
    }

    /**
     * 企业信息变更   街道办事处、工商审批科、金融监管局可查看企业信息
     * @param start
     * @param limit
     * @param sort
     * @param model
     * @param request
     * @param type
     *              0：企业信息变更列表，1：监管询问
     * @return
     */
    @RequestMapping(value = "changeinfo.shtml")
    @RequiresPermissions({"changeinfo:query","daily:query"})
    public String changeInfo(@RequestParam(value = "start", defaultValue = "0") int start,
                       @RequestParam(value = "limit", defaultValue = PageUtils.Limit) int limit,
                       @RequestParam(value = "sort", defaultValue = "") String[] sort,Model model,
                       @RequestParam(value = "type", defaultValue = "0") int type,
                       ServletRequest request){
        model.addAttribute("type",type);
        ILoginUser user = ShiroUtils.getCurrentUser();
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, model);

        searchParams.put("search_eq_bisincompany", Consts.BoolType.YES.val());
        if (type == 0) {
            searchParams.put("search_eq_iapprovalstatus", MEMBER.ApprovalStatus.WAIT.val());
            searchParams.put("search_eq_istatus", MEMBER.CheckStatus.CHECKED.val());
        }

        Pageable pageable = PageUtils.page(start,limit, S.Desc(MEMBERCol.hy_authapply.dapplydate));

        Page<Authapply> list = queryService.fetchPage(Authapply.class,pageable,searchParams);
        model.addAttribute("list",list);

        Operator operator = queryService.findOne(Operator.class,user.getId());
        model.addAttribute("operator",operator);

        return "/member/authapply-changeinfo-list";
    }

    /**
     *  监管问询
     * @param id
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "dail-index.shtml")
    public String dailIndex(@RequestParam(value = "id") String id, Model model, HttpServletRequest request){

        model.addAttribute("data",queryService.findOne(Authapply.class,id));

        return "/member/authapply-dail-index";
    }

    /**
     * 风险检测报告
     * @param id
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "risk.shtml")
    public String authapplyRisk(@RequestParam(value = "id") String id, Model model, HttpServletRequest request){

        model.addAttribute("data",queryService.findOne(Authapply.class,id));

        return "/member/authapply-risk";
    }


    /**
     * 风险排查
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "riskcheck.shtml")
    @RequiresPermissions("riskcheck:query")
    public String riskCheck(Model model,HttpServletRequest request){
        return "/member/authapply-riskcheck";
    }

    /**
     * 风险排查新增
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "riskcheck-add.shtml")
    @RequiresPermissions("riskcheck:add")
    public String riskAdd(Model model,HttpServletRequest request){
        return "/member/authapply-riskcheck-add";
    }
}
