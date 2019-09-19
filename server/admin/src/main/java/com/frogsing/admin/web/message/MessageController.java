package com.frogsing.admin.web.message;

import com.frogsing.heart.jpa.PageSort;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.persistence.XSpec;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.Result;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.Authapply;
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
import org.springframework.web.bind.annotation.ResponseBody;

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
            Authapply auth = queryService.findOne(Authapply.class,id);
            model.addAttribute("auth", auth);

            ILoginUser user = ShiroUtils.getCurrentUser();

            Operator operator = queryService.findOne(Operator.class, user.getId());
            model.addAttribute("operator", operator);

            if (type == 0){
                XSpec<Message> xSpec = MESSAGECol.cx_message.xspec();

                xSpec.fetch("messageDetails");
                xSpec.or(SearchFilter.eq(MESSAGECol.cx_message.isendertype, MESSAGE.OperatorOrAdmin.GSSPK.val()),
                        SearchFilter.eq(MESSAGECol.cx_message.isendertype, MESSAGE.OperatorOrAdmin.JDBSC.val()),
                        SearchFilter.eq(MESSAGECol.cx_message.isendertype, MESSAGE.OperatorOrAdmin.JRJGJ.val()));

                xSpec.and(SearchFilter.eq(MESSAGECol.cx_message.sreceiveid,auth.getSmemberid()));

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

    /**
     * 街道办事处、工商审批科、金融监管局对企业发起监管问询
     * @param scontent
     * @param id
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "send.json")
    @ResponseBody
    public Result send(@RequestParam(value = "scontent") String scontent,
                       @RequestParam(value = "id") String id,Model model,HttpServletRequest request){

        try {
            ILoginUser user = ShiroUtils.getCurrentUser();

            Operator operator = queryService.findOne(Operator.class,user.getId());

            if (B.Y(scontent))
                return Result.failure("发送内容不能为空");

            if (operator == null)
                return Result.failure("请重新登录");

            if (B.Y(id))
                return Result.failure("系统警告，企业存在风险，请勿操作");

            Authapply authapply = queryService.findOne(Authapply.class,id);

            this.messageService.buildMessage(authapply,operator,scontent);

            return Result.success();
        }catch (ServiceException ex){
            ex.printStackTrace();
            return Result.failure(ex.getMessage());
        }catch (Exception ex){
            ex.printStackTrace();
            return Result.failure("系统错误，请联系管理员");
        }
    }
}
