package com.frogsing.member.vo;

import com.frogsing.member.po.AuthapplyRiskExce;
import com.google.common.collect.Lists;

import java.io.Serializable;
import java.util.List;

/**
 * Created by haobingfu on 2019/9/21.
 */
public class RiskDetailVo implements Serializable {

    private   Integer irisktype=0; //类型 int
    private   Double fscore; //整体评分 double
    private   String scnname; //企业名称 String
    private   String smanager; //管理人资格 String
    private   String sname; //姓名 String
    private   String scard; //身份 String
    private   String scardno; //证件号 String
    private   String stype; //在管类型 String
    private   String strustname; //托管方 String
    private   String dsetdate; //成立日期 Date
    private   Double fnum; //合伙人数量 double
    private   Double fnaturalnum; //自然合伙人数量 double
    private   String sinvest; //投资情况 String

    private List<AuthapplyRiskExce> sfList = Lists.newArrayList();
    private List<AuthapplyRiskExce> xzList = Lists.newArrayList();
    private List<AuthapplyRiskExce> jyList = Lists.newArrayList();
    private List<AuthapplyRiskExce> plList = Lists.newArrayList();
    private List<AuthapplyRiskExce> qsList = Lists.newArrayList();
    private List<AuthapplyRiskExce> kyList = Lists.newArrayList();

    public Integer getIrisktype() {
        return irisktype;
    }

    public void setIrisktype(Integer irisktype) {
        this.irisktype = irisktype;
    }

    public Double getFscore() {
        return fscore;
    }

    public void setFscore(Double fscore) {
        this.fscore = fscore;
    }

    public String getScnname() {
        return scnname;
    }

    public void setScnname(String scnname) {
        this.scnname = scnname;
    }

    public String getSmanager() {
        return smanager;
    }

    public void setSmanager(String smanager) {
        this.smanager = smanager;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getScard() {
        return scard;
    }

    public void setScard(String scard) {
        this.scard = scard;
    }

    public String getScardno() {
        return scardno;
    }

    public void setScardno(String scardno) {
        this.scardno = scardno;
    }

    public String getStype() {
        return stype;
    }

    public void setStype(String stype) {
        this.stype = stype;
    }

    public String getStrustname() {
        return strustname;
    }

    public void setStrustname(String strustname) {
        this.strustname = strustname;
    }

    public String getDsetdate() {
        return dsetdate;
    }

    public void setDsetdate(String dsetdate) {
        this.dsetdate = dsetdate;
    }

    public Double getFnum() {
        return fnum;
    }

    public void setFnum(Double fnum) {
        this.fnum = fnum;
    }

    public Double getFnaturalnum() {
        return fnaturalnum;
    }

    public void setFnaturalnum(Double fnaturalnum) {
        this.fnaturalnum = fnaturalnum;
    }

    public String getSinvest() {
        return sinvest;
    }

    public void setSinvest(String sinvest) {
        this.sinvest = sinvest;
    }

    public List<AuthapplyRiskExce> getSfList() {
        return sfList;
    }

    public void setSfList(List<AuthapplyRiskExce> sfList) {
        this.sfList = sfList;
    }

    public List<AuthapplyRiskExce> getXzList() {
        return xzList;
    }

    public void setXzList(List<AuthapplyRiskExce> xzList) {
        this.xzList = xzList;
    }

    public List<AuthapplyRiskExce> getJyList() {
        return jyList;
    }

    public void setJyList(List<AuthapplyRiskExce> jyList) {
        this.jyList = jyList;
    }

    public List<AuthapplyRiskExce> getPlList() {
        return plList;
    }

    public void setPlList(List<AuthapplyRiskExce> plList) {
        this.plList = plList;
    }

    public List<AuthapplyRiskExce> getQsList() {
        return qsList;
    }

    public void setQsList(List<AuthapplyRiskExce> qsList) {
        this.qsList = qsList;
    }

    public List<AuthapplyRiskExce> getKyList() {
        return kyList;
    }

    public void setKyList(List<AuthapplyRiskExce> kyList) {
        this.kyList = kyList;
    }
}
