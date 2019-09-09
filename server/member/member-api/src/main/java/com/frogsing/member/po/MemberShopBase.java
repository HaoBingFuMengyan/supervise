package com.frogsing.member.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "hy_membershop")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class MemberShopBase  extends  BaseEntity{
	
	private   String smemberid; //会员ID String
	private   String sshopname; //店铺名称 String
	private   String slogo; //店铺Logo String
	private   String sbannerurl; //banner String
	private   String sqq; //QQ String
	private   String swx; //微信 String
	private   String slinkmobile; //手机号 String
	private   String sdesc; //描述 String
	private   String slinkname; //联系人 String
	private   String sdomain; //域名 String
	private   Date dopendate; //开通时间 Date
	private   Date dapplydate; //申请时间 Date
	private   Integer istatus=0; //状态 int
	private   String scheckmark; //审核意见 String
	private   Integer iversion=0; //版本号 int
	private   String sbusiness; //主营 String
	private   String sregion; //区域 String
	private   String ssuccessexam; //成功案例 String
	private   String scompanydesc; //公司介绍 String
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
		店铺名称 String
		*/
		@Column(name="sshopname",length=100)
		public String getSshopname() {
			return  sshopname;//店铺名称 String
		}
		/**
		店铺名称 String
		*/
		public void setSshopname(String  sshopname) {
			this.sshopname =  sshopname;//店铺名称 String
		}
	   /**
		店铺Logo String
		*/
		@Column(name="slogo",length=300)
		public String getSlogo() {
			return  slogo;//店铺Logo String
		}
		/**
		店铺Logo String
		*/
		public void setSlogo(String  slogo) {
			this.slogo =  slogo;//店铺Logo String
		}
	   /**
		banner String
		*/
		@Column(name="sbannerurl",length=300)
		public String getSbannerurl() {
			return  sbannerurl;//banner String
		}
		/**
		banner String
		*/
		public void setSbannerurl(String  sbannerurl) {
			this.sbannerurl =  sbannerurl;//banner String
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
		微信 String
		*/
		@Column(name="swx",length=300)
		public String getSwx() {
			return  swx;//微信 String
		}
		/**
		微信 String
		*/
		public void setSwx(String  swx) {
			this.swx =  swx;//微信 String
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
		描述 String
		*/
		@Column(name="sdesc",length=2000)
		public String getSdesc() {
			return  sdesc;//描述 String
		}
		/**
		描述 String
		*/
		public void setSdesc(String  sdesc) {
			this.sdesc =  sdesc;//描述 String
		}
	   /**
		联系人 String
		*/
		@Column(name="slinkname",length=50)
		public String getSlinkname() {
			return  slinkname;//联系人 String
		}
		/**
		联系人 String
		*/
		public void setSlinkname(String  slinkname) {
			this.slinkname =  slinkname;//联系人 String
		}
	   /**
		域名 String
		*/
		@Column(name="sdomain",length=300)
		public String getSdomain() {
			return  sdomain;//域名 String
		}
		/**
		域名 String
		*/
		public void setSdomain(String  sdomain) {
			this.sdomain =  sdomain;//域名 String
		}
	   /**
		开通时间 Date
		*/
		@Column(name="dopendate")
		public Date getDopendate() {
			return  dopendate;//开通时间 Date
		}
		/**
		开通时间 Date
		*/
		public void setDopendate(Date  dopendate) {
			this.dopendate =  dopendate;//开通时间 Date
		}
	   /**
		申请时间 Date
		*/
		@Column(name="dapplydate")
		public Date getDapplydate() {
			return  dapplydate;//申请时间 Date
		}
		/**
		申请时间 Date
		*/
		public void setDapplydate(Date  dapplydate) {
			this.dapplydate =  dapplydate;//申请时间 Date
		}
	   /**
		状态 int
	    ShopStatus:
	    10:Apply:申请中
20:Checking:审核中
21:Refuse:审核拒绝
30:Open:已开通
90:Close:已关闭
 
		*/
		@Column(name="istatus")
		public Integer getIstatus() {
			return  istatus;//状态 int
		}
		/**
		状态 int
	    ShopStatus:
	    10:Apply:申请中
20:Checking:审核中
21:Refuse:审核拒绝
30:Open:已开通
90:Close:已关闭
 
		*/
		public void setIstatus(Integer  istatus) {
			this.istatus =  istatus;//状态 int
		}
	   /**
		审核意见 String
		*/
		@Column(name="scheckmark",length=2000)
		public String getScheckmark() {
			return  scheckmark;//审核意见 String
		}
		/**
		审核意见 String
		*/
		public void setScheckmark(String  scheckmark) {
			this.scheckmark =  scheckmark;//审核意见 String
		}
	   /**
		版本号 int
		*/
		@Column(name="iversion")
		public Integer getIversion() {
			return  iversion;//版本号 int
		}
		/**
		版本号 int
		*/
		public void setIversion(Integer  iversion) {
			this.iversion =  iversion;//版本号 int
		}
	   /**
		主营 String
		*/
		@Column(name="sbusiness",length=500)
		public String getSbusiness() {
			return  sbusiness;//主营 String
		}
		/**
		主营 String
		*/
		public void setSbusiness(String  sbusiness) {
			this.sbusiness =  sbusiness;//主营 String
		}
	   /**
		区域 String
		*/
		@Column(name="sregion",length=100)
		public String getSregion() {
			return  sregion;//区域 String
		}
		/**
		区域 String
		*/
		public void setSregion(String  sregion) {
			this.sregion =  sregion;//区域 String
		}
	   /**
		成功案例 String
		*/
		@Column(name="ssuccessexam",length=0)
		public String getSsuccessexam() {
			return  ssuccessexam;//成功案例 String
		}
		/**
		成功案例 String
		*/
		public void setSsuccessexam(String  ssuccessexam) {
			this.ssuccessexam =  ssuccessexam;//成功案例 String
		}
	   /**
		公司介绍 String
		*/
		@Column(name="scompanydesc",length=0)
		public String getScompanydesc() {
			return  scompanydesc;//公司介绍 String
		}
		/**
		公司介绍 String
		*/
		public void setScompanydesc(String  scompanydesc) {
			this.scompanydesc =  scompanydesc;//公司介绍 String
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
