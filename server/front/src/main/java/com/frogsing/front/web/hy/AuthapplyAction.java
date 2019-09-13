package com.frogsing.front.web.hy;

import com.frogsing.heart.jpa.PageUtils;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.S;
import com.frogsing.heart.web.BaseAction;
import com.frogsing.heart.web.Msg;
import com.frogsing.heart.web.Servlets;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.Authapply;
import com.frogsing.member.utils.MEMBERCol;
import com.frogsing.parameter.service.QueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.frogsing.exception.ServiceException;
import javax.servlet.ServletRequest;
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
}
