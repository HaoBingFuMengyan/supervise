package com.frogsing.heart.http;

import org.apache.commons.httpclient.NameValuePair;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/* *
 *类名：HttpRequest
 *功能：Http请求对象的封装
 *详细：封装Http请求
 *版本：3.3
 *日期：2011-08-17
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class HttpRequest {

	/** HTTP GET method */
	public static final String METHOD_GET = "GET";

	/** HTTP POST method */
	public static final String METHOD_POST = "POST";

	/**
	 * 待请求的url
	 */
	private String url = null;

	/**
	 * 默认的请求方式
	 */
	private String method = METHOD_POST;

	private int timeout = 0;

	private int connectionTimeout = 0;

	/**
	 * Post方式请求时组装好的参数值对
	 */
	private List<NameValuePair> parameters = new ArrayList<NameValuePair>();

	/**
	 * Get方式请求时对应的参数
	 */
	private String queryString = null;

	/**
	 * 默认的请求编码方式
	 */
	private String charset = "GBK";

	/**
	 * 请求发起方的ip地址
	 */
	private String clientIp;

	/**
	 * 请求返回的方式
	 */
	private HttpResultType resultType = HttpResultType.BYTES;

	public HttpRequest(HttpResultType resultType) {
		super();
		this.resultType = resultType;
	}

	/**
	 * @return Returns the clientIp.
	 */
	public String getClientIp() {
		return clientIp;
	}

	/**
	 * @param clientIp
	 *            The clientIp to set.
	 */
	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}

	public NameValuePair[] getParameters() {
		if (parameters == null && parameters.size() == 0)
			return null;
		return parameters.toArray(new NameValuePair[] {});
	}

	/**
	 * 添加数组参数
	 * 
	 * @param param
	 */
	public void addParameters(NameValuePair[] param) {
		if (param != null && param.length > 0)
			this.parameters.addAll(Arrays.asList(param));
	}

	/**
	 * 添加list参数
	 * 
	 * @param param
	 */
	public void addParameters(List<NameValuePair> param) {
		this.parameters = param;
	}

	/**
	 * 添加map参数
	 * 
	 * @param param
	 */
	public void addParameters(Map<String, String> param) {
		if (!param.isEmpty()) {
			for (Entry<String, String> entry : param.entrySet()) {
				this.parameters.add(new NameValuePair(entry.getKey(), entry
						.getValue()));
			}
		}
	}

	/**
	 * 添加单个参数
	 * 
	 * @param param
	 */
	public void addParameter(NameValuePair param) {
		this.parameters.add(param);
	}

	public String getQueryString() {
		return queryString;
	}

	public void setQueryString(String queryString) {
		this.queryString = queryString;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public int getConnectionTimeout() {
		return connectionTimeout;
	}

	public void setConnectionTimeout(int connectionTimeout) {
		this.connectionTimeout = connectionTimeout;
	}

	public int getTimeout() {
		return timeout;
	}

	public void setTimeout(int timeout) {
		this.timeout = timeout;
	}

	/**
	 * @return Returns the charset.
	 */
	public String getCharset() {
		return charset;
	}

	/**
	 * @param charset
	 *            The charset to set.
	 */
	public void setCharset(String charset) {
		this.charset = charset;
	}

	public HttpResultType getResultType() {
		return resultType;
	}

	public void setResultType(HttpResultType resultType) {
		this.resultType = resultType;
	}

}
