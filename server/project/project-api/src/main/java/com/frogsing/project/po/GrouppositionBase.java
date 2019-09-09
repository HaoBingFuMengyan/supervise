package com.frogsing.project.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "xm_groupposition")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class GrouppositionBase  extends  BaseEntity{
	
	private   Integer igroupid=0; //群ID int
	private   String sposition; //持仓信息 String
	private   Date dmodifydate; //修改日期 Date
	private   String smodifyoperator; //修改人 String
	   /**
		群ID int
		*/
		@Column(name="igroupid")
		public Integer getIgroupid() {
			return  igroupid;//群ID int
		}
		/**
		群ID int
		*/
		public void setIgroupid(Integer  igroupid) {
			this.igroupid =  igroupid;//群ID int
		}
	   /**
		持仓信息 String
		*/
		@Column(name="sposition",length=100)
		public String getSposition() {
			return  sposition;//持仓信息 String
		}
		/**
		持仓信息 String
		*/
		public void setSposition(String  sposition) {
			this.sposition =  sposition;//持仓信息 String
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
