/** 
 * Filename IParameterService.java
 * Create on 2014-1-3
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.service;

import java.util.Date;
import java.util.List;

import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.heart.web.vo.BusinessParameterVo;

/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public interface IParameterService {

	List<BusinessParameterVo> getAllParameters(int type);
	String GetParaValueByParaType(String type);
	String GetParaValueByParaType(int type);
	String genarateSeqNo(String name);
	String continueSeqNo(String name);

	String getCommodityName(String goodsid);
	ILoginUser getuser(String username);
	String canUseVersion();
	void setCanUseVersion(String verion);
	String mydate_continue_seqno(String name, Date d);
}
