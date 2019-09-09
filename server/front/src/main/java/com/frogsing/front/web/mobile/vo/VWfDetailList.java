package com.frogsing.front.web.mobile.vo;

import java.util.Date;

public class VWfDetailList {
    private int iseq;
    private int bIsActive;
    private int iStatus;
    private String sCheckOperator;
    private Date dModifyDate;
    private String sCheckInfo;

    public int getIseq() {
        return iseq;
    }

    public void setIseq(int iseq) {
        this.iseq = iseq;
    }

    public int getbIsActive() {
        return bIsActive;
    }

    public void setbIsActive(int bIsActive) {
        this.bIsActive = bIsActive;
    }

    public int getiStatus() {
        return iStatus;
    }

    public void setiStatus(int iStatus) {
        this.iStatus = iStatus;
    }

    public String getsCheckOperator() {
        return sCheckOperator;
    }

    public void setsCheckOperator(String sCheckOperator) {
        this.sCheckOperator = sCheckOperator;
    }

    public String getsCheckInfo() {
        return sCheckInfo;
    }

    public void setsCheckInfo(String sCheckInfo) {
        this.sCheckInfo = sCheckInfo;
    }

    public Date getdModifyDate() {
        return dModifyDate;
    }

    public void setdModifyDate(Date dModifyDate) {
        this.dModifyDate = dModifyDate;
    }
}
