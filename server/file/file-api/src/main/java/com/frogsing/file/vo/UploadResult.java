package com.frogsing.file.vo;/**
 * Created by wesson on 2017/10/10.
 */

import com.frogsing.heart.json.JSONObject;

import javax.servlet.ServletResponse;

/**
 * Description:
 * <p>
 * Created by wesson on 2017/10/10.
 **/
public class UploadResult {

    private String state="SUCCESS";
    private String url;
    private String title;
    private String original;
    private String fileid;    //保存后的文件ID
    private boolean ispublic=true;  //是公开还是私有


    private UploadResult(String state,String url,String title,String original) {
        this.state=state;
        this.url=url;
        this.title=title;
        this.original=original;
    }
    public static UploadResult success(String url,String title,String original){
        return new UploadResult("SUCCESS",url,title,original);
    }
    public static UploadResult failure(String msg){
        return new UploadResult(msg,"","","");
    }

    public String  toJson(){
        return new JSONObject(this, 1).toString();
    }
    public void  toJson(ServletResponse response) {
        try{
            response.setContentType("text/html");
            response.getWriter().write( new JSONObject(this, 1).toString());
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getOriginal() {
        return original;
    }

    public void setOriginal(String original) {
        this.original = original;
    }

    public String getFileid() {
        return fileid;
    }

    public void setFileid(String fileid) {
        this.fileid = fileid;
    }

    public boolean isIspublic() {
        return ispublic;
    }

    public void setIspublic(boolean ispublic) {
        this.ispublic = ispublic;
    }
}
