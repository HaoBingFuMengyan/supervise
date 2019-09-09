package com.frogsing.parameter.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "cs_tradedate")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class TradeDateBase  extends  BaseEntity{
	
	private   Date ddate; //日期 Date
	private   Integer bistrade=0; //是否交易日 int
	private   Integer isitetype=0; //分站 int
	   /**
		日期 Date
		*/
		@Column(name="ddate")
		public Date getDdate() {
			return  ddate;//日期 Date
		}
		/**
		日期 Date
		*/
		public void setDdate(Date  ddate) {
			this.ddate =  ddate;//日期 Date
		}
	   /**
		是否交易日 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bistrade")
		public Integer getBistrade() {
			return  bistrade;//是否交易日 int
		}
		/**
		是否交易日 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBistrade(Integer  bistrade) {
			this.bistrade =  bistrade;//是否交易日 int
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
