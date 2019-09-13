package com.frogsing.member.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "hy_companyholder")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class CompanyHolderBase  extends  BaseEntity{
	
	private   String sname; //股东姓名 String
	private   Integer ilicensetype=0; //执照类型 int
	private   String smemberid; //会员ID String
	private   String sremark; //备注 String
	private   Integer isortno=0; //排序号 int
	private   String ssocialcreditno; //社会统一信用代码 String
	private   Double famount; //出资额 double
	private   Integer bisjob=0; //是否兼职 int
	   /**
		股东姓名 String
		*/
		@Column(name="sname",length=50)
		public String getSname() {
			return  sname;//股东姓名 String
		}
		/**
		股东姓名 String
		*/
		public void setSname(String  sname) {
			this.sname =  sname;//股东姓名 String
		}
	   /**
		执照类型 int
	    LicenseType:
	    0:YYZZ:营业执照 
		*/
		@Column(name="ilicensetype")
		public Integer getIlicensetype() {
			return  ilicensetype;//执照类型 int
		}
		/**
		执照类型 int
	    LicenseType:
	    0:YYZZ:营业执照 
		*/
		public void setIlicensetype(Integer  ilicensetype) {
			this.ilicensetype =  ilicensetype;//执照类型 int
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
		排序号 int
		*/
		@Column(name="isortno")
		public Integer getIsortno() {
			return  isortno;//排序号 int
		}
		/**
		排序号 int
		*/
		public void setIsortno(Integer  isortno) {
			this.isortno =  isortno;//排序号 int
		}
	   /**
		社会统一信用代码 String
		*/
		@Column(name="ssocialcreditno",length=100)
		public String getSsocialcreditno() {
			return  ssocialcreditno;//社会统一信用代码 String
		}
		/**
		社会统一信用代码 String
		*/
		public void setSsocialcreditno(String  ssocialcreditno) {
			this.ssocialcreditno =  ssocialcreditno;//社会统一信用代码 String
		}
	   /**
		出资额 double
		*/
		@Column(name="famount")
		public Double getFamount() {
			return  famount;//出资额 double
		}
		/**
		出资额 double
		*/
		public void setFamount(Double  famount) {
			this.famount =  famount;//出资额 double
		}
	   /**
		是否兼职 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisjob")
		public Integer getBisjob() {
			return  bisjob;//是否兼职 int
		}
		/**
		是否兼职 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisjob(Integer  bisjob) {
			this.bisjob =  bisjob;//是否兼职 int
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
