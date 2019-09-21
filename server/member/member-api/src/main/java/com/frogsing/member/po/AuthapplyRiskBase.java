package com.frogsing.member.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "hy_authapplyrisk")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class AuthapplyRiskBase  extends  BaseEntity{
	
	private   String smemberid; //会员ID String
	private   String sauthapplyid; //认证id String
	private   Integer irisklevel=0; //等级 int
	private   Double fscore; //整体评分 double
	private   Date ddate; //添加时间 Date
	private   String sadduserid; //添加人 String
	private   String saddusername; //添加人名称 String
	private   String smodifyid; //修改人 String
	private   String smodifyname; //修改人名称 String
	private   Date dmodifydate; //修改时间 Date
	private   String sremark; //备注 String
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
		等级 int
	    RiskLevel:
	    0:YX:优秀
1:LH:良好
2:XC:瑕疵
3:FX:风险
 
		*/
		@Column(name="irisklevel")
		public Integer getIrisklevel() {
			return  irisklevel;//等级 int
		}
		/**
		等级 int
	    RiskLevel:
	    0:YX:优秀
1:LH:良好
2:XC:瑕疵
3:FX:风险
 
		*/
		public void setIrisklevel(Integer  irisklevel) {
			this.irisklevel =  irisklevel;//等级 int
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
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
