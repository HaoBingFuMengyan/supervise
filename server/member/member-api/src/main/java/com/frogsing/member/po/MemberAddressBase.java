package com.frogsing.member.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "hy_memberaddress")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class MemberAddressBase  extends  BaseEntity{
	
	private   String smemberid; //会员ID String
	private   String sqq; //QQ String
	private   String semail; //Email String
	private   String slinkmobile; //手机号 String
	private   String slinkname; //收货人 String
	private   String sprovince; //省份 String
	private   String scity; //城市 String
	private   String sregion; //区县 String
	private   String saddress; //收货地址 String
	private   Integer bisdefault=0; //是否默认地址 int
	private   Date dadddate; //添加日期 Date
	private   String saddoperator; //添加人 String
	private   Date dmodifydate; //修改日期 Date
	private   String smodifyoperator; //修改人 String
	private   String scardup; //身份证正面 String
	private   String scarddown; //身份证反面 String
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
		QQ String
		*/
		@Column(name="sqq",length=30)
		public String getSqq() {
			return  sqq;//QQ String
		}
		/**
		QQ String
		*/
		public void setSqq(String  sqq) {
			this.sqq =  sqq;//QQ String
		}
	   /**
		Email String
		*/
		@Column(name="semail",length=100)
		public String getSemail() {
			return  semail;//Email String
		}
		/**
		Email String
		*/
		public void setSemail(String  semail) {
			this.semail =  semail;//Email String
		}
	   /**
		手机号 String
		*/
		@Column(name="slinkmobile",length=20)
		public String getSlinkmobile() {
			return  slinkmobile;//手机号 String
		}
		/**
		手机号 String
		*/
		public void setSlinkmobile(String  slinkmobile) {
			this.slinkmobile =  slinkmobile;//手机号 String
		}
	   /**
		收货人 String
		*/
		@Column(name="slinkname",length=50)
		public String getSlinkname() {
			return  slinkname;//收货人 String
		}
		/**
		收货人 String
		*/
		public void setSlinkname(String  slinkname) {
			this.slinkname =  slinkname;//收货人 String
		}
	   /**
		省份 String
		*/
		@Column(name="sprovince",length=50)
		public String getSprovince() {
			return  sprovince;//省份 String
		}
		/**
		省份 String
		*/
		public void setSprovince(String  sprovince) {
			this.sprovince =  sprovince;//省份 String
		}
	   /**
		城市 String
		*/
		@Column(name="scity",length=50)
		public String getScity() {
			return  scity;//城市 String
		}
		/**
		城市 String
		*/
		public void setScity(String  scity) {
			this.scity =  scity;//城市 String
		}
	   /**
		区县 String
		*/
		@Column(name="sregion",length=50)
		public String getSregion() {
			return  sregion;//区县 String
		}
		/**
		区县 String
		*/
		public void setSregion(String  sregion) {
			this.sregion =  sregion;//区县 String
		}
	   /**
		收货地址 String
		*/
		@Column(name="saddress",length=200)
		public String getSaddress() {
			return  saddress;//收货地址 String
		}
		/**
		收货地址 String
		*/
		public void setSaddress(String  saddress) {
			this.saddress =  saddress;//收货地址 String
		}
	   /**
		是否默认地址 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisdefault")
		public Integer getBisdefault() {
			return  bisdefault;//是否默认地址 int
		}
		/**
		是否默认地址 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisdefault(Integer  bisdefault) {
			this.bisdefault =  bisdefault;//是否默认地址 int
		}
	   /**
		添加日期 Date
		*/
		@Column(name="dadddate")
		public Date getDadddate() {
			return  dadddate;//添加日期 Date
		}
		/**
		添加日期 Date
		*/
		public void setDadddate(Date  dadddate) {
			this.dadddate =  dadddate;//添加日期 Date
		}
	   /**
		添加人 String
		*/
		@Column(name="saddoperator",length=50)
		public String getSaddoperator() {
			return  saddoperator;//添加人 String
		}
		/**
		添加人 String
		*/
		public void setSaddoperator(String  saddoperator) {
			this.saddoperator =  saddoperator;//添加人 String
		}
	   /**
		修改日期 Date
		*/
		@Column(name="dmodifydate")
		public Date getDmodifydate() {
			return  dmodifydate;//修改日期 Date
		}
		/**
		修改日期 Date
		*/
		public void setDmodifydate(Date  dmodifydate) {
			this.dmodifydate =  dmodifydate;//修改日期 Date
		}
	   /**
		修改人 String
		*/
		@Column(name="smodifyoperator",length=50)
		public String getSmodifyoperator() {
			return  smodifyoperator;//修改人 String
		}
		/**
		修改人 String
		*/
		public void setSmodifyoperator(String  smodifyoperator) {
			this.smodifyoperator =  smodifyoperator;//修改人 String
		}
	   /**
		身份证正面 String
		*/
		@Column(name="scardup",length=200)
		public String getScardup() {
			return  scardup;//身份证正面 String
		}
		/**
		身份证正面 String
		*/
		public void setScardup(String  scardup) {
			this.scardup =  scardup;//身份证正面 String
		}
	   /**
		身份证反面 String
		*/
		@Column(name="scarddown",length=200)
		public String getScarddown() {
			return  scarddown;//身份证反面 String
		}
		/**
		身份证反面 String
		*/
		public void setScarddown(String  scarddown) {
			this.scarddown =  scarddown;//身份证反面 String
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
