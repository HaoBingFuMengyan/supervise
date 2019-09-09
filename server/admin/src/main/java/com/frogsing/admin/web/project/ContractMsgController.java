package com.frogsing.admin.web.project;

import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.S;
import com.frogsing.heart.web.Msg;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.project.po.Contractmsg;
import com.frogsing.project.service.ContractmsgService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.frogsing.exception.ServiceException;
import javax.servlet.http.HttpServletRequest;


/**
 * @Author: WangJiangLin
 * @Date: Created in 16:58 2019-05-15
 * @Description:
 */
@Controller
@RequestMapping(value = "/contractmsg")
public class ContractMsgController {


    @Autowired
    private ContractmsgService iContractmsgService;

    /**
     * 保存
     * @param msgform
     * @param model
     * @param redirectAttributes
     * @param request
     * @return
     */
    @RequestMapping(value = "save.shtml")
    @RequiresPermissions("contractmsg:add")
    public String save(Contractmsg msgform, Model model, RedirectAttributes redirectAttributes, HttpServletRequest request){
        ILoginUser user = ShiroUtils.getCurrentUser();
        try {
            iContractmsgService.save(msgform,user);
            Msg.success(redirectAttributes, "保存成功！",1);
        } catch (ServiceException e) {
            Msg.success(redirectAttributes, e.getMessage(),1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return S.redirect("/jj/contractmsg/list.shtml");
    }
}
