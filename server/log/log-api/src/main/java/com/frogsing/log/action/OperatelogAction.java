package com.frogsing.log.action;

import com.frogsing.heart.web.IListAction;
import com.frogsing.log.po.OperateLog;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)，
 * 
 * 真正登录的POST请求由Filter完成,
 * 
 * @frogsing van
 */
@Controller
@RequestMapping(value = "operatelog")
public class OperatelogAction extends IListAction<OperateLog> {



}
