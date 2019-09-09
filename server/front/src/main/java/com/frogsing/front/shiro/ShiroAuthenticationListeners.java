package com.frogsing.front.shiro;

import com.frogsing.heart.security.shiro.ShiroUsernamePasswordToken;
import com.frogsing.heart.utils.T;
import com.frogsing.member.IUserService;
import com.frogsing.member.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by fanyijie on 2017/9/22.
 */
public class ShiroAuthenticationListeners implements AuthenticationListener{

    @Autowired
    private UserService userService;
    @Override
    public void onSuccess(AuthenticationToken token, AuthenticationInfo info) {
       // token.getPrincipal();
        ShiroUsernamePasswordToken t=(ShiroUsernamePasswordToken)token;
        userService.updateLoginTime(t.getId(), T.now());
    }

    @Override
    public void onFailure(AuthenticationToken token, AuthenticationException ae) {

        if(ae instanceof IncorrectCredentialsException)
         userService.doLoginFail(token.getPrincipal().toString(),T.now());
    }

    @Override
    public void onLogout(PrincipalCollection principals) {

    }


}
