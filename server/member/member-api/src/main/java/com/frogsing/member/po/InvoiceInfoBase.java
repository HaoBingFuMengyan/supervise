package com.frogsing.member.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "hy_invoiceinfo")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class InvoiceInfoBase  extends  BaseEntity{
	
	private   String smemberid; //会员ID String
	private   Integer itype=0; //发票类型 int
	private   String scompanynmae; //公司抬头 String
	private   String staxno; //纳税人识别码 String
	private   String scountry; //国家 String
	private   String scity; //城市 String
	private   String sregion; //区县 String
	private   String sprovince; //省份 String
	private   Date dmodifydate; //最后修改时间 Date
	private   String saddress; //注册地址 String
	private   String stel; //注册电话 String
	private   String sbank; //开户银行 String
	private   String sbankaccount; //银行账号 String
	private   String srecvname; //收票人姓名 String
	private   String srecvtel; //收票人电话 String
	private   String srecvaddr; //收票地址 String
	private   String sadduserid; //添加人 String
	private   Date dadddate; //添加时间 Date
	private   String smodifyuserid; //最后修改人 String
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
		发票类型 int
	    InvoiceType:
	    10:Special:增值税专用发票
20:Common:增值税普通发票
 
		*/
		@Column(name="itype")
		public Integer getItype() {
			return  itype;//发票类型 int
		}
		/**
		发票类型 int
	    InvoiceType:
	    10:Special:增值税专用发票
20:Common:增值税普通发票
 
		*/
		public void setItype(Integer  itype) {
			this.itype =  itype;//发票类型 int
		}
	   /**
		公司抬头 String
		*/
		@Column(name="scompanynmae",length=200)
		public String getScompanynmae() {
			return  scompanynmae;//公司抬头 String
		}
		/**
		公司抬头 String
		*/
		public void setScompanynmae(String  scompanynmae) {
			this.scompanynmae =  scompanynmae;//公司抬头 String
		}
	   /**
		纳税人识别码 String
		*/
		@Column(name="staxno",length=200)
		public String getStaxno() {
			return  staxno;//纳税人识别码 String
		}
		/**
		纳税人识别码 String
		*/
		public void setStaxno(String  staxno) {
			this.staxno =  staxno;//纳税人识别码 String
		}
	   /**
		国家 String
		*/
		@Column(name="scountry",length=50)
		public String getScountry() {
			return  scountry;//国家 String
		}
		/**
		国家 String
		*/
		public void setScountry(String  scountry) {
			this.scountry =  scountry;//国家 String
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
		最后修改时间 Date
		*/
		@Column(name="dmodifydate")
		public Date getDmodifydate() {
			return  dmodifydate;//最后修改时间 Date
		}
		/**
		最后修改时间 Date
		*/
		public void setDmodifydate(Date  dmodifydate) {
			this.dmodifydate =  dmodifydate;//最后修改时间 Date
		}
	   /**
		注册地址 String
		*/
		@Column(name="saddress",length=200)
		public String getSaddress() {
			return  saddress;//注册地址 String
		}
		/**
		注册地址 String
		*/
		public void setSaddress(String  saddress) {
			this.saddress =  saddress;//注册地址 String
		}
	   /**
		注册电话 String
		*/
		@Column(name="stel",length=200)
		public String getStel() {
			return  stel;//注册电话 String
		}
		/**
		注册电话 String
		*/
		public void setStel(String  stel) {
			this.stel =  stel;//注册电话 String
		}
	   /**
		开户银行 String
		*/
		@Column(name="sbank",length=200)
		public String getSbank() {
			return  sbank;//开户银行 String
		}
		/**
		开户银行 String
		*/
		public void setSbank(String  sbank) {
			this.sbank =  sbank;//开户银行 String
		}
	   /**
		银行账号 String
		*/
		@Column(name="sbankaccount",length=200)
		public String getSbankaccount() {
			return  sbankaccount;//银行账号 String
		}
		/**
		银行账号 String
		*/
		public void setSbankaccount(String  sbankaccount) {
			this.sbankaccount =  sbankaccount;//银行账号 String
		}
	   /**
		收票人姓名 String
		*/
		@Column(name="srecvname",length=200)
		public String getSrecvname() {
			return  srecvname;//收票人姓名 String
		}
		/**
		收票人姓名 String
		*/
		public void setSrecvname(String  srecvname) {
			this.srecvname =  srecvname;//收票人姓名 String
		}
	   /**
		收票人电话 String
		*/
		@Column(name="srecvtel",length=200)
		public String getSrecvtel() {
			return  srecvtel;//收票人电话 String
		}
		/**
		收票人电话 String
		*/
		public void setSrecvtel(String  srecvtel) {
			this.srecvtel =  srecvtel;//收票人电话 String
		}
	   /**
		收票地址 String
		*/
		@Column(name="srecvaddr",length=200)
		public String getSrecvaddr() {
			return  srecvaddr;//收票地址 String
		}
		/**
		收票地址 String
		*/
		public void setSrecvaddr(String  srecvaddr) {
			this.srecvaddr =  srecvaddr;//收票地址 String
		}
	   /**
		添加人 String
		*/
		@Column(name="sadduserid",length=200)
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
		添加时间 Date
		*/
		@Column(name="dadddate")
		public Date getDadddate() {
			return  dadddate;//添加时间 Date
		}
		/**
		添加时间 Date
		*/
		public void setDadddate(Date  dadddate) {
			this.dadddate =  dadddate;//添加时间 Date
		}
	   /**
		最后修改人 String
		*/
		@Column(name="smodifyuserid",length=200)
		public String getSmodifyuserid() {
			return  smodifyuserid;//最后修改人 String
		}
		/**
		最后修改人 String
		*/
		public void setSmodifyuserid(String  smodifyuserid) {
			this.smodifyuserid =  smodifyuserid;//最后修改人 String
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
