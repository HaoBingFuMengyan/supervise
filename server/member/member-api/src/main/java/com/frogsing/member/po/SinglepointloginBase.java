package com.frogsing.member.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "hy_singlepointlogin")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class SinglepointloginBase  extends  BaseEntity{
	
	private   String skey; //登录秘钥 String
	private   String susername; //用户名 String
	private   Date dvalidtime; //有效截止日期 Date
	private   Date daddtime; //新增时间 Date
	   /**
		登录秘钥 String
		*/
		@Column(name="skey",length=300)
		public String getSkey() {
			return  skey;//登录秘钥 String
		}
		/**
		登录秘钥 String
		*/
		public void setSkey(String  skey) {
			this.skey =  skey;//登录秘钥 String
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
		有效截止日期 Date
		*/
		@Column(name="dvalidtime")
		public Date getDvalidtime() {
			return  dvalidtime;//有效截止日期 Date
		}
		/**
		有效截止日期 Date
		*/
		public void setDvalidtime(Date  dvalidtime) {
			this.dvalidtime =  dvalidtime;//有效截止日期 Date
		}
	   /**
		新增时间 Date
		*/
		@Column(name="daddtime")
		public Date getDaddtime() {
			return  daddtime;//新增时间 Date
		}
		/**
		新增时间 Date
		*/
		public void setDaddtime(Date  daddtime) {
			this.daddtime =  daddtime;//新增时间 Date
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
