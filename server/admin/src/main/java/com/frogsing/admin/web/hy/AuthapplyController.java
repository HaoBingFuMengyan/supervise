package com.frogsing.admin.web.hy;

import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.jpa.PageUtils;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.S;
import com.frogsing.heart.web.Servlets;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.Authapply;
import com.frogsing.member.po.User;
import com.frogsing.member.utils.MEMBERCol;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletRequest;
import java.util.Map;

/**
 * Created by haobingfu on 2019/9/13.
 */
@Controller
@RequestMapping(value = "/hy/authapply")
public class AuthapplyController {

    @Autowired
    private IQueryService queryService;

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
}
