/** 
 * Filename IParameterService.java
 * Create on 2014-1-3
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.parameter;

import java.util.Date;
import java.util.List;

import com.frogsing.heart.web.vo.BusinessParameterVo;

/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public interface ITagParameterService {

	List<BusinessParameterVo> getAllParameters(int type);
	List<BusinessParameterVo> getFtpParameters();
	String GetParaValueByParaType(String type);
	String para(String name);
	String GetParaValueByParaType(int type);
	String genarateSeqNo(String name);
	String continueSeqNo(String name);
	Date getServerTime();
    Date dbtime();
	void setSystempara(String type,String value);
}
