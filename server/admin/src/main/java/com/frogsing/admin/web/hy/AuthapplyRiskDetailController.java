package com.frogsing.admin.web.hy;

import com.frogsing.heart.jpa.PageUtils;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.persistence.XSpec;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.S;
import com.frogsing.heart.web.Result;
import com.frogsing.heart.web.Servlets;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.AuthapplyRiskDetail;
import com.frogsing.member.service.AuthapplyRiskDetailService;
import com.frogsing.member.utils.MEMBER;
import com.frogsing.member.utils.MEMBERCol;
import com.frogsing.parameter.service.QueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.frogsing.exception.ServiceException;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by haobingfu on 2019/9/22.
 */

@Controller
@RequestMapping(value = "/hy/authapplyriskdetail")
public class AuthapplyRiskDetailController {

    @Autowired
    private QueryService queryService;

    @Autowired
    private AuthapplyRiskDetailService authapplyRiskDetailService;


    @RequestMapping(value = "risk.shtml")
    public String risk(@RequestParam(value = "id")String id,
                       @RequestParam(value = "irisktype") int irisktype,
                       @RequestParam(value = "start", defaultValue = "0") int start,
                       @RequestParam(value = "limit", defaultValue = PageUtils.Limit) int limit,
                       @RequestParam(value = "sort", defaultValue = "") String[] sort,Model model, HttpServletRequest request){

        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, model);
        XSpec<AuthapplyRiskDetail> xSpec = MEMBERCol.hy_authapplyriskdetail.xspec();

        xSpec.and(SearchFilter.eq(MEMBERCol.hy_authapplyriskdetail.sauthapplyid,id));

        Pageable pageable = PageUtils.page(start,limit, S.Desc(MEMBERCol.hy_authapplyriskdetail.ddate));

        Page<AuthapplyRiskDetail> list = null;
        MEMBER.RiskType riskType = MEMBER.RiskType.get(irisktype);
        model.addAttribute("id",id);
        model.addAttribute("irisktype",irisktype);
        switch (riskType){
            //机构自身
            case JGSELF:
                xSpec.and(SearchFilter.eq(MEMBERCol.hy_authapplyriskdetail.irisktype,MEMBER.RiskType.JGSELF.val()));

                list = queryService.listPage(pageable,xSpec);
                model.addAttribute("list",list);
                return "/member/risk-jgself";
            //核心人员
            case HXRY:
                xSpec.and(SearchFilter.eq(MEMBERCol.hy_authapplyriskdetail.irisktype,MEMBER.RiskType.HXRY.val()));

                list = queryService.listPage(pageable,xSpec);
                model.addAttribute("list",list);
                return "/member/risk-hxry";
            //关联企业
            case GLQY:
                xSpec.and(SearchFilter.eq(MEMBERCol.hy_authapplyriskdetail.irisktype,MEMBER.RiskType.GLQY.val()));

                list = queryService.listPage(pageable,xSpec);
                model.addAttribute("list",list);
                return "/member/risk-glqy";
            //在管企业
            case ZGQY:
                xSpec.and(SearchFilter.eq(MEMBERCol.hy_authapplyriskdetail.irisktype,MEMBER.RiskType.ZGQY.val()));

                list = queryService.listPage(pageable,xSpec);
                model.addAttribute("list",list);
                return "/member/risk-zgqy";
            //未备案的合伙企业
            case WBAHHQY:
                xSpec.and(SearchFilter.eq(MEMBERCol.hy_authapplyriskdetail.irisktype,MEMBER.RiskType.WBAHHQY.val()));

                list = queryService.listPage(pageable,xSpec);
                model.addAttribute("list",list);
                return "/member/risk-wbaqy";
            default:
                return "";
        }

    }

    @RequestMapping(value = "add.shtml")
    public String add(@RequestParam(value = "id")String id,
                       @RequestParam(value = "irisktype") int irisktype,
                       Model model, HttpServletRequest request){
        MEMBER.RiskType riskType = MEMBER.RiskType.get(irisktype);
        model.addAttribute("id",id);
        model.addAttribute("irisktype",irisktype);
        switch (riskType){
            //机构自身
            case JGSELF:
                return "/member/risk-jgself-add";
            //核心人员
            case HXRY:
                return "/member/risk-hxry-add";
            //关联企业
            case GLQY:
                return "/member/risk-glqy-add";
            //在管企业
            case ZGQY:
                return "/member/risk-zgqy-add";
            //未备案的合伙企业
            case WBAHHQY:
                return "/member/risk-wbaqy-add";
            default:
                return "";
        }
    }

    @RequestMapping(value = "add.json")
    @ResponseBody
    public Result addSave(@RequestParam(value = "id")String id,
                          @RequestParam(value = "irisktype") int irisktype,
                          Model model, HttpServletRequest request,AuthapplyRiskDetail authapplyRiskDetail){
        try {
            if (B.Y(id))
                return Result.failure("该企业存在异常，不能添加");

            if (B.Y(String.valueOf(irisktype)))
                return Result.failure("系统错误，请联系管理员");

            ILoginUser user = ShiroUtils.getCurrentUser();

            this.authapplyRiskDetailService.save(id,irisktype,authapplyRiskDetail,user);
            return Result.success();
        }catch (ServiceException ex){
            ex.printStackTrace();
            return Result.failure(ex.getMessage());
        }catch (Exception e){
            e.printStackTrace();
            return Result.failure("系统错误，请联系管理员");
        }

    }
}