package com.frogsing.heart.webservice;

import javax.xml.bind.annotation.XmlType;
import java.io.Serializable;

/**
 * WebService返回结果基类,定义所有返回码.
 * 
 * @author calvin
 */
@XmlType(name = "WSResult", namespace = WSConstants.NS)
public class WSResult implements Serializable  {

    private static final long serialVersionUID = 1L;



    // -- 返回代码定义 --//
	// 按项目的规则进行定义, 比如4xx代表客户端参数错误，5xx代表服务端业务错误等.
	public static final String SUCCESS = "0";
	public static final String PARAMETER_ERROR = "400";
	public static final String BUSINESS_ERROR = "300";

	public static final String SYSTEM_ERROR = "500";
	public static final String SYSTEM_ERROR_MESSAGE = "Runtime unknown internal error.";
	
	public WSResult() {
	}

	public WSResult(String code, String message) {
		this.message = message;
		this.code = code;
	}


	// -- WSResult基本属性 --//
	private String code = SUCCESS;
	private String message;

	/**
	 * 创建结果.
	 */
	public void buildResult(String resultCode, String resultMessage) {
		code = resultCode;
		message = resultMessage;
	}

	/**
	 * 创建默认异常结果.
	 */
	public void setDefaultError() {
		buildResult(SYSTEM_ERROR, SYSTEM_ERROR_MESSAGE);
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public void success(String... message){
		if (message.length == 0)
			buildResult(SUCCESS, "操作成功");
		else if (message.length == 1)
			buildResult(SUCCESS, message[0]);
	}
	
	public void PMError(String... message){
		if (message.length == 0)
			buildResult(WSResult.PARAMETER_ERROR, "参数错误");
		else if (message.length == 1)
			buildResult(WSResult.PARAMETER_ERROR, message[0]);
	}
	
	public void BSError(String... message){
		if (message.length == 0)
			buildResult(WSResult.BUSINESS_ERROR, "业务错误");
		else if (message.length == 1)
			buildResult(WSResult.BUSINESS_ERROR, message[0]);
	}
	
	public void SYSError(String... message){
		if (message.length == 0)
			buildResult(WSResult.SYSTEM_ERROR, WSResult.SYSTEM_ERROR_MESSAGE);
		else if (message.length == 1)
			buildResult(WSResult.SYSTEM_ERROR, message[0]);
	}
	
	public static <T extends WSResult> T SUCCESS(T result,String message) {
		result.buildResult(WSResult.SUCCESS, message);
		return result;
	}
	
	public static <T extends WSResult> T PMError(T result,String message) {
		result.buildResult(WSResult.PARAMETER_ERROR, message);
		return result;
	}

	public static  <T extends WSResult> T BSError(T result, String message) {
		result.buildResult(WSResult.BUSINESS_ERROR, message);
		return result;
	}

	public static  <T extends WSResult> T SYSError(T result) {
		result.setDefaultError();
		return result;
	}
	
	/**
	 * 
	 * @param msg
	 * @return
	 */
	public boolean isFail() {
		return !WSResult.SUCCESS.equals(this.code);
	}
	
	/**
	 * 
	 * @param msg
	 * @return
	 */
	public boolean isSuccess() {
		return WSResult.SUCCESS.equals(this.code);
	}
	
}
