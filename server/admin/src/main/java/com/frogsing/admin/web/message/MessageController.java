package com.frogsing.admin.web.message;

import com.frogsing.heart.jpa.PageSort;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.persistence.XSpec;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.message.po.Message;
import com.frogsing.message.service.MessageService;
import com.frogsing.message.utils.MESSAGE;
import com.frogsing.message.utils.MESSAGECol;
import com.frogsing.operator.po.Operator;
import com.frogsing.parameter.service.QueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.frogsing.exception.ServiceException;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by haobingfu on 2019/9/19.
 */
@Controller
@RequestMapping(value = "/cx/message")
public class MessageController {


    @Autowired
    private QueryService queryService;

    @Autowired
    private MessageService messageService;

    /**
     * 监管问询聊天记录
     *
     * @param id
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "dail-list.shtml")
    public String dailList(@RequestParam(value = "id") String id,
                           @RequestParam(value = "type", defaultValue = "0") int type, Model model, HttpServletRequest request) {
        try {
            model.addAttribute("id", id);

            ILoginUser user = ShiroUtils.getCurrentUser();

            Operator operator = queryService.findOne(Operator.class, user.getId());
            model.addAttribute("operator", operator);

            if (type == 0){
                XSpec<Message> xSpec = MESSAGECol.cx_message.xspec();

                xSpec.fetch("messageDetails");
                xSpec.or(SearchFilter.eq(MESSAGECol.cx_message.isendertype, MESSAGE.OperatorOrAdmin.GSSPK.val()),
                        SearchFilter.eq(MESSAGECol.cx_message.isendertype, MESSAGE.OperatorOrAdmin.JDBSC.val()),
                        SearchFilter.eq(MESSAGECol.cx_message.isendertype, MESSAGE.OperatorOrAdmin.JRJGJ.val()));

                List<Message> messages = queryService.list(PageSort.Desc(MESSAGECol.cx_message.dsenddatetime),xSpec);
                model.addAttribute("data",messages);
            }
        } catch (ServiceException ex) {
            ex.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (type == 0)
            return "/member/authapply-dail-list";
        else
            return "/member/authapply-dail-message";
    }
}
