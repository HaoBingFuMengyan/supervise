package com.frogsing.heart.http;

import com.frogsing.heart.json.JsonUtils;
import com.frogsing.heart.utils.B;
import org.apache.commons.httpclient.Header;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.Map;

/* *
 *类名：HttpResponse
 *功能：Http返回对象的封装
 *详细：封装Http返回信息
 *版本：3.3
 *日期：2011-08-17
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class HttpResponse {

    /**
     * 返回中的Header信息
     */
    private Header[] responseHeaders;

    /**
     * String类型的result
     */
    private String   stringResult;

    /**
     * btye类型的result
     */
    private byte[]   byteResult;

    public Header[] getResponseHeaders() {
        return responseHeaders;
    }

    public void setResponseHeaders(Header[] responseHeaders) {
        this.responseHeaders = responseHeaders;
    }

    public byte[] getByteResult() {
        if (byteResult != null) {
            return byteResult;
        }
        if (stringResult != null) {
            return stringResult.getBytes();
        }
        return null;
    }

    public void setByteResult(byte[] byteResult) {
        this.byteResult = byteResult;
    }

    public String getStringResult() throws UnsupportedEncodingException {
        if (stringResult != null) {
            return stringResult;
        }
        return null;
    }

    public void setStringResult(String stringResult) {
        this.stringResult = stringResult;
    }

    public Map<String,String> getMapResult() {
    	Map<String, String> result = new HashMap<String, String>();
    	 if (B.N(stringResult)) {
    		 String[] parameters = stringResult.split("&");
    		 for (int i = 0; i < parameters.length; i++) {
    			 String msg = parameters[i];
    			 int index = msg.indexOf('=');
    			 if (index > 0) {
    				 String name = msg.substring(0, index);
    				 String value = msg.substring(index + 1);
    				 result.put(name, value);
    			 }
    		 }
    	 }
		return result;
    }

    public <T> T getJSONObjectResult(Class<T> classObj){
        return JsonUtils.json2Object(stringResult, classObj);
    }

    public <Object> Object getJSONObjectResult(Type type){
        return JsonUtils.json2Object(stringResult, type);
    }
}
