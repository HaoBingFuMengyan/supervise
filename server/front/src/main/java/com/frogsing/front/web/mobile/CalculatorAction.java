package com.frogsing.front.web.mobile;

import com.frogsing.parameter.service.QueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping(value = "/mb/calculator")
@Controller
public class CalculatorAction {


    @Autowired
    private QueryService queryService;


    @GetMapping("evaluate.html")
    public String evaluate(){

        return "calculator/evaluate";
    }

    @RequestMapping("evaluateSum.html")
    public String evaluateSum(@RequestParam(defaultValue = "") String yuanyou,
                              @RequestParam(defaultValue = "") String caigou,
                              @RequestParam(defaultValue = "") String gongyinglian,Model model,
                              @RequestParam(defaultValue = "0") String tapIndex){

        model.addAttribute("yuanyou",yuanyou);
        model.addAttribute("caigou",caigou);
        model.addAttribute("gongyinglian",gongyinglian);
        model.addAttribute("tapIndex",tapIndex);
        return "calculator/evaluateSum";
    }

    @RequestMapping("evaluateSumMore.html")
    public String evaluateSumMore(@RequestParam(defaultValue = "")String obj ,
                                  @RequestParam(defaultValue = "")String tapIndex,
                                  @RequestParam(defaultValue = "")String type,Model model){

        model.addAttribute("obj",obj);
        model.addAttribute("tapIndex",tapIndex);
        model.addAttribute("type",type);
        return "calculator/evaluateSumMore";
    }




}
