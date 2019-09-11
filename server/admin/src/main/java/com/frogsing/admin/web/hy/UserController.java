package com.frogsing.admin.web.hy;

import com.frogsing.member.service.UserService;
import com.frogsing.parameter.service.QueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.frogsing.exception.ServiceException;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by haobingfu on 2019/9/11.
 */
@Controller
@RequestMapping(value = "/hy/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private QueryService queryService;


    @RequestMapping(value = "list.shtml")
    public String userList(Model model, HttpServletRequest request){
        try {

        }catch (ServiceException ex){

        }
        return "member/user-list";
    }
}
