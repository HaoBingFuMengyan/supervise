package com.frogsing.front.web.mobile.vo;

import java.util.Date;

public class VWorkFlowList {
    private String id;
    private String sname;
    private String saddOperator;
    private Date daddDate;
    private int istatus;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSaddOperator() {
        return saddOperator;
    }

    public void setSaddOperator(String saddOperator) {
        this.saddOperator = saddOperator;
    }

    public Date getDaddDate() {
        return daddDate;
    }

    public void setDaddDate(Date daddDate) {
        this.daddDate = daddDate;
    }

    public int getIstatus() {
        return istatus;
    }

    public void setIstatus(int istatus) {
        this.istatus = istatus;
    }
}
