package com.frogsing.admin.web.jj;

import com.alibaba.dubbo.config.annotation.Reference;
import com.frogsing.heart.data.BaseJJController;
import com.frogsing.heart.data.IDataService;
import com.frogsing.parameter.service.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)，
 *
 * 真正登录的POST请求由Filter完成,
 *
 * /dt/infoconfig/list.shtml
 *
 *
 * @frogsing van
 */
@Controller
@RequestMapping(value = "/jj")
public class JJController extends BaseJJController{

	@Autowired
	DataService dataService;
	@Override
	public IDataService getService() {
		return dataService;
	}



}
