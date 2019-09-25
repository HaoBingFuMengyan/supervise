package com.frogsing.member.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "hy_authapplyriskdetail")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class AuthapplyRiskDetailBase  extends  BaseEntity{
	
	private   String sriskid; //风险id String
	private   Integer irisktype=0; //类型 int
	private   Double fscore; //整体评分 double
	private   String scnname; //企业名称 String
	private   String smanager; //管理人资格 String
	private   String sname; //姓名 String
	private   String scard; //身份 String
	private   String scardno; //证件号 String
	private   String stype; //在管类型 String
	private   String strustname; //托管方 String
	private   Date dsetdate; //成立日期 Date
	private   Double fnum; //合伙人数量 double
	private   Double fnaturalnum; //自然合伙人数量 double
	private   String sinvest; //投资情况 String
	private   String ssfexce; //司法异常 String
	private   String sxzcfexce; //行政处罚 String
	private   String sjjinvice; //经营情况 String
	private   String sshensuexce; //涉诉情况 String
	private   String splexce; //披露异常 String
	private   String sqsexce; //清算异常 String
	private   String skyjiaoyi; //可疑交易 String
	private   String szjxcfexce; //中基协处罚情况 String
	private   Date ddate; //添加时间 Date
	private   String sadduserid; //添加人 String
	private   String saddusername; //添加人名称 String
	private   String smodifyid; //修改人 String
	private   String smodifyname; //修改人名称 String
	private   Date dmodifydate; //修改时间 Date
	private   String sremark; //备注 String
	private   String smemberid; //会员ID String
	private   String sauthapplyid; //认证id String
	private   Integer iwarnnum=0; //预警数 int
	   /**
		风险id String
		*/
		@Column(name="sriskid",length=32)
		public String getSriskid() {
			return  sriskid;//风险id String
		}
		/**
		风险id String
		*/
		public void setSriskid(String  sriskid) {
			this.sriskid =  sriskid;//风险id String
		}
	   /**
		类型 int
	    RiskType:
	    0:JGSELF:机构自身
1:HXRY:核心人员
2:GLQY:关联企业
3:ZGQY:在管企业
4:WBAHHQY:未备案的合伙企业
5:GLRHGX:管理人合规性
6:JJYZQK:基金运作情况
7:FXYJ:风险预警
 
		*/
		@Column(name="irisktype")
		public Integer getIrisktype() {
			return  irisktype;//类型 int
		}
		/**
		类型 int
	    RiskType:
	    0:JGSELF:机构自身
1:HXRY:核心人员
2:GLQY:关联企业
3:ZGQY:在管企业
4:WBAHHQY:未备案的合伙企业
5:GLRHGX:管理人合规性
6:JJYZQK:基金运作情况
7:FXYJ:风险预警
 
		*/
		public void setIrisktype(Integer  irisktype) {
			this.irisktype =  irisktype;//类型 int
		}
	   /**
		整体评分 double
		*/
		@Column(name="fscore")
		public Double getFscore() {
			return  fscore;//整体评分 double
		}
		/**
		整体评分 double
		*/
		public void setFscore(Double  fscore) {
			this.fscore =  fscore;//整体评分 double
		}
	   /**
		企业名称 String
		*/
		@Column(name="scnname",length=100)
		public String getScnname() {
			return  scnname;//企业名称 String
		}
		/**
		企业名称 String
		*/
		public void setScnname(String  scnname) {
			this.scnname =  scnname;//企业名称 String
		}
	   /**
		管理人资格 String
		*/
		@Column(name="smanager",length=50)
		public String getSmanager() {
			return  smanager;//管理人资格 String
		}
		/**
		管理人资格 String
		*/
		public void setSmanager(String  smanager) {
			this.smanager =  smanager;//管理人资格 String
		}
	   /**
		姓名 String
		*/
		@Column(name="sname",length=50)
		public String getSname() {
			return  sname;//姓名 String
		}
		/**
		姓名 String
		*/
		public void setSname(String  sname) {
			this.sname =  sname;//姓名 String
		}
	   /**
		身份 String
		*/
		@Column(name="scard",length=50)
		public String getScard() {
			return  scard;//身份 String
		}
		/**
		身份 String
		*/
		public void setScard(String  scard) {
			this.scard =  scard;//身份 String
		}
	   /**
		证件号 String
		*/
		@Column(name="scardno",length=50)
		public String getScardno() {
			return  scardno;//证件号 String
		}
		/**
		证件号 String
		*/
		public void setScardno(String  scardno) {
			this.scardno =  scardno;//证件号 String
		}
	   /**
		在管类型 String
		*/
		@Column(name="stype",length=50)
		public String getStype() {
			return  stype;//在管类型 String
		}
		/**
		在管类型 String
		*/
		public void setStype(String  stype) {
			this.stype =  stype;//在管类型 String
		}
	   /**
		托管方 String
		*/
		@Column(name="strustname",length=100)
		public String getStrustname() {
			return  strustname;//托管方 String
		}
		/**
		托管方 String
		*/
		public void setStrustname(String  strustname) {
			this.strustname =  strustname;//托管方 String
		}
	   /**
		成立日期 Date
		*/
		@Column(name="dsetdate")
		public Date getDsetdate() {
			return  dsetdate;//成立日期 Date
		}
		/**
		成立日期 Date
		*/
		public void setDsetdate(Date  dsetdate) {
			this.dsetdate =  dsetdate;//成立日期 Date
		}
	   /**
		合伙人数量 double
		*/
		@Column(name="fnum")
		public Double getFnum() {
			return  fnum;//合伙人数量 double
		}
		/**
		合伙人数量 double
		*/
		public void setFnum(Double  fnum) {
			this.fnum =  fnum;//合伙人数量 double
		}
	   /**
		自然合伙人数量 double
		*/
		@Column(name="fnaturalnum")
		public Double getFnaturalnum() {
			return  fnaturalnum;//自然合伙人数量 double
		}
		/**
		自然合伙人数量 double
		*/
		public void setFnaturalnum(Double  fnaturalnum) {
			this.fnaturalnum =  fnaturalnum;//自然合伙人数量 double
		}
	   /**
		投资情况 String
		*/
		@Column(name="sinvest",length=2000)
		public String getSinvest() {
			return  sinvest;//投资情况 String
		}
		/**
		投资情况 String
		*/
		public void setSinvest(String  sinvest) {
			this.sinvest =  sinvest;//投资情况 String
		}
	   /**
		司法异常 String
		*/
		@Column(name="ssfexce",length=50)
		public String getSsfexce() {
			return  ssfexce;//司法异常 String
		}
		/**
		司法异常 String
		*/
		public void setSsfexce(String  ssfexce) {
			this.ssfexce =  ssfexce;//司法异常 String
		}
	   /**
		行政处罚 String
		*/
		@Column(name="sxzcfexce",length=50)
		public String getSxzcfexce() {
			return  sxzcfexce;//行政处罚 String
		}
		/**
		行政处罚 String
		*/
		public void setSxzcfexce(String  sxzcfexce) {
			this.sxzcfexce =  sxzcfexce;//行政处罚 String
		}
	   /**
		经营情况 String
		*/
		@Column(name="sjjinvice",length=50)
		public String getSjjinvice() {
			return  sjjinvice;//经营情况 String
		}
		/**
		经营情况 String
		*/
		public void setSjjinvice(String  sjjinvice) {
			this.sjjinvice =  sjjinvice;//经营情况 String
		}
	   /**
		涉诉情况 String
		*/
		@Column(name="sshensuexce",length=50)
		public String getSshensuexce() {
			return  sshensuexce;//涉诉情况 String
		}
		/**
		涉诉情况 String
		*/
		public void setSshensuexce(String  sshensuexce) {
			this.sshensuexce =  sshensuexce;//涉诉情况 String
		}
	   /**
		披露异常 String
		*/
		@Column(name="splexce",length=50)
		public String getSplexce() {
			return  splexce;//披露异常 String
		}
		/**
		披露异常 String
		*/
		public void setSplexce(String  splexce) {
			this.splexce =  splexce;//披露异常 String
		}
	   /**
		清算异常 String
		*/
		@Column(name="sqsexce",length=50)
		public String getSqsexce() {
			return  sqsexce;//清算异常 String
		}
		/**
		清算异常 String
		*/
		public void setSqsexce(String  sqsexce) {
			this.sqsexce =  sqsexce;//清算异常 String
		}
	   /**
		可疑交易 String
		*/
		@Column(name="skyjiaoyi",length=50)
		public String getSkyjiaoyi() {
			return  skyjiaoyi;//可疑交易 String
		}
		/**
		可疑交易 String
		*/
		public void setSkyjiaoyi(String  skyjiaoyi) {
			this.skyjiaoyi =  skyjiaoyi;//可疑交易 String
		}
	   /**
		中基协处罚情况 String
		*/
		@Column(name="szjxcfexce",length=50)
		public String getSzjxcfexce() {
			return  szjxcfexce;//中基协处罚情况 String
		}
		/**
		中基协处罚情况 String
		*/
		public void setSzjxcfexce(String  szjxcfexce) {
			this.szjxcfexce =  szjxcfexce;//中基协处罚情况 String
		}
	   /**
		添加时间 Date
		*/
		@Column(name="ddate")
		public Date getDdate() {
			return  ddate;//添加时间 Date
		}
		/**
		添加时间 Date
		*/
		public void setDdate(Date  ddate) {
			this.ddate =  ddate;//添加时间 Date
		}
	   /**
		添加人 String
		*/
		@Column(name="sadduserid",length=32)
		public String getSadduserid() {
			return  sadduserid;//添加人 String
		}
		/**
		添加人 String
		*/
		public void setSadduserid(String  sadduserid) {
			this.sadduserid =  sadduserid;//添加人 String
		}
	   /**
		添加人名称 String
		*/
		@Column(name="saddusername",length=50)
		public String getSaddusername() {
			return  saddusername;//添加人名称 String
		}
		/**
		添加人名称 String
		*/
		public void setSaddusername(String  saddusername) {
			this.saddusername =  saddusername;//添加人名称 String
		}
	   /**
		修改人 String
		*/
		@Column(name="smodifyid",length=32)
		public String getSmodifyid() {
			return  smodifyid;//修改人 String
		}
		/**
		修改人 String
		*/
		public void setSmodifyid(String  smodifyid) {
			this.smodifyid =  smodifyid;//修改人 String
		}
	   /**
		修改人名称 String
		*/
		@Column(name="smodifyname",length=50)
		public String getSmodifyname() {
			return  smodifyname;//修改人名称 String
		}
		/**
		修改人名称 String
		*/
		public void setSmodifyname(String  smodifyname) {
			this.smodifyname =  smodifyname;//修改人名称 String
		}
	   /**
		修改时间 Date
		*/
		@Column(name="dmodifydate")
		public Date getDmodifydate() {
			return  dmodifydate;//修改时间 Date
		}
		/**
		修改时间 Date
		*/
		public void setDmodifydate(Date  dmodifydate) {
			this.dmodifydate =  dmodifydate;//修改时间 Date
		}
	   /**
		备注 String
		*/
		@Column(name="sremark",length=2000)
		public String getSremark() {
			return  sremark;//备注 String
		}
		/**
		备注 String
		*/
		public void setSremark(String  sremark) {
			this.sremark =  sremark;//备注 String
		}
	   /**
		会员ID String
		*/
		@Column(name="smemberid",length=32)
		public String getSmemberid() {
			return  smemberid;//会员ID String
		}
		/**
		会员ID String
		*/
		public void setSmemberid(String  smemberid) {
			this.smemberid =  smemberid;//会员ID String
		}
	   /**
		认证id String
		*/
		@Column(name="sauthapplyid",length=32)
		public String getSauthapplyid() {
			return  sauthapplyid;//认证id String
		}
		/**
		认证id String
		*/
		public void setSauthapplyid(String  sauthapplyid) {
			this.sauthapplyid =  sauthapplyid;//认证id String
		}
	   /**
		预警数 int
		*/
		@Column(name="iwarnnum")
		public Integer getIwarnnum() {
			return  iwarnnum;//预警数 int
		}
		/**
		预警数 int
		*/
		public void setIwarnnum(Integer  iwarnnum) {
			this.iwarnnum =  iwarnnum;//预警数 int
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
