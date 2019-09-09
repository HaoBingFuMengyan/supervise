package com.frogsing.project.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "xm_positiontransrecord")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class PositiontransrecordBase  extends  BaseEntity{
	
	private   String spositiontransid; //持仓ID String
	private   String scontent; //交易信息 String
	private   String saddoperator; //添加人 String
	private   Date dadddate; //添加日期 Date
	private   Date dmodifydate; //修改日期 Date
	private   String smodifyoperator; //修改人 String
	   /**
		持仓ID String
		*/
		@Column(name="spositiontransid",length=32)
		public String getSpositiontransid() {
			return  spositiontransid;//持仓ID String
		}
		/**
		持仓ID String
		*/
		public void setSpositiontransid(String  spositiontransid) {
			this.spositiontransid =  spositiontransid;//持仓ID String
		}
	   /**
		交易信息 String
		*/
		@Column(name="scontent",length=2000)
		public String getScontent() {
			return  scontent;//交易信息 String
		}
		/**
		交易信息 String
		*/
		public void setScontent(String  scontent) {
			this.scontent =  scontent;//交易信息 String
		}
	   /**
		添加人 String
		*/
		@Column(name="saddoperator",length=50)
		public String getSaddoperator() {
			return  saddoperator;//添加人 String
		}
		/**
		添加人 String
		*/
		public void setSaddoperator(String  saddoperator) {
			this.saddoperator =  saddoperator;//添加人 String
		}
	   /**
		添加日期 Date
		*/
		@Column(name="dadddate")
		public Date getDadddate() {
			return  dadddate;//添加日期 Date
		}
		/**
		添加日期 Date
		*/
		public void setDadddate(Date  dadddate) {
			this.dadddate =  dadddate;//添加日期 Date
		}
	   /**
		修改日期 Date
		*/
		@Column(name="dmodifydate")
		public Date getDmodifydate() {
			return  dmodifydate;//修改日期 Date
		}
		/**
		修改日期 Date
		*/
		public void setDmodifydate(Date  dmodifydate) {
			this.dmodifydate =  dmodifydate;//修改日期 Date
		}
	   /**
		修改人 String
		*/
		@Column(name="smodifyoperator",length=50)
		public String getSmodifyoperator() {
			return  smodifyoperator;//修改人 String
		}
		/**
		修改人 String
		*/
		public void setSmodifyoperator(String  smodifyoperator) {
			this.smodifyoperator =  smodifyoperator;//修改人 String
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
