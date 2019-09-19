package com.frogsing.front.web.message;

import com.frogsing.heart.jpa.PageSort;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.persistence.XSpec;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.BaseAction;
import com.frogsing.heart.web.Msg;
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
import org.springframework.web.bind.annotation.RequestMethod;
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
    public String dailIndex(@RequestParam(value = "id") String id, Model model, HttpServletRequest request) {
        try {
            Authapply auth = queryService.findOne(Authapply.class,id);
            model.addAttribute("auth", auth);

            XSpec<Message> xSpec = MESSAGECol.cx_message.xspec();

            xSpec.fetch("messageDetails");
            xSpec.and(SearchFilter.eq(MESSAGECol.cx_message.sreceiveid,auth.getId()));

            xSpec.or(SearchFilter.eq(MESSAGECol.cx_message.isendertype, MESSAGE.OperatorOrAdmin.GSSPK.val()),
                    SearchFilter.eq(MESSAGECol.cx_message.isendertype, MESSAGE.OperatorOrAdmin.JDBSC.val()),
                    SearchFilter.eq(MESSAGECol.cx_message.isendertype, MESSAGE.OperatorOrAdmin.JRJGJ.val()));

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

    /**
     * 会员回复
     * @param scontent      内容
     * @param ssenderid     发起人id
     * @param sreceiveid    回复人id
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "send.json")
    @ResponseBody
    public Result sendMessage(@RequestParam(value = "scontent") String scontent,
                       @RequestParam(value = "ssenderid") String ssenderid,
                       @RequestParam(value = "sreceiveid") String sreceiveid,
                       Model model, HttpServletRequest request){

        try {
            ILoginUser user = ShiroUtils.getCurrentUser();

            if (B.Y(scontent))
                return Result.failure("发送内容不能为空");

            if (B.Y(ssenderid) || B.Y(sreceiveid))
                return Result.failure("系统警告，企业存在风险，请勿操作");


            this.messageService.sendTradeSiteMsg(ssenderid,sreceiveid,scontent,user);

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
