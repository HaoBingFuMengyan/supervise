package com.frogsing.member.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "hy_feedback")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class FeedbackBase  extends  BaseEntity{
	
	private   String smemberid; //会员ID String
	private   String smembername; //会员名称 String
	private   String smobile; //手机号 String
	private   Date dadddate; //反馈时间 Date
	private   Date dhandledate; //处理时间 Date
	private   String sinfo; //反馈信息 String
	private   String shandleinfo; //处理意见 String
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
		会员名称 String
		*/
		@Column(name="smembername",length=100)
		public String getSmembername() {
			return  smembername;//会员名称 String
		}
		/**
		会员名称 String
		*/
		public void setSmembername(String  smembername) {
			this.smembername =  smembername;//会员名称 String
		}
	   /**
		手机号 String
		*/
		@Column(name="smobile",length=20)
		public String getSmobile() {
			return  smobile;//手机号 String
		}
		/**
		手机号 String
		*/
		public void setSmobile(String  smobile) {
			this.smobile =  smobile;//手机号 String
		}
	   /**
		反馈时间 Date
		*/
		@Column(name="dadddate")
		public Date getDadddate() {
			return  dadddate;//反馈时间 Date
		}
		/**
		反馈时间 Date
		*/
		public void setDadddate(Date  dadddate) {
			this.dadddate =  dadddate;//反馈时间 Date
		}
	   /**
		处理时间 Date
		*/
		@Column(name="dhandledate")
		public Date getDhandledate() {
			return  dhandledate;//处理时间 Date
		}
		/**
		处理时间 Date
		*/
		public void setDhandledate(Date  dhandledate) {
			this.dhandledate =  dhandledate;//处理时间 Date
		}
	   /**
		反馈信息 String
		*/
		@Column(name="sinfo",length=2000)
		public String getSinfo() {
			return  sinfo;//反馈信息 String
		}
		/**
		反馈信息 String
		*/
		public void setSinfo(String  sinfo) {
			this.sinfo =  sinfo;//反馈信息 String
		}
	   /**
		处理意见 String
		*/
		@Column(name="shandleinfo",length=2000)
		public String getShandleinfo() {
			return  shandleinfo;//处理意见 String
		}
		/**
		处理意见 String
		*/
		public void setShandleinfo(String  shandleinfo) {
			this.shandleinfo =  shandleinfo;//处理意见 String
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
