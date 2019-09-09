package com.frogsing.member.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "hy_payaccount")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class PayAccountBase  extends  BaseEntity{
	
	private   String smemberid; //会员ID String
	private   String sbank; //开户银行 String
	private   String sbankaccount; //银行账号 String
	private   String srecvname; //开户人姓名 String
	private   String srecvtel; //开户人电话 String
	private   String sadduserid; //添加人 String
	private   Date dadddate; //添加时间 Date
	private   String smodifyuserid; //最后修改人 String
	private   Date dmodifydate; //最后修改时间 Date
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
		开户人姓名 String
		*/
		@Column(name="srecvname",length=200)
		public String getSrecvname() {
			return  srecvname;//开户人姓名 String
		}
		/**
		开户人姓名 String
		*/
		public void setSrecvname(String  srecvname) {
			this.srecvname =  srecvname;//开户人姓名 String
		}
	   /**
		开户人电话 String
		*/
		@Column(name="srecvtel",length=200)
		public String getSrecvtel() {
			return  srecvtel;//开户人电话 String
		}
		/**
		开户人电话 String
		*/
		public void setSrecvtel(String  srecvtel) {
			this.srecvtel =  srecvtel;//开户人电话 String
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
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
