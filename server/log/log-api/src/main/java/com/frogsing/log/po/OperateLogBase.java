package com.frogsing.log.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "lg_operatelog")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class OperateLogBase  extends  BaseEntity{
	
	private   Integer ilevel=0; //级别 int
	private   String soperatekey; //操作记录主键 String
	private   String soperateremark; //操作备注 String
	private   String saddoperator; //操作人 String
	private   Date dadddate; //操作日期 Date
	   /**
		级别 int
	    OperatorLogLevel:
	    0:System:系统操作
1:Bussiness:业务操作 
		*/
		@Column(name="ilevel")
		public Integer getIlevel() {
			return  ilevel;//级别 int
		}
		/**
		级别 int
	    OperatorLogLevel:
	    0:System:系统操作
1:Bussiness:业务操作 
		*/
		public void setIlevel(Integer  ilevel) {
			this.ilevel =  ilevel;//级别 int
		}
	   /**
		操作记录主键 String
		*/
		@Column(name="soperatekey",length=32)
		public String getSoperatekey() {
			return  soperatekey;//操作记录主键 String
		}
		/**
		操作记录主键 String
		*/
		public void setSoperatekey(String  soperatekey) {
			this.soperatekey =  soperatekey;//操作记录主键 String
		}
	   /**
		操作备注 String
		*/
		@Column(name="soperateremark",length=2000)
		public String getSoperateremark() {
			return  soperateremark;//操作备注 String
		}
		/**
		操作备注 String
		*/
		public void setSoperateremark(String  soperateremark) {
			this.soperateremark =  soperateremark;//操作备注 String
		}
	   /**
		操作人 String
		*/
		@Column(name="saddoperator",length=50)
		public String getSaddoperator() {
			return  saddoperator;//操作人 String
		}
		/**
		操作人 String
		*/
		public void setSaddoperator(String  saddoperator) {
			this.saddoperator =  saddoperator;//操作人 String
		}
	   /**
		操作日期 Date
		*/
		@Column(name="dadddate")
		public Date getDadddate() {
			return  dadddate;//操作日期 Date
		}
		/**
		操作日期 Date
		*/
		public void setDadddate(Date  dadddate) {
			this.dadddate =  dadddate;//操作日期 Date
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
