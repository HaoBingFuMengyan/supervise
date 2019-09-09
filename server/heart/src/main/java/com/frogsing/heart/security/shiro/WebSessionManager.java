package com.frogsing.heart.security.shiro;

import com.frogsing.heart.utils.B;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.Serializable;

/**
 * Description:
 * <p>
 * Created by wesson on 2018/10/16.
 **/
public class WebSessionManager extends DefaultWebSessionManager {

    public WebSessionManager(){
        super();
    }

    @Override
    protected Serializable getSessionId(ServletRequest request, ServletResponse response) {
        String token=WebUtils.toHttp(request).getHeader("token");
        if(B.N(token)){
            return token;
        }
        return super.getSessionId(request, response);
    }
}
