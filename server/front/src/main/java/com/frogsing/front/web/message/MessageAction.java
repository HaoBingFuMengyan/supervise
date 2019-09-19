package com.frogsing.front.web.message;

import com.frogsing.heart.jpa.PageSort;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.persistence.XSpec;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.web.BaseAction;
import com.frogsing.heart.web.Msg;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.message.po.Message;
import com.frogsing.message.service.MessageService;
import com.frogsing.message.utils.MESSAGECol;
import com.frogsing.parameter.service.QueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.frogsing.exception.ServiceException;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by haobingfu on 2019/9/19.
 */
@Controller
@RequestMapping(value = "/cx/message")
public class MessageAction extends BaseAction{

    @Autowired
    private QueryService queryService;

    @Autowired
    private MessageService messageService;



    /**
     * 监管问询
     * @author haobingfu
     * @param model
     * @return
     */
    @RequestMapping(value = "dail-index.shtml",method = RequestMethod.GET)
    public String dailIndex(Model model, HttpServletRequest request) {
        try {

            ILoginUser user = ShiroUtils.getCurrentUser();

            XSpec<Message> xSpec = MESSAGECol.cx_message.xspec();

            xSpec.fetch("messageDetails");
            xSpec.and(SearchFilter.eq(MESSAGECol.cx_message.sreceiveid,user.getMemberId()));


            List<Message> messages = queryService.list(PageSort.Desc(MESSAGECol.cx_message.dsenddatetime),xSpec);

            model.addAttribute("data",messages);

        }catch (ServiceException ex){
            ex.printStackTrace();
            Msg.error(model,ex.getMessage());
        }catch (Exception e){
            e.printStackTrace();
            Msg.error(model,"系统错误，请联系管理员");
        }
        return "member/member-dail-index";
    }
}
