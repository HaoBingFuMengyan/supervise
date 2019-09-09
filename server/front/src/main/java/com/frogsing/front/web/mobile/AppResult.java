package com.frogsing.front.web.mobile;

import com.google.common.collect.Maps;

import java.util.Map;

/**
 * 自定义返回结果
 * @author XieEnlong
 * @date 2015/7/14.
 */
public class AppResult {

    private boolean success=true;

    /**
     * 返回码
     */
    private int code;

    /**
     * 返回结果描述
     */
    private String msg;

    /**
     * 返回内容
     */
    private Object data;


    public AppResult put(String key,Object obj){
        if(data == null || data instanceof String){
            data= Maps.newHashMap();
        }
        if(data instanceof Map){
            ((Map)data).put(key, obj);
        }
        return this;
    }

    public AppResult putAll(Map<String,Object> map){
        if(data == null || data instanceof String){
            data= Maps.newHashMap();
        }
        if(data instanceof Map){
            ((Map)data).putAll(map);
        }
        return this;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public Object getData() {
        return data;
    }

    public boolean isSuccess() {
        return success;
    }

    public AppResult(boolean success,int code, String message) {
        this.code = code;
        this.msg = message;
        this.success=success;
        this.data = "";
    }

    public AppResult(boolean success,int code, String message, Object content) {
        this.code = code;
        this.msg = message;
        this.success=success;
        this.data = content;
    }

    public AppResult(){
        super();
    }


    public AppResult(ResultStatus status) {
        this.code = status.getCode();
        this.msg = status.getMessage();
        if(status.getCode() != 0)
            this.success=false;
        this.data = "";
    }



    public AppResult(ResultStatus status, Object content) {
        this.code = status.getCode();
        this.msg = status.getMessage();
        if(status.getCode() != 0)
            this.success=false;
        this.data = content;
    }

    public static AppResult ok(Object content) {
        return new AppResult(ResultStatus.SUCCESS, content);
    }

    public static AppResult ok() {
        return new AppResult(ResultStatus.SUCCESS);
    }

    public static AppResult error(ResultStatus error) {
        return new AppResult(error);
    }



    /**
     * service 异常
     * @param message
     * @return
     */
    public static AppResult error(String message) {
        return new AppResult(false,ResultStatus.service_exception.getCode(),message,null);
    }

    public static AppResult error(String message,Object content) {
        return new AppResult(false,ResultStatus.service_exception.getCode(),message,content);
    }

    public static AppResult failure(String message) {
        return new AppResult(false,ResultStatus.service_exception.getCode(),message,null);
    }

    public static AppResult failure(String message,Object content) {
        return new AppResult(false,ResultStatus.service_exception.getCode(),message,content);
    }
}
