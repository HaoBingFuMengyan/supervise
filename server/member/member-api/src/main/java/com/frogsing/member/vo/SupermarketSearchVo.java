package com.frogsing.member.vo;


import java.io.Serializable;

public class SupermarketSearchVo implements Serializable{

    private String keywords;

    private String shostbrand;//主机厂商

    private String shostname;//主机名称

    private String shostmodel;//主机型号

    private String swarehousename; //仓库名称

    private String smembername;//供应商

    private String scommodityname; //物资名称

    private String sspec; //规格

    private String scode;//产品编号

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getShostbrand() {
        return shostbrand;
    }

    public void setShostbrand(String shostbrand) {
        this.shostbrand = shostbrand;
    }

    public String getShostname() {
        return shostname;
    }

    public void setShostname(String shostname) {
        this.shostname = shostname;
    }

    public String getShostmodel() {
        return shostmodel;
    }

    public void setShostmodel(String shostmodel) {
        this.shostmodel = shostmodel;
    }

    public String getSwarehousename() {
        return swarehousename;
    }

    public void setSwarehousename(String swarehousename) {
        this.swarehousename = swarehousename;
    }

    public String getSmembername() {
        return smembername;
    }

    public void setSmembername(String smembername) {
        this.smembername = smembername;
    }

    public String getScommodityname() {
        return scommodityname;
    }

    public void setScommodityname(String scommodityname) {
        this.scommodityname = scommodityname;
    }

    public String getSspec() {
        return sspec;
    }

    public void setSspec(String sspec) {
        this.sspec = sspec;
    }

    public String getScode() {
        return scode;
    }

    public void setScode(String scode) {
        this.scode = scode;
    }
}
