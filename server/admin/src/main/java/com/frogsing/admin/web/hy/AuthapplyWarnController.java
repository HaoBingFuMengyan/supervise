package com.frogsing.admin.web.hy;

import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.jpa.PageUtils;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.persistence.XSpec;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.S;
import com.frogsing.heart.web.Result;
import com.frogsing.heart.web.Servlets;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.Authapply;
import com.frogsing.member.po.AuthapplyWarn;
import com.frogsing.member.service.AuthapplyWarnService;
import com.frogsing.member.utils.MEMBERCol;
import com.frogsing.operator.po.Operator;
import com.frogsing.operator.utils.OPERATOR;
import com.frogsing.parameter.service.QueryService;
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
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by haobingfu on 2019/9/23.
 */
@Controller
@RequestMapping(value = "/hy/authapplywarn")
public class AuthapplyWarnController {

    @Autowired
    private QueryService queryService;

    @Autowired
    private AuthapplyWarnService authapplyWarnService;


    /**
     * 风险排查
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "riskcheck.shtml")
    @RequiresPermissions("riskcheck:query")
    public String riskCheck(@RequestParam(value = "start", defaultValue = "0") int start,
                            @RequestParam(value = "limit", defaultValue = PageUtils.Limit) int limit,
                            @RequestParam(value = "sort", defaultValue = "") String[] sort,Model model, HttpServletRequest request){

        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, model);

        XSpec<AuthapplyWarn> xSpec = MEMBERCol.hy_authapplywarn.xspec();
        xSpec.and(searchParams);

        Pageable pageable = PageUtils.page(start,limit, S.Desc(MEMBERCol.hy_authapplywarn.dadddate));

        Page<AuthapplyWarn> list = queryService.listPage(pageable,xSpec);
        model.addAttribute("list",list);

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

    /**
     * 保存
     * @param authapplyWarn
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "save.json")
    @ResponseBody
    @RequiresPermissions("riskcheck:add")
    public Result check(AuthapplyWarn authapplyWarn,Model model, HttpServletRequest request){
        try {
            ILoginUser user = ShiroUtils.getCurrentUser();

            this.authapplyWarnService.save(authapplyWarn,user);

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
