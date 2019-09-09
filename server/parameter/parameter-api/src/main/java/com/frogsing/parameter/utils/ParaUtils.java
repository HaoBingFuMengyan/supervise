package com.frogsing.parameter.utils;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.spring.SpringContextHolder;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.DateUtils;
import com.frogsing.heart.utils.T;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.heart.web.vo.BusinessParameterVo;
import com.frogsing.parameter.ITagParameterService;
import com.frogsing.parameter.utils.PARAMETER.BizParaType;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import javax.frogsing.exception.ServiceException;
import java.util.Date;
import java.util.List;
import java.util.Map;

@SuppressWarnings("unchecked")
public class ParaUtils {

	private static ITagParameterService s;
	private static Object o=new Object();
	private static Map<String,Object> sysMap=Maps.newConcurrentMap();
	static{
		init();
	}
	private static void init(){
		if(s==null){
			synchronized (o) {
				if(s==null)
					s=SpringContextHolder.getBean(ITagParameterService.class);
				if(s==null)
					E.S("IParameterService的实现类找不到!");

			}

		}

	}
	
	public static String sys(String type) throws ServiceException{
		
		
		String key = ParaUtils.nowkey("sys_"+type);
		if(!sysMap.containsKey(key)){
			synchronized (o) {
				if(sysMap.containsKey(key))
					return sysMap.get(key).toString();
				String ss=s.GetParaValueByParaType(type);
				if(ss==null)
					E.S("参数未配置:"+type);
				sysMap.remove(ParaUtils.oldkey("sys_"+type));
				sysMap.put(key, ss);
			}
		}
		return sysMap.get(key).toString();
	}
	public static String sys(int type) throws ServiceException{
		
		
		String key = ParaUtils.nowkey("sys_"+String.valueOf(type));
		if(!sysMap.containsKey(key)){
			synchronized (o) {
				if(sysMap.containsKey(key))
					return sysMap.get(key).toString();
				String ss=s.GetParaValueByParaType(type);
				if(ss==null)
					E.S("参数未配置:"+type);
				sysMap.remove(ParaUtils.oldkey("sys_"+String.valueOf(type)));
				sysMap.put(key, ss);
			}
		}
		return sysMap.get(key).toString();
	}
	
	/**
	 * 根据类型查找系统参数，需要传入默认值，如果没有配置，则返回默认值
	 * @param type
	 * @param defaultVal
	 * @return
	 * @throws ServiceException
	 */
	public static String sys(int type,String defaultVal) throws ServiceException{
		
		
		String key = ParaUtils.nowkey("sys_"+String.valueOf(type));
		if(!sysMap.containsKey(key)){
			synchronized (o) {
				if(sysMap.containsKey(key))
					return sysMap.get(key).toString();
				String ss=s.GetParaValueByParaType(type);
				if(ss==null)
					return defaultVal;
				sysMap.remove(ParaUtils.oldkey("sys_"+String.valueOf(type)));
				sysMap.put(key, ss);
			}
		}
		return sysMap.get(key).toString();
	}
	public static List<String> biz(String type){
		BizParaType i = BizParaType.valueOf(type);
		if(i==null)
			return Lists.newArrayList();
		List<String> rs = Lists.newArrayList();
		List<BusinessParameterVo> list = biz(i.val());
		for(BusinessParameterVo vo :list){
			rs.add(vo.getSparametervalue());
		}
		return rs;

	}
	
	public static List<BusinessParameterVo> biz(int type) throws ServiceException{
		
				
		String key = ParaUtils.nowkey("biz_"+String.valueOf(type));
		if(!sysMap.containsKey(key)){
			synchronized (o) {
				if(sysMap.containsKey(key))
					return (List<BusinessParameterVo>)sysMap.get(key);
				List<BusinessParameterVo> list=s.getAllParameters(type);
				if(list==null)
					E.S("业务参数未配置:"+type);
				sysMap.remove(ParaUtils.oldkey("biz_"+String.valueOf(type)));
				sysMap.put(key, list);
			}
		}
		return (List<BusinessParameterVo>)sysMap.get(key);
	}
	
	public static String bizByValue(int type,String value) throws ServiceException{
		if(B.Y(value))
			return "";
		
				
		String key = ParaUtils.nowkey("biz_"+String.valueOf(type));
		if(!sysMap.containsKey(key)){
			synchronized (o) {
				if(!sysMap.containsKey(key)){
					List<BusinessParameterVo> list=s.getAllParameters(type);
					if(list==null)
						E.S("业务参数未配置:"+type);
					sysMap.remove(ParaUtils.oldkey("biz_"+String.valueOf(type)));
					sysMap.put(key, list);
				}
			}
		}
		for(BusinessParameterVo vo:(List<BusinessParameterVo>)sysMap.get(key)){
			if(value.equals(vo.getSparametervalue()))
				return vo.getSparametername();
		}
		return "";
	}
	
	public static List<BusinessParameterVo> ftpParam() throws ServiceException{
		
		
		String key = ParaUtils.nowkey("ftp_config");
		if(!sysMap.containsKey(key)){
			synchronized (o) {
				if(sysMap.containsKey(key))
					return (List<BusinessParameterVo>)sysMap.get(key);
				List<BusinessParameterVo> list=s.getFtpParameters();
				if(list==null)
					E.S("业务参数未配置:ftp_config");
				sysMap.remove(ParaUtils.oldkey("ftp_config"));
				sysMap.put(key, list);
			}
		}
		return (List<BusinessParameterVo>)sysMap.get(key);
	}

	
	public static String seqno(String name) throws ServiceException{
		
		String rs=s.genarateSeqNo(name);
		if(B.Y(rs))
			E.S(String.format("未配置%s的序号生成器",name));

		return rs;
	}
	
	public static Date getServerTime() {
		
		return s.getServerTime();
	}
	


	private static String nowkey(String key){
		return T.snow("yyyyMMddHHmmss")+"_"+key;
	}
	
	private static String oldkey(String key){
		return DateUtils.dateToString(DateUtils.addDays(T.now(), -1),"yyyyMMddHHmmss")+"_"+key;
	}

	/**
	 * 不要直接调用,通过zookeeper 结点变化事件触发
	 *
	 * node 需要清理的缓存结点
	 */
	public static void clearcache(){

		synchronized (o) {
			sysMap.clear();
		}
	}
	public static String continue_seqno(String name) throws ServiceException{

		String rs=s.continueSeqNo(name);
		return rs;
	}

	public static String canUseVersion() {
		return s.para("canuseversion");

	}
	public static String strPara(String key) {
		return s.para(key);

	}
	public static String systemname() {
		return s.para("systemname");

	}
	public static boolean weightHidden() {
		return "1".equals(s.para("weighthidden"));
	}

	public static ILoginUser getUser(String username) {

		return null;
	}


	public static void setSystemPara(String canuseversion, String version) {
		s.setSystempara(canuseversion,version);
	}
}
