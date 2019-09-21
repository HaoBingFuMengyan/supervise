package com.frogsing.admin.web.hy;

import com.frogsing.parameter.service.QueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by haobingfu on 2019/9/21.
 */
@Controller
@RequestMapping(value = "/hy/authapplyrisk")
public class AuthapplyRiskController {

    @Autowired
    private QueryService queryService;


}
