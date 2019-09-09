package com.frogsing.log.po;

//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "lg_billcheck")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class BillCheckBase  extends  BaseEntity{
	
	private   String sbillid; //单据ID String
	private   String sbillno; //单据编号 String
	private   String soperatorid; //操作人ID String
	private   String soperator; //操作员名称 String
	private   String soperatormember; //操作会员名称 String
	private   Integer istatus=0; //状态 int
	private   String sremark; //备注 String
	private   Date daddtime; //操作时间 Date
	   /**
		单据ID String
		*/
		@Column(name="sbillid",length=32)
		public String getSbillid() {
			return  sbillid;//单据ID String
		}
		/**
		单据ID String
		*/
		public void setSbillid(String  sbillid) {
			this.sbillid =  sbillid;//单据ID String
		}
	   /**
		单据编号 String
		*/
		@Column(name="sbillno",length=50)
		public String getSbillno() {
			return  sbillno;//单据编号 String
		}
		/**
		单据编号 String
		*/
		public void setSbillno(String  sbillno) {
			this.sbillno =  sbillno;//单据编号 String
		}
	   /**
		操作人ID String
		*/
		@Column(name="soperatorid",length=32)
		public String getSoperatorid() {
			return  soperatorid;//操作人ID String
		}
		/**
		操作人ID String
		*/
		public void setSoperatorid(String  soperatorid) {
			this.soperatorid =  soperatorid;//操作人ID String
		}
	   /**
		操作员名称 String
		*/
		@Column(name="soperator",length=50)
		public String getSoperator() {
			return  soperator;//操作员名称 String
		}
		/**
		操作员名称 String
		*/
		public void setSoperator(String  soperator) {
			this.soperator =  soperator;//操作员名称 String
		}
	   /**
		操作会员名称 String
		*/
		@Column(name="soperatormember",length=100)
		public String getSoperatormember() {
			return  soperatormember;//操作会员名称 String
		}
		/**
		操作会员名称 String
		*/
		public void setSoperatormember(String  soperatormember) {
			this.soperatormember =  soperatormember;//操作会员名称 String
		}
	   /**
		状态 int
	    CheckStatus:
	    10:Pass:通过
20:Reject:拒绝 
		*/
		@Column(name="istatus")
		public Integer getIstatus() {
			return  istatus;//状态 int
		}
		/**
		状态 int
	    CheckStatus:
	    10:Pass:通过
20:Reject:拒绝 
		*/
		public void setIstatus(Integer  istatus) {
			this.istatus =  istatus;//状态 int
		}
	   /**
		备注 String
		*/
		@Column(name="sremark",length=1000)
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
		操作时间 Date
		*/
		@Column(name="daddtime")
		public Date getDaddtime() {
			return  daddtime;//操作时间 Date
		}
		/**
		操作时间 Date
		*/
		public void setDaddtime(Date  daddtime) {
			this.daddtime =  daddtime;//操作时间 Date
		}
	
	//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
