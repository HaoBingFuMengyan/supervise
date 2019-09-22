package com.frogsing.admin.web.hy;

import com.frogsing.heart.jpa.PageUtils;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.persistence.XSpec;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.Result;
import com.frogsing.heart.web.Servlets;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.AuthapplyRiskDetail;
import com.frogsing.member.po.AuthapplyRiskExce;
import com.frogsing.member.service.AuthapplyRiskExceService;
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
@RequestMapping(value = "/hy/authapplyriskexce")
public class AuthapplyRiskExceController {

    @Autowired
    private QueryService queryService;

    @Autowired
    private AuthapplyRiskExceService authapplyRiskExceService;

    @RequestMapping(value = "list.shtml")
    public String risk(@RequestParam(value = "id")String id,
                       @RequestParam(value = "iexceptiontype") int iexceptiontype,
                       @RequestParam(value = "start", defaultValue = "0") int start,
                       @RequestParam(value = "limit", defaultValue = PageUtils.Limit) int limit,
                       @RequestParam(value = "sort", defaultValue = "") String[] sort, Model model, HttpServletRequest request){
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, model);
        XSpec<AuthapplyRiskExce> xSpec = MEMBERCol.hy_authapplyriskexce.xspec();

        xSpec.and(SearchFilter.eq(MEMBERCol.hy_authapplyriskexce.sriskdetailid,id));

        Pageable pageable = PageUtils.page(start,limit,null);

        Page<AuthapplyRiskExce> list = null;
        MEMBER.ExceptionType exceptionType = MEMBER.ExceptionType.get(iexceptiontype);
        model.addAttribute("id",id);
        model.addAttribute("iexceptiontype",iexceptiontype);
        switch (exceptionType){
            //司法异常
            case SFYC:
                xSpec.and(SearchFilter.eq(MEMBERCol.hy_authapplyriskexce.iexceptiontype,MEMBER.ExceptionType.SFYC.val()));

                list = queryService.listPage(pageable,xSpec);
                model.addAttribute("list",list);
                return "/member/sfyc-list";
            //行政处罚
            case XZCF:
                xSpec.and(SearchFilter.eq(MEMBERCol.hy_authapplyriskexce.iexceptiontype,MEMBER.ExceptionType.XZCF.val()));

                list = queryService.listPage(pageable,xSpec);
                model.addAttribute("list",list);
                return "/member/xzcf-list";
            //经营情况
            case JYQK:
                xSpec.and(SearchFilter.eq(MEMBERCol.hy_authapplyriskexce.iexceptiontype,MEMBER.ExceptionType.JYQK.val()));

                list = queryService.listPage(pageable,xSpec);
                model.addAttribute("list",list);
                return "/member/jyqk-list";
            //涉诉情况
            case SSQK:
                xSpec.and(SearchFilter.eq(MEMBERCol.hy_authapplyriskexce.iexceptiontype,MEMBER.ExceptionType.SSQK.val()));

                list = queryService.listPage(pageable,xSpec);
                model.addAttribute("list",list);
                return "/member/ssqk-list";
            //披露异常
            case PLYC:
                xSpec.and(SearchFilter.eq(MEMBERCol.hy_authapplyriskexce.iexceptiontype,MEMBER.ExceptionType.PLYC.val()));

                list = queryService.listPage(pageable,xSpec);
                model.addAttribute("list",list);
                return "/member/plyc-list";
            //清算异常
            case QSYC:
                xSpec.and(SearchFilter.eq(MEMBERCol.hy_authapplyriskexce.iexceptiontype,MEMBER.ExceptionType.QSYC.val()));

                list = queryService.listPage(pageable,xSpec);
                model.addAttribute("list",list);
                return "/member/qsyc-list";
            //可疑交易
            case KYJY:
                xSpec.and(SearchFilter.eq(MEMBERCol.hy_authapplyriskexce.iexceptiontype,MEMBER.ExceptionType.KYJY.val()));

                list = queryService.listPage(pageable,xSpec);
                model.addAttribute("list",list);
                return "/member/kyjy-list";
            default:
                return "";
        }

    }

    @RequestMapping(value = "add.shtml")
    public String add(@RequestParam(value = "id")String id,
                      @RequestParam(value = "iexceptiontype") int iexceptiontype,
                      Model model, HttpServletRequest request){
        MEMBER.ExceptionType exceptionType = MEMBER.ExceptionType.get(iexceptiontype);
        model.addAttribute("id",id);
        model.addAttribute("iexceptiontype",iexceptiontype);
        switch (exceptionType){
            //司法异常
            case SFYC:
                return "/member/sfyc-list-add";
            //行政处罚
            case XZCF:
                return "/member/xzcf-list-add";
            //经营情况
            case JYQK:
                return "/member/jyqk-list-add";
            //涉诉情况
            case SSQK:
                return "/member/ssqk-list-add";
            //披露异常
            case PLYC:
                return "/member/plyc-list-add";
            //清算异常
            case QSYC:
                return "/member/qsyc-list-add";
            //可疑交易
            case KYJY:
                return "/member/kyjy-list-add";
            default:
                return "";
        }
    }


    @RequestMapping(value = "add.json")
    @ResponseBody
    public Result addSave(@RequestParam(value = "id")String id,
                          @RequestParam(value = "iexceptiontype") int iexceptiontype,
                          Model model, HttpServletRequest request, AuthapplyRiskExce authapplyRiskExce){
        try {
            if (B.Y(id))
                return Result.failure("系统错误，请联系管理员");

            if (B.Y(String.valueOf(iexceptiontype)))
                return Result.failure("系统错误，请联系管理员");

            ILoginUser user = ShiroUtils.getCurrentUser();

            this.authapplyRiskExceService.save(id,iexceptiontype,authapplyRiskExce,user);
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
