package com.frogsing.parameter.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "cs_hexchangestatectrl")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class HExchangeStateCtrlBase  extends  BaseEntity{
	
	private   Long itime; //i时间 long
	private   Integer ictrlcmd=0; //控制命令 int
	private   Integer isitetype=0; //分站 int
	   /**
		i时间 long
		*/
		@Column(name="itime")
		public Long getItime() {
			return  itime;//i时间 long
		}
		/**
		i时间 long
		*/
		public void setItime(Long  itime) {
			this.itime =  itime;//i时间 long
		}
	   /**
		控制命令 int
	    ExchangeStatus:
	    10:Open:开市
15:Pause:暂停
20:Close:闭市
30:Settle:结算
40:Over:关闭 
		*/
		@Column(name="ictrlcmd")
		public Integer getIctrlcmd() {
			return  ictrlcmd;//控制命令 int
		}
		/**
		控制命令 int
	    ExchangeStatus:
	    10:Open:开市
15:Pause:暂停
20:Close:闭市
30:Settle:结算
40:Over:关闭 
		*/
		public void setIctrlcmd(Integer  ictrlcmd) {
			this.ictrlcmd =  ictrlcmd;//控制命令 int
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
