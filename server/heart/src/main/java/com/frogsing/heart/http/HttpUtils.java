/**
 * Filename HttpUtils.java
 * Create on 2015年4月22日
 * Copyright 2015 Frogsing All Rights Reserved.
 */
package com.frogsing.heart.http;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Description:http工具类
 * 
 * @author <a href="mailto:zhanghaifeng@frogsing.com">chain </a>
 * @since version1.0
 */
public class HttpUtils {

	/**
	 * 获取客户端ip
	 * 
	 * @param request
	 * @return
	 */
	public  static String getRemortIP(HttpServletRequest request) {
		if (request.getHeader("x-forwarded-for") == null) {
			return request.getRemoteAddr();
		}
		return request.getHeader("x-forwarded-for");
	}
	
	 /**
     * 将request请求中的参数转换成Map数组对象
     * @param request
     * @param enc
     * @return
     */
    @SuppressWarnings("rawtypes")
	public static Map<String,String> buildParam(HttpServletRequest request,boolean enc){
		Map<String,String> params = new HashMap<String,String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			if(enc){
				try {
					valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			System.out.println(name+"="+valueStr);
			params.put(name, valueStr);
		}
		return params;
	}
    
    /** 
     * 把数组所有元素排序，并按照“参数=参数值”的模式用“&”字符拼接成字符串
     * @param params 需要排序并参与字符拼接的参数组
     * @return 拼接后字符串
     */
    public static String createLinkString(Map<String, String> params,boolean sort) {
        List<String> keys = new ArrayList<String>(params.keySet());
        if(sort)
        	Collections.sort(keys);
        String prestr = "";
        for (int i = 0; i < keys.size(); i++) {
            String key = keys.get(i);
            String value = params.get(key);

            if (i == keys.size() - 1) {//拼接时，不包括最后一个&字符
                prestr = prestr + key + "=" + value;
            } else {
                prestr = prestr + key + "=" + value + "&";
            }
        }
        return prestr;
    }
}
