package com.frogsing.message.po;

//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "cx_messagedetail")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class MessageDetailBase  extends  BaseEntity{
	
	private   String ssenderid; //发送人ID String
	private   Integer isendertype=0; //发送人类型 int
	private   String sreceiveid; //接收人ID String
	private   Integer ireceivetype=0; //接收人类型 int
	private   Integer bisread=0; //是否已读 int
	private   Date dsenddatetime; //发送时间 Date
	private   String stitle; //标题 String
	private   String scontext; //内容 String
	private   Integer icount=0; //阅读次数 int
	private   Integer bisdelete=0; //是否删除 int
	private   Integer bissendok=0; //是否已发送 int
	private   String smessageid; //MessageID String
	private   String sreplyid; //回复ID String
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
		是否已读 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisread")
		public Integer getBisread() {
			return  bisread;//是否已读 int
		}
		/**
		是否已读 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisread(Integer  bisread) {
			this.bisread =  bisread;//是否已读 int
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
	   /**
		标题 String
		*/
		@Column(name="stitle",length=300)
		public String getStitle() {
			return  stitle;//标题 String
		}
		/**
		标题 String
		*/
		public void setStitle(String  stitle) {
			this.stitle =  stitle;//标题 String
		}
	   /**
		内容 String
		*/
		@Column(name="scontext",length=4000)
		public String getScontext() {
			return  scontext;//内容 String
		}
		/**
		内容 String
		*/
		public void setScontext(String  scontext) {
			this.scontext =  scontext;//内容 String
		}
	   /**
		阅读次数 int
		*/
		@Column(name="icount")
		public Integer getIcount() {
			return  icount;//阅读次数 int
		}
		/**
		阅读次数 int
		*/
		public void setIcount(Integer  icount) {
			this.icount =  icount;//阅读次数 int
		}
	   /**
		是否删除 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisdelete")
		public Integer getBisdelete() {
			return  bisdelete;//是否删除 int
		}
		/**
		是否删除 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisdelete(Integer  bisdelete) {
			this.bisdelete =  bisdelete;//是否删除 int
		}
	   /**
		是否已发送 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bissendok")
		public Integer getBissendok() {
			return  bissendok;//是否已发送 int
		}
		/**
		是否已发送 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBissendok(Integer  bissendok) {
			this.bissendok =  bissendok;//是否已发送 int
		}
	   /**
		MessageID String
		*/
		@Column(name="smessageid",length=32)
		public String getSmessageid() {
			return  smessageid;//MessageID String
		}
		/**
		MessageID String
		*/
		public void setSmessageid(String  smessageid) {
			this.smessageid =  smessageid;//MessageID String
		}
	   /**
		回复ID String
		*/
		@Column(name="sreplyid",length=32)
		public String getSreplyid() {
			return  sreplyid;//回复ID String
		}
		/**
		回复ID String
		*/
		public void setSreplyid(String  sreplyid) {
			this.sreplyid =  sreplyid;//回复ID String
		}
	
	//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
