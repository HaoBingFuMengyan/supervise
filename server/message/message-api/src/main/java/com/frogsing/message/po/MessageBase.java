package com.frogsing.message.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "cx_message")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class MessageBase  extends  BaseEntity{
	
	private   String ssenderid; //发送人ID String
	private   Integer isendertype=0; //发送人类型 int
	private   String ssendername; //发送人名称 String
	private   String sreceiveid; //接收人ID String
	private   Integer ireceivetype=0; //接收人类型 int
	private   String sreceivename; //接收人名称 String
	private   Date dsenddatetime; //发送时间 Date
	   /**
		发送人ID String
		*/
		@Column(name="ssenderid",length=32)
		public String getSsenderid() {
			return  ssenderid;//发送人ID String
		}
		/**
		发送人ID String
		*/
		public void setSsenderid(String  ssenderid) {
			this.ssenderid =  ssenderid;//发送人ID String
		}
	   /**
		发送人类型 int
	    OperatorOrAdmin:
	    0:JDBSC:街道办事处
1:GSSPK:工商审批科
2:JRJGJ:金融监管局
3:MEMBER:会员 
		*/
		@Column(name="isendertype")
		public Integer getIsendertype() {
			return  isendertype;//发送人类型 int
		}
		/**
		发送人类型 int
	    OperatorOrAdmin:
	    0:JDBSC:街道办事处
1:GSSPK:工商审批科
2:JRJGJ:金融监管局
3:MEMBER:会员 
		*/
		public void setIsendertype(Integer  isendertype) {
			this.isendertype =  isendertype;//发送人类型 int
		}
	   /**
		发送人名称 String
		*/
		@Column(name="ssendername",length=50)
		public String getSsendername() {
			return  ssendername;//发送人名称 String
		}
		/**
		发送人名称 String
		*/
		public void setSsendername(String  ssendername) {
			this.ssendername =  ssendername;//发送人名称 String
		}
	   /**
		接收人ID String
		*/
		@Column(name="sreceiveid",length=32)
		public String getSreceiveid() {
			return  sreceiveid;//接收人ID String
		}
		/**
		接收人ID String
		*/
		public void setSreceiveid(String  sreceiveid) {
			this.sreceiveid =  sreceiveid;//接收人ID String
		}
	   /**
		接收人类型 int
	    ReceiveType:
	    0:JDBSC:街道办事处
1:GSSPK:工商审批科
2:JRJGJ:金融监管局
3:MEMBER:会员 
		*/
		@Column(name="ireceivetype")
		public Integer getIreceivetype() {
			return  ireceivetype;//接收人类型 int
		}
		/**
		接收人类型 int
	    ReceiveType:
	    0:JDBSC:街道办事处
1:GSSPK:工商审批科
2:JRJGJ:金融监管局
3:MEMBER:会员 
		*/
		public void setIreceivetype(Integer  ireceivetype) {
			this.ireceivetype =  ireceivetype;//接收人类型 int
		}
	   /**
		接收人名称 String
		*/
		@Column(name="sreceivename",length=50)
		public String getSreceivename() {
			return  sreceivename;//接收人名称 String
		}
		/**
		接收人名称 String
		*/
		public void setSreceivename(String  sreceivename) {
			this.sreceivename =  sreceivename;//接收人名称 String
		}
	   /**
		发送时间 Date
		*/
		@Column(name="dsenddatetime")
		public Date getDsenddatetime() {
			return  dsenddatetime;//发送时间 Date
		}
		/**
		发送时间 Date
		*/
		public void setDsenddatetime(Date  dsenddatetime) {
			this.dsenddatetime =  dsenddatetime;//发送时间 Date
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
