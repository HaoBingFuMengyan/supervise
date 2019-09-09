package com.frogsing.log.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "lg_systemlog")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class SystemLogBase  extends  BaseEntity{
	
	private   String slogno; //日志编号 String
	private   Date slogtime; //日志时间 Date
	private   String smemberid; //会员企业 String
	private   String slogusername; //交易员名 String
	private   Integer ilogtype=0; //日志类型 int
	private   Integer iloglevel=0; //日志级别 int
	private   String sloginfo; //日志信息 String
	private   String surl; //操作地址 String
	private   String soperatename; //操作名 String
	private   String soperateip; //操作IP String
	   /**
		日志编号 String
		*/
		@Column(name="slogno",length=50)
		public String getSlogno() {
			return  slogno;//日志编号 String
		}
		/**
		日志编号 String
		*/
		public void setSlogno(String  slogno) {
			this.slogno =  slogno;//日志编号 String
		}
	   /**
		日志时间 Date
		*/
		@Column(name="slogtime")
		public Date getSlogtime() {
			return  slogtime;//日志时间 Date
		}
		/**
		日志时间 Date
		*/
		public void setSlogtime(Date  slogtime) {
			this.slogtime =  slogtime;//日志时间 Date
		}
	   /**
		会员企业 String
		*/
		@Column(name="smemberid",length=32)
		public String getSmemberid() {
			return  smemberid;//会员企业 String
		}
		/**
		会员企业 String
		*/
		public void setSmemberid(String  smemberid) {
			this.smemberid =  smemberid;//会员企业 String
		}
	   /**
		交易员名 String
		*/
		@Column(name="slogusername",length=50)
		public String getSlogusername() {
			return  slogusername;//交易员名 String
		}
		/**
		交易员名 String
		*/
		public void setSlogusername(String  slogusername) {
			this.slogusername =  slogusername;//交易员名 String
		}
	   /**
		日志类型 int
	    LG_LogType:
	    1:SYSTEM:系统日志
2:SECRITY:安全日志
3:BUSINESS:应用日志
4:OTHER:其它日志 
		*/
		@Column(name="ilogtype")
		public Integer getIlogtype() {
			return  ilogtype;//日志类型 int
		}
		/**
		日志类型 int
	    LG_LogType:
	    1:SYSTEM:系统日志
2:SECRITY:安全日志
3:BUSINESS:应用日志
4:OTHER:其它日志 
		*/
		public void setIlogtype(Integer  ilogtype) {
			this.ilogtype =  ilogtype;//日志类型 int
		}
	   /**
		日志级别 int
	    LG_LogLevel:
	    0:INFO:信息
1:WARNING:警告
2:ERROR:错误
3:CRUEL:严重
4:DEAD:瘫痪 
		*/
		@Column(name="iloglevel")
		public Integer getIloglevel() {
			return  iloglevel;//日志级别 int
		}
		/**
		日志级别 int
	    LG_LogLevel:
	    0:INFO:信息
1:WARNING:警告
2:ERROR:错误
3:CRUEL:严重
4:DEAD:瘫痪 
		*/
		public void setIloglevel(Integer  iloglevel) {
			this.iloglevel =  iloglevel;//日志级别 int
		}
	   /**
		日志信息 String
		*/
		@Column(name="sloginfo",length=2000)
		public String getSloginfo() {
			return  sloginfo;//日志信息 String
		}
		/**
		日志信息 String
		*/
		public void setSloginfo(String  sloginfo) {
			this.sloginfo =  sloginfo;//日志信息 String
		}
	   /**
		操作地址 String
		*/
		@Column(name="surl",length=300)
		public String getSurl() {
			return  surl;//操作地址 String
		}
		/**
		操作地址 String
		*/
		public void setSurl(String  surl) {
			this.surl =  surl;//操作地址 String
		}
	   /**
		操作名 String
		*/
		@Column(name="soperatename",length=100)
		public String getSoperatename() {
			return  soperatename;//操作名 String
		}
		/**
		操作名 String
		*/
		public void setSoperatename(String  soperatename) {
			this.soperatename =  soperatename;//操作名 String
		}
	   /**
		操作IP String
		*/
		@Column(name="soperateip",length=300)
		public String getSoperateip() {
			return  soperateip;//操作IP String
		}
		/**
		操作IP String
		*/
		public void setSoperateip(String  soperateip) {
			this.soperateip =  soperateip;//操作IP String
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
