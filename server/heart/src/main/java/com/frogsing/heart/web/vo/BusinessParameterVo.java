/** 
 * Filename ParameterVo.java
 * Create on 2014-1-3
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.web.vo;

import java.io.Serializable;

/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class BusinessParameterVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private   long isort; //排序号 long
	
	private   int iparatype; //参数类型 int
	
	private   String sparametername; //参数名称 String
	
	private   String sparametervalue; //参数值 String

	public long getIsort() {
		return isort;
	}

	public void setIsort(long isort) {
		this.isort = isort;
	}

	public int getIparatype() {
		return iparatype;
	}

	public void setIparatype(int iparatype) {
		this.iparatype = iparatype;
	}

	public String getSparametername() {
		return sparametername;
	}

	public void setSparametername(String sparametername) {
		this.sparametername = sparametername;
	}

	public String getSparametervalue() {
		return sparametervalue;
	}

	public void setSparametervalue(String sparametervalue) {
		this.sparametervalue = sparametervalue;
	}
	
	
	

}
