package com.frogsing.member.vo;

import java.io.Serializable;

/**
 * Created by haobingfu on 2019/9/22.
 */
public class AuthVo implements Serializable {

    private   String id;
    private   Double fjgscore; //机构自身评分 double
    private   Double fhxscore; //核心人员评分 double
    private   Double fglqyscore; //关联企业评分 double
    private   Double fzgjjscore; //在管基金评分 double
    private   Double fwbascore; //未备案企业 double
    private   Double fglrscore; //管理人合规性 double
    private   Double fjjyzscore; //基金运作情况 double
    private   Double fwarnnum;//预警数


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Double getFjgscore() {
        return fjgscore;
    }

    public void setFjgscore(Double fjgscore) {
        this.fjgscore = fjgscore;
    }

    public Double getFhxscore() {
        return fhxscore;
    }

    public void setFhxscore(Double fhxscore) {
        this.fhxscore = fhxscore;
    }

    public Double getFglqyscore() {
        return fglqyscore;
    }

    public void setFglqyscore(Double fglqyscore) {
        this.fglqyscore = fglqyscore;
    }

    public Double getFzgjjscore() {
        return fzgjjscore;
    }

    public void setFzgjjscore(Double fzgjjscore) {
        this.fzgjjscore = fzgjjscore;
    }

    public Double getFwbascore() {
        return fwbascore;
    }

    public void setFwbascore(Double fwbascore) {
        this.fwbascore = fwbascore;
    }

    public Double getFglrscore() {
        return fglrscore;
    }

    public void setFglrscore(Double fglrscore) {
        this.fglrscore = fglrscore;
    }

    public Double getFjjyzscore() {
        return fjjyzscore;
    }

    public void setFjjyzscore(Double fjjyzscore) {
        this.fjjyzscore = fjjyzscore;
    }

    public Double getFwarnnum() {
        return fwarnnum;
    }

    public void setFwarnnum(Double fwarnnum) {
        this.fwarnnum = fwarnnum;
    }
}
