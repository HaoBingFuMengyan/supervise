/** 
 * Filename FtpConfig.java
 * Create on 2014-3-3
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.file.utils;

import java.util.List;

import com.frogsing.heart.web.vo.BusinessParameterVo;
import com.frogsing.parameter.utils.ParaUtils;

/**
 * Description: 
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class FtpConfig {

	public FtpConfig(){
	}
	/**
	 * 
	 * @param url
	 * @param name
	 * @param password
	 */
	public FtpConfig(String url,String name,String password){
		this.url = url;
		this.name = name;
		this.password = password;
	}
	
	public FtpConfig(String url,String name,String password,int port){
		this.url = url;
		this.name = name;
		this.password = password;
		this.port = port;
	}
	
	public static FtpConfig getConfig(){
		FtpConfig config=new FtpConfig();
		List<BusinessParameterVo> list = ParaUtils.ftpParam();
		for (int i = 0; i < list.size(); i++) {
			if (i == 0) {
				config.url = list.get(i).getSparametervalue();
			} else if (i == 1) {
				config.name = list.get(i).getSparametervalue();
			} else if (i == 2) {
				config.password = list.get(i).getSparametervalue();
			} else {
				config.port = Integer.valueOf(list.get(i).getSparametervalue());
			}
		}
		return config;
	}
	
	private String url;
	private String name;
	private String password;
	private int port = 21;
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getPort() {
		return port;
	}
	public void setPort(int port) {
		this.port = port;
	}
	
}
