package com.frogsing.admin.web.hy;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.Layer;
import com.frogsing.heart.web.Msg;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.User;
import com.frogsing.member.service.UserService;
import com.frogsing.parameter.service.QueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.frogsing.exception.ServiceException;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by haobingfu on 2019/9/11.
 */
@Controller
@RequestMapping(value = "/hy/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private QueryService queryService;


    @RequestMapping(value = "save.shtml")
    public String userList(User user, Model model, RedirectAttributes rmodel, HttpServletRequest request){
        try {
            ILoginUser u = ShiroUtils.getCurrentUser();

            if (user == null) {
                Msg.success(model, "非法操作", 0);
                return Layer.close();
            }
            // 会员信息记录到会员表,交易员信息记录到交易员表,初始化系统信息
            if (B.Y(user.getSusername())) {
                Msg.success(model, "用户名不能为空", 0);
                return Layer.close();
            }
            if (B.Y(user.getSname())) {
                Msg.success(model, "真实姓名不能为空", 0);
                return Layer.close();
            }

            if (B.Y(user.getId())){//新增
                if (B.Y(user.getSpassword())) {
                    Msg.success(model, "请输入用户密码", 0);
                    return Layer.close();
                }
                if (user.getSpassword().length() < 6) {
                    Msg.success(model, "密码至少要6位", 0);
                    return Layer.close();
                }

                this.userService.newUser(user,u);
                Msg.success(model,"保存成功了",0);
                return Layer.close();
            }else{//修改
                this.userService.modifyUser(user,u);
                Msg.success(model,"修改成功了",0);
                return Layer.close();
            }

        }catch (ServiceException ex){
            ex.printStackTrace();
            return Layer.error(model,ex.getMessage());
        }catch (Exception e){
            e.printStackTrace();
            return Layer.error(model,"系统错误，请联系管理员");
        }
    }
}
