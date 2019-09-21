package com.frogsing.member.vo;

import com.google.common.collect.Maps;

import java.io.Serializable;
import java.util.Map;

/**
 * Created by haobingfu on 2019/9/21.
 */
public class RiskVo implements Serializable {

    private String sauthapplyid;
    private int irisklevel; //等级
    private int fscore;//评分
    private int idangernum;//预警数

    private int fjgscore;//评分
    private int fhxscore;//评分
    private int fglqyscore;//评分
    private int fzgscore;//评分
    private int fwbaqyscore;//评分

    private Map<String,RiskDetailVo> jgMap = Maps.newLinkedHashMap();
    private Map<String,RiskDetailVo> hxMap = Maps.newLinkedHashMap();
    private Map<String,RiskDetailVo> glqyMap = Maps.newLinkedHashMap();
    private Map<String,RiskDetailVo> zgMap = Maps.newLinkedHashMap();
    private Map<String,RiskDetailVo> wMap = Maps.newLinkedHashMap();


    public String getSauthapplyid() {
        return sauthapplyid;
    }

    public void setSauthapplyid(String sauthapplyid) {
        this.sauthapplyid = sauthapplyid;
    }

    public int getIrisklevel() {
        return irisklevel;
    }

    public void setIrisklevel(int irisklevel) {
        this.irisklevel = irisklevel;
    }

    public int getFscore() {
        return fscore;
    }

    public void setFscore(int fscore) {
        this.fscore = fscore;
    }

    public int getIdangernum() {
        return idangernum;
    }

    public void setIdangernum(int idangernum) {
        this.idangernum = idangernum;
    }

    public int getFjgscore() {
        return fjgscore;
    }

    public void setFjgscore(int fjgscore) {
        this.fjgscore = fjgscore;
    }

    public int getFhxscore() {
        return fhxscore;
    }

    public void setFhxscore(int fhxscore) {
        this.fhxscore = fhxscore;
    }

    public int getFglqyscore() {
        return fglqyscore;
    }

    public void setFglqyscore(int fglqyscore) {
        this.fglqyscore = fglqyscore;
    }

    public int getFzgscore() {
        return fzgscore;
    }

    public void setFzgscore(int fzgscore) {
        this.fzgscore = fzgscore;
    }

    public int getFwbaqyscore() {
        return fwbaqyscore;
    }

    public void setFwbaqyscore(int fwbaqyscore) {
        this.fwbaqyscore = fwbaqyscore;
    }

    public Map<String, RiskDetailVo> getJgMap() {
        return jgMap;
    }

    public void setJgMap(Map<String, RiskDetailVo> jgMap) {
        this.jgMap = jgMap;
    }

    public Map<String, RiskDetailVo> getHxMap() {
        return hxMap;
    }

    public void setHxMap(Map<String, RiskDetailVo> hxMap) {
        this.hxMap = hxMap;
    }

    public Map<String, RiskDetailVo> getGlqyMap() {
        return glqyMap;
    }

    public void setGlqyMap(Map<String, RiskDetailVo> glqyMap) {
        this.glqyMap = glqyMap;
    }

    public Map<String, RiskDetailVo> getZgMap() {
        return zgMap;
    }

    public void setZgMap(Map<String, RiskDetailVo> zgMap) {
        this.zgMap = zgMap;
    }

    public Map<String, RiskDetailVo> getwMap() {
        return wMap;
    }

    public void setwMap(Map<String, RiskDetailVo> wMap) {
        this.wMap = wMap;
    }
}
