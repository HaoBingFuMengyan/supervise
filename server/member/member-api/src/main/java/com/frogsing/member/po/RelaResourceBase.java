package com.frogsing.member.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "hy_relaresource")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class RelaResourceBase  extends  BaseEntity{
	
	private   String smemberid; //会员ID String
	private   String smembershopid; //店铺ID String
	private   String sresourceid; //资源ID String
	private   String sproductid; //产品分类ID String
	private   String sresourcename; //资源名称 String
	private   String sname; //分类名称 String
	private   String scode; //编号 String
	private   String sadduserid; //添加人 String
	private   Date dadddate; //添加时间 Date
	private   String sremark; //备注 String
	private   Integer ispottype=0; //资源类型 int
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
		店铺ID String
		*/
		@Column(name="smembershopid",length=32)
		public String getSmembershopid() {
			return  smembershopid;//店铺ID String
		}
		/**
		店铺ID String
		*/
		public void setSmembershopid(String  smembershopid) {
			this.smembershopid =  smembershopid;//店铺ID String
		}
	   /**
		资源ID String
		*/
		@Column(name="sresourceid",length=32)
		public String getSresourceid() {
			return  sresourceid;//资源ID String
		}
		/**
		资源ID String
		*/
		public void setSresourceid(String  sresourceid) {
			this.sresourceid =  sresourceid;//资源ID String
		}
	   /**
		产品分类ID String
		*/
		@Column(name="sproductid",length=32)
		public String getSproductid() {
			return  sproductid;//产品分类ID String
		}
		/**
		产品分类ID String
		*/
		public void setSproductid(String  sproductid) {
			this.sproductid =  sproductid;//产品分类ID String
		}
	   /**
		资源名称 String
		*/
		@Column(name="sresourcename",length=50)
		public String getSresourcename() {
			return  sresourcename;//资源名称 String
		}
		/**
		资源名称 String
		*/
		public void setSresourcename(String  sresourcename) {
			this.sresourcename =  sresourcename;//资源名称 String
		}
	   /**
		分类名称 String
		*/
		@Column(name="sname",length=50)
		public String getSname() {
			return  sname;//分类名称 String
		}
		/**
		分类名称 String
		*/
		public void setSname(String  sname) {
			this.sname =  sname;//分类名称 String
		}
	   /**
		编号 String
		*/
		@Column(name="scode",length=50)
		public String getScode() {
			return  scode;//编号 String
		}
		/**
		编号 String
		*/
		public void setScode(String  scode) {
			this.scode =  scode;//编号 String
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
		备注 String
		*/
		@Column(name="sremark",length=500)
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
		资源类型 int
	    SpotType:
	    0:SPOT:现货
1:NOSPOT:非现货
 
		*/
		@Column(name="ispottype")
		public Integer getIspottype() {
			return  ispottype;//资源类型 int
		}
		/**
		资源类型 int
	    SpotType:
	    0:SPOT:现货
1:NOSPOT:非现货
 
		*/
		public void setIspottype(Integer  ispottype) {
			this.ispottype =  ispottype;//资源类型 int
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
