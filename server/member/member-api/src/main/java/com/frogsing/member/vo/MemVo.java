package com.frogsing.member.vo;

import java.io.Serializable;

/**
 * Created by haobingfu on 2019/9/13.
 */
public class MemVo implements Serializable {

    private String scnname;//企业名称
    private int iauthapplysource;//入驻方式

    private String id;//authapply的id
    private Integer iregmoney;//注册资本
    private String slegalperson;//执行董事姓名
    private Integer ilegaltype;//执行董事证件类型
    private String slegalpersoncode;//执行董事证件号码
    private Integer bisjoblegal;//执行董事是否兼职

    private String smanagername;//公司经理姓名
    private Integer imanagertype;//公司经理证件类型
    private String smanagerno;//公司经理证件号码
    private Integer bisjobmanager;//公司经理是否兼职

    private Integer icorporatetype;//法定代表人

    private String[] sname;//自然人股东姓名
    private Integer[] icardtype;//证件类型
    private String[] scardno;//证件号码
    private double[] famount;//金额
    private Integer[] bisjob;//是否兼职

    //机构股东信息
    private String[] scompanyname;//股东姓名
    private Integer[] icompanycardtype;//证件类型
    private String[] scompanycardno;//证件号码
    private double[] fcompanyamount;//金额

    //控股人股东信息
    private String[] sconname;//股东姓名
    private Integer[] iconcardtype;//证件类型
    private String[] ssocialcreditno;//社会统一信用代码
    private Integer[] iconpanytype;//公司类型

    private Integer icorbiztype;//企业业务类型


    public String getScnname() {
        return scnname;
    }

    public void setScnname(String scnname) {
        this.scnname = scnname;
    }

    public int getIauthapplysource() {
        return iauthapplysource;
    }

    public void setIauthapplysource(int iauthapplysource) {
        this.iauthapplysource = iauthapplysource;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getIregmoney() {
        return iregmoney;
    }

    public void setIregmoney(Integer iregmoney) {
        this.iregmoney = iregmoney;
    }

    public String getSlegalperson() {
        return slegalperson;
    }

    public void setSlegalperson(String slegalperson) {
        this.slegalperson = slegalperson;
    }

    public Integer getIlegaltype() {
        return ilegaltype;
    }

    public void setIlegaltype(Integer ilegaltype) {
        this.ilegaltype = ilegaltype;
    }

    public String getSlegalpersoncode() {
        return slegalpersoncode;
    }

    public void setSlegalpersoncode(String slegalpersoncode) {
        this.slegalpersoncode = slegalpersoncode;
    }

    public Integer getBisjoblegal() {
        return bisjoblegal;
    }

    public void setBisjoblegal(Integer bisjoblegal) {
        this.bisjoblegal = bisjoblegal;
    }

    public String getSmanagername() {
        return smanagername;
    }

    public void setSmanagername(String smanagername) {
        this.smanagername = smanagername;
    }

    public Integer getImanagertype() {
        return imanagertype;
    }

    public void setImanagertype(Integer imanagertype) {
        this.imanagertype = imanagertype;
    }

    public String getSmanagerno() {
        return smanagerno;
    }

    public void setSmanagerno(String smanagerno) {
        this.smanagerno = smanagerno;
    }

    public Integer getBisjobmanager() {
        return bisjobmanager;
    }

    public void setBisjobmanager(Integer bisjobmanager) {
        this.bisjobmanager = bisjobmanager;
    }

    public Integer getIcorporatetype() {
        return icorporatetype;
    }

    public void setIcorporatetype(Integer icorporatetype) {
        this.icorporatetype = icorporatetype;
    }

    public String[] getSname() {
        return sname;
    }

    public void setSname(String[] sname) {
        this.sname = sname;
    }

    public Integer[] getIcardtype() {
        return icardtype;
    }

    public void setIcardtype(Integer[] icardtype) {
        this.icardtype = icardtype;
    }

    public String[] getScardno() {
        return scardno;
    }

    public void setScardno(String[] scardno) {
        this.scardno = scardno;
    }

    public double[] getFamount() {
        return famount;
    }

    public void setFamount(double[] famount) {
        this.famount = famount;
    }

    public Integer[] getBisjob() {
        return bisjob;
    }

    public void setBisjob(Integer[] bisjob) {
        this.bisjob = bisjob;
    }

    public String[] getScompanyname() {
        return scompanyname;
    }

    public void setScompanyname(String[] scompanyname) {
        this.scompanyname = scompanyname;
    }

    public Integer[] getIcompanycardtype() {
        return icompanycardtype;
    }

    public void setIcompanycardtype(Integer[] icompanycardtype) {
        this.icompanycardtype = icompanycardtype;
    }

    public String[] getScompanycardno() {
        return scompanycardno;
    }

    public void setScompanycardno(String[] scompanycardno) {
        this.scompanycardno = scompanycardno;
    }

    public double[] getFcompanyamount() {
        return fcompanyamount;
    }

    public void setFcompanyamount(double[] fcompanyamount) {
        this.fcompanyamount = fcompanyamount;
    }

    public String[] getSconname() {
        return sconname;
    }

    public void setSconname(String[] sconname) {
        this.sconname = sconname;
    }

    public Integer[] getIconcardtype() {
        return iconcardtype;
    }

    public void setIconcardtype(Integer[] iconcardtype) {
        this.iconcardtype = iconcardtype;
    }

    public String[] getSsocialcreditno() {
        return ssocialcreditno;
    }

    public void setSsocialcreditno(String[] ssocialcreditno) {
        this.ssocialcreditno = ssocialcreditno;
    }

    public Integer[] getIconpanytype() {
        return iconpanytype;
    }

    public void setIconpanytype(Integer[] iconpanytype) {
        this.iconpanytype = iconpanytype;
    }

    public Integer getIcorbiztype() {
        return icorbiztype;
    }

    public void setIcorbiztype(Integer icorbiztype) {
        this.icorbiztype = icorbiztype;
    }
}
