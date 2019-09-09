package com.frogsing.parameter.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "cs_exchangecenter")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class ExchangeCenterBase  extends  BaseEntity{
	
	private   Integer bisautoctrl=0; //是否自动控制 int
	private   Date dtradedate; //交易日期 Date
	private   Integer istatus=0; //状态 int
	private   Integer isitetype=0; //分站 int
	   /**
		是否自动控制 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisautoctrl")
		public Integer getBisautoctrl() {
			return  bisautoctrl;//是否自动控制 int
		}
		/**
		是否自动控制 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisautoctrl(Integer  bisautoctrl) {
			this.bisautoctrl =  bisautoctrl;//是否自动控制 int
		}
	   /**
		交易日期 Date
		*/
		@Column(name="dtradedate")
		public Date getDtradedate() {
			return  dtradedate;//交易日期 Date
		}
		/**
		交易日期 Date
		*/
		public void setDtradedate(Date  dtradedate) {
			this.dtradedate =  dtradedate;//交易日期 Date
		}
	   /**
		状态 int
	    ExchangeStatus:
	    10:Open:开市
15:Pause:暂停
20:Close:闭市
30:Settle:结算
40:Over:关闭 
		*/
		@Column(name="istatus")
		public Integer getIstatus() {
			return  istatus;//状态 int
		}
		/**
		状态 int
	    ExchangeStatus:
	    10:Open:开市
15:Pause:暂停
20:Close:闭市
30:Settle:结算
40:Over:关闭 
		*/
		public void setIstatus(Integer  istatus) {
			this.istatus =  istatus;//状态 int
		}
	   /**
		分站 int
	    SiteType:
	    0:GC:有色
1:TKS:铁矿石
2:MT:煤炭 
		*/
		@Column(name="isitetype")
		public Integer getIsitetype() {
			return  isitetype;//分站 int
		}
		/**
		分站 int
	    SiteType:
	    0:GC:有色
1:TKS:铁矿石
2:MT:煤炭 
		*/
		public void setIsitetype(Integer  isitetype) {
			this.isitetype =  isitetype;//分站 int
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
