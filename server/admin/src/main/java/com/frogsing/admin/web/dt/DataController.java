package com.frogsing.admin.web.dt;

import com.frogsing.heart.data.BaseDataController;
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
@RequestMapping(value = "/dt")
public class DataController extends BaseDataController {

	@Autowired
	DataService dataService;
	@Override
	public IDataService getService() {
		return dataService;
	}



}
