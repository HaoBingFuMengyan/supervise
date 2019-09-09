package com.frogsing.member.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "hy_memberloginlog")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class MemberLoginLogBase  extends  BaseEntity{
	
	private   String suserid; //交易员ID String
	private   String susername; //用户名 String
	private   String sip; //客户端IP String
	private   Date dlogintime; //登录时间 Date
	private   Date dlogouttime; //退出时间 Date
	   /**
		交易员ID String
		*/
		@Column(name="suserid",length=32)
		public String getSuserid() {
			return  suserid;//交易员ID String
		}
		/**
		交易员ID String
		*/
		public void setSuserid(String  suserid) {
			this.suserid =  suserid;//交易员ID String
		}
	   /**
		用户名 String
		*/
		@Column(name="susername",length=50)
		public String getSusername() {
			return  susername;//用户名 String
		}
		/**
		用户名 String
		*/
		public void setSusername(String  susername) {
			this.susername =  susername;//用户名 String
		}
	   /**
		客户端IP String
		*/
		@Column(name="sip",length=300)
		public String getSip() {
			return  sip;//客户端IP String
		}
		/**
		客户端IP String
		*/
		public void setSip(String  sip) {
			this.sip =  sip;//客户端IP String
		}
	   /**
		登录时间 Date
		*/
		@Column(name="dlogintime")
		public Date getDlogintime() {
			return  dlogintime;//登录时间 Date
		}
		/**
		登录时间 Date
		*/
		public void setDlogintime(Date  dlogintime) {
			this.dlogintime =  dlogintime;//登录时间 Date
		}
	   /**
		退出时间 Date
		*/
		@Column(name="dlogouttime")
		public Date getDlogouttime() {
			return  dlogouttime;//退出时间 Date
		}
		/**
		退出时间 Date
		*/
		public void setDlogouttime(Date  dlogouttime) {
			this.dlogouttime =  dlogouttime;//退出时间 Date
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
