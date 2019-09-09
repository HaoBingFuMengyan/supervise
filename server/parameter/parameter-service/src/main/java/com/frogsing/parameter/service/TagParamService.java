package com.frogsing.parameter.service;

import java.util.Date;
import java.util.List;

import com.frogsing.parameter.dao.SystemParaDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.frogsing.heart.web.vo.BusinessParameterVo;
import com.frogsing.parameter.ITagParameterService;
import com.frogsing.parameter.dao.BusinessParameterDao;
import com.frogsing.parameter.dao.ParameterDao;
import com.frogsing.parameter.po.BusinessParameter;
import com.frogsing.parameter.utils.PARAMETER.BizParaType;
import com.google.common.collect.Lists;

/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
@Component
@Transactional(readOnly=true)
public class TagParamService implements ITagParameterService {

	@Autowired
	private BusinessParameterDao businessParameterDao;
	@Autowired
	private ParameterDao parameterDao;
	@Autowired
	private SystemParaDao systemParaDao;
	


//	public String getValue(String key,int type){
//		if(0 == type){
//			return parameterDao.getParaValue(Integer.valueOf(key));
//		}else if(1 == type){
//			BusinessParameter parameter=this.businessParameterDao.findBySparametername(key);
//			if(parameter == null)
//				return "";
//			return parameter.getSparametervalue();
//		}else
//			return "";
//	}





	@Override
	public List<BusinessParameterVo> getAllParameters(int type) {
		
		List<BusinessParameter> list=businessParameterDao.findByIparatypeOrderByIsortAsc(type);
		List<BusinessParameterVo> rs=Lists.newArrayListWithCapacity(list.size());

		for(BusinessParameter b:list){
			BusinessParameterVo vo=new BusinessParameterVo();
			vo.setIparatype(b.getIparatype());
			vo.setIsort(b.getIsort());
			vo.setSparametername(b.getSparametername());
			vo.setSparametervalue(b.getSparametervalue());
			rs.add(vo);
		}
		return  rs;
	
	}


	



	@Override
	public List<BusinessParameterVo> getFtpParameters() {
		return this.getAllParameters(BizParaType.FTPInfo.val());
	}



	@Override
	public String para(String name) {
		return systemParaDao.findByName(name);
	}


	@Override
	public String GetParaValueByParaType(String type) {
	
		return parameterDao.getParaValue(Integer.parseInt(type));

		
	}





	@Override
	public String GetParaValueByParaType(int type) {
		
		return parameterDao.getParaValue(type);
	}


/**
 * 必须有事务才能调用
 */
	@Override
	@Transactional(readOnly=false,propagation=Propagation.MANDATORY)
	public String continueSeqNo(String name) {
		return parameterDao.pd_GetSeqNo(name);
	}

	/**
	 * 生成一个序号,新的事务
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW)
	public String genarateSeqNo(String name) {
		return parameterDao.pd_GetSeqNo(name);
	}







	@Override
	public Date getServerTime() {
		return (Date)parameterDao.getFieldValue("select sysdate()");
	}

	@Override
	public Date dbtime() {
		return (Date)parameterDao.getFieldValue("select now()");
	}

	@Override
	public void setSystempara(String type, String value) {

		systemParaDao.updatePara(type,value);
	}

}
