package com.frogsing.heart.ext;

import com.frogsing.heart.json.JSONObject;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;


public class ExtResult {

    private boolean success;

    public String getMsg() {
        return msg;
    }

    public Object getObj() {
        return obj;
    }

    private String msg;
    private String code = "000000";
    private Object obj;

    public boolean getSuccess() {
        return success;
    }

    private ExtResult(boolean flag, String msg, Object obj) {
        this.success = flag;
        this.msg = msg;
        this.obj = obj;
    }

    public static ExtResult success() {
        return new ExtResult(true, null, null);
    }

    public static ExtResult failure() {
        return new ExtResult(false, null, null);
    }

    public static ExtResult success(String msg) {
        return new ExtResult(true, msg, null);
    }

    public static ExtResult failure(String msg) {
        return new ExtResult(false, msg, null);
    }

    public static ExtResult code(String code,String msg ,Object ...obj) {
        ExtResult rs = new ExtResult(false, msg, obj.length>0?obj[0]:null);
        rs.code=code;
        return rs;
    }

    public static ExtResult failure(String msg, Object obj) {
        return new ExtResult(false, msg, obj);
    }

    public static ExtResult success(String msg, Object obj) {
        return new ExtResult(true, msg, obj);
    }

    public String toJson() {
        return new JSONObject(this, 1).toString();
    }

    public String toJson(int level) {
        return new JSONObject(this, 1).toString();
    }

    public void toJson(ServletResponse response) {
        try {
            response.setContentType("text/html");
            response.getWriter().write(new JSONObject(this, 1).toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void toJson(ServletResponse response, int level) {
        try {
            response.setContentType("text/html");
            response.getWriter().write(new JSONObject(this, level).toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //上传文件的返回
    public static void renderHtml(final String html, HttpServletResponse response, final String... headers) {
        Struts2Utils.renderHtml(html, response, headers);
    }

    public String getCode() {
        return code;
    }

}
