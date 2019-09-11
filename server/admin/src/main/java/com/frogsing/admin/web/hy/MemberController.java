package com.frogsing.admin.web.hy;

import com.frogsing.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by haobingfu on 2019/9/11.
 */
@Controller
@RequestMapping(value = "/hy/member")
public class MemberController {

    @Autowired
    private MemberService memberService;


    @RequestMapping(value = "add.shtml")
    public String memberAdd(Model model, HttpServletRequest request){
        return "/member/user-add";
    }

}
