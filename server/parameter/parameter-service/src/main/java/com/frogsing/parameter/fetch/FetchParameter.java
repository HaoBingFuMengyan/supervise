package com.frogsing.parameter.fetch;


import com.frogsing.heart.data.BaseFetch;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.DateUtils;
import com.frogsing.parameter.dao.ParameterDao;
import com.frogsing.parameter.po.Parameter;
import com.frogsing.parameter.utils.PARAMETERCol.cs_parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.frogsing.exception.ServiceException;

@Component
public class FetchParameter extends BaseFetch<Parameter>{
	
	@Autowired
	private ParameterDao parameterDao;

	@Override
	public void commonCheck(Parameter obj,com.frogsing.heart.web.login.ILoginUser u){
	
		if(0<parameterDao.count(cs_parameter.iparatype, obj.getIparatype(), obj.getId()))
			throw new ServiceException("参数已经存在!");
		if(B.Y(obj.getId())){//添加
			obj.setDadddate(DateUtils.getCurrentDateTime());
			obj.setSaddoperator(u.getLoginName());
		}
		else
		{
			obj.setDmodifydate(DateUtils.getCurrentDateTime());
			obj.setSmodifyoperator(u.getLoginName());
		}
		
	}
	
	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IParameterService#GetParaValueByParaType(int)
	 */
	public String GetParaValueByParaType(int i) {
		return parameterDao.getParaValue(i);
	}
	
	
}
