package com.frogsing.member.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "hy_memberimage")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class MemberImageBase  extends  BaseEntity{
	
	private   String simageno; //图片编号 String
	private   String smemberid; //会员ID String
	private   String simagename; //图片名称 String
	private   Integer iimagetype=0; //类型 int
	private   String saddress; //图片地址 String
	private   String suserid; //上传人 String
	private   Date daddtime; //上传时间 Date
	   /**
		图片编号 String
		*/
		@Column(name="simageno",length=50)
		public String getSimageno() {
			return  simageno;//图片编号 String
		}
		/**
		图片编号 String
		*/
		public void setSimageno(String  simageno) {
			this.simageno =  simageno;//图片编号 String
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
		图片名称 String
		*/
		@Column(name="simagename",length=300)
		public String getSimagename() {
			return  simagename;//图片名称 String
		}
		/**
		图片名称 String
		*/
		public void setSimagename(String  simagename) {
			this.simagename =  simagename;//图片名称 String
		}
	   /**
		类型 int
	    ImageType:
	    0:BUSINESSNO:营业执照副本
1:ORGCODE:组织机构代码
2:TAXNO:税务登记证副本
3:LEGALPERSONCODE:法人身份证
4:STAMPER:预留印鉴
5:COMPANYIMAGE:公司图片
6:OPENS:开户许可证
7:AUTHBOOK:授权书
8:CARDUP:身份证正面
9:CARDDOWN:身份证反面
10:NewCard:新版营业执照副本
11:DriverUp:驾驶证正面
12:DriverDown:驾驶证反面
13:DrivingUp:行驶证正面
14:DrivingDown:行驶证反面 
		*/
		@Column(name="iimagetype")
		public Integer getIimagetype() {
			return  iimagetype;//类型 int
		}
		/**
		类型 int
	    ImageType:
	    0:BUSINESSNO:营业执照副本
1:ORGCODE:组织机构代码
2:TAXNO:税务登记证副本
3:LEGALPERSONCODE:法人身份证
4:STAMPER:预留印鉴
5:COMPANYIMAGE:公司图片
6:OPENS:开户许可证
7:AUTHBOOK:授权书
8:CARDUP:身份证正面
9:CARDDOWN:身份证反面
10:NewCard:新版营业执照副本
11:DriverUp:驾驶证正面
12:DriverDown:驾驶证反面
13:DrivingUp:行驶证正面
14:DrivingDown:行驶证反面 
		*/
		public void setIimagetype(Integer  iimagetype) {
			this.iimagetype =  iimagetype;//类型 int
		}
	   /**
		图片地址 String
		*/
		@Column(name="saddress",length=300)
		public String getSaddress() {
			return  saddress;//图片地址 String
		}
		/**
		图片地址 String
		*/
		public void setSaddress(String  saddress) {
			this.saddress =  saddress;//图片地址 String
		}
	   /**
		上传人 String
		*/
		@Column(name="suserid",length=32)
		public String getSuserid() {
			return  suserid;//上传人 String
		}
		/**
		上传人 String
		*/
		public void setSuserid(String  suserid) {
			this.suserid =  suserid;//上传人 String
		}
	   /**
		上传时间 Date
		*/
		@Column(name="daddtime")
		public Date getDaddtime() {
			return  daddtime;//上传时间 Date
		}
		/**
		上传时间 Date
		*/
		public void setDaddtime(Date  daddtime) {
			this.daddtime =  daddtime;//上传时间 Date
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
