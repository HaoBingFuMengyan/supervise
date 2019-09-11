package com.frogsing.admin.web.hy;

import com.frogsing.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by haobingfu on 2019/9/11.
 */
@Controller
@RequestMapping(value = "/hy/member")
public class MemberController {

    @Autowired
    private MemberService memberService;


}
