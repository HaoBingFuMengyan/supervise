package com.frogsing.admin.web.hy;

import com.frogsing.heart.web.Result;
import com.frogsing.member.vo.RiskVo;
import com.frogsing.parameter.service.QueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.frogsing.exception.ServiceException;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by haobingfu on 2019/9/21.
 */
@Controller
@RequestMapping(value = "/hy/authapplyrisk")
public class AuthapplyRiskController {

    @Autowired
    private QueryService queryService;



    @RequestMapping(value = "save.json")
    public Result save(RiskVo riskVo, Model model, HttpServletRequest request){
        try {
            System.out.println();
        }catch (ServiceException ex){
            ex.printStackTrace();
        }catch (Exception e){
            e.printStackTrace();
        }

        return Result.success();
    }
}
