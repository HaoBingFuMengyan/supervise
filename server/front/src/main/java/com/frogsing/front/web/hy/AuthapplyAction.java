package com.frogsing.front.web.hy;

import com.frogsing.heart.jpa.PageSort;
import com.frogsing.heart.jpa.PageUtils;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.S;
import com.frogsing.heart.web.BaseAction;
import com.frogsing.heart.web.Msg;
import com.frogsing.heart.web.Servlets;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.Authapply;
import com.frogsing.member.po.CompanyHolder;
import com.frogsing.member.po.ControHolder;
import com.frogsing.member.po.NaturalHolder;
import com.frogsing.member.utils.MEMBERCol;
import com.frogsing.parameter.service.QueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
public class AuthapplyAction extends BaseAction{

    @Autowired
    private QueryService queryService;

    @RequestMapping(value = "list.shtml")
    public String authappliList(@RequestParam(value = "start", defaultValue = "0") int start,
                                @RequestParam(value = "limit", defaultValue = PageUtils.Limit) int limit,
                                @RequestParam(value = "sort", defaultValue = "") String[] sort,Model model,
                                ServletRequest request){
        try {
            ILoginUser user = ShiroUtils.getCurrentUser();
            Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, model);
            searchParams.put("search_eq_smemberid",user.getMemberId());

            Pageable pageable = PageUtils.page(start,limit, S.Desc(MEMBERCol.hy_authapply.dapplydate));

            Page<Authapply> list = queryService.fetchPage(Authapply.class,pageable,searchParams);

            model.addAttribute("list",list);
        }catch (ServiceException ex){
            ex.printStackTrace();
            Msg.error(model,ex.getMessage());
        }catch (Exception e){
            e.printStackTrace();
            Msg.error(model,"系统错误，请联系管理员");
        }
        return "member/authapply-list";
    }

    @RequestMapping(value = "index.shtml")
    public String index(@RequestParam(value = "id") String id, Model model, HttpServletRequest request){
        model.addAttribute("id",id);
        return "member/authapply-index";
    }

    @RequestMapping(value = "detail.shtml")
    public String detail(@RequestParam(value = "id") String id, Model model, HttpServletRequest request){
        Authapply authapply = queryService.fetchOne(Authapply.class,id);

        model.addAttribute("data",authapply);
        return "member/authapply-detail";
    }

    @RequestMapping(value = "natural_detail.shtml")
    public String naturalDetail(@RequestParam(value = "id") String id, Model model, HttpServletRequest request) {
        List<NaturalHolder> naturalHolders = queryService.fetchList(NaturalHolder.class,null, PageSort.Asc(MEMBERCol.hy_naturalholder.isortno),
                SearchFilter.eq(MEMBERCol.hy_naturalholder.smemberid,id));

        model.addAttribute("list",naturalHolders);
        return "member/authapply-natural-detail";
    }

    @RequestMapping(value = "company_detail.shtml")
    public String companyDetail(@RequestParam(value = "id") String id, Model model, HttpServletRequest request) {
        List<CompanyHolder> companyHolders = queryService.fetchList(CompanyHolder.class,null, PageSort.Asc(MEMBERCol.hy_companyholder.isortno),
                SearchFilter.eq(MEMBERCol.hy_companyholder.smemberid,id));

        model.addAttribute("list",companyHolders);
        return "member/authapply-company-detail";
    }

    @RequestMapping(value = "control_detail.shtml")
    public String controlDetail(@RequestParam(value = "id") String id, Model model, HttpServletRequest request) {
        List<ControHolder> controHolders = queryService.fetchList(ControHolder.class,null, PageSort.Asc(MEMBERCol.hy_controholder.isortno),
                SearchFilter.eq(MEMBERCol.hy_controholder.smemberid,id));

        model.addAttribute("list",controHolders);
        return "member/authapply-control-detail";
    }

    /**
     * 企业申请入住
     * @param id
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "applyregister_{id}.shtml")
    public String applyRegister(@PathVariable String id,Model model,HttpServletRequest request){
        model.addAttribute("id",id);
        return "member/authapply-register";
    }


}
