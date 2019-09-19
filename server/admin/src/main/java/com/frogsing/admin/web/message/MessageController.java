package com.frogsing.admin.web.message;

import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.operator.po.Operator;
import com.frogsing.parameter.service.QueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by haobingfu on 2019/9/19.
 */
@Controller
@RequestMapping(value = "/cx/message")
public class MessageController {


    @Autowired
    private QueryService queryService;

//    @Autowired
//    private m
    /**
     *  监管问询聊天记录
     * @param id
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "dail-list.shtml")
    public String dailList(@RequestParam(value = "id") String id,
                           @RequestParam(value = "type",defaultValue = "0") int type, Model model, HttpServletRequest request){
        model.addAttribute("id",id);

        ILoginUser user = ShiroUtils.getCurrentUser();

        Operator operator = queryService.findOne(Operator.class,user.getId());
        model.addAttribute("operator",operator);

        if (type == 0)
            return "/member/authapply-dail-list";
        else
            return "/member/authapply-dail-message";
    }
}
