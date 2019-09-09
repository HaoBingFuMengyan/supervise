package com.frogsing.project.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "xm_quicklycommand")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class QuicklycommandBase  extends  BaseEntity{
	
	private   String sshorname; //指令简称 String
	private   String scontent; //指令内容 String
	private   Long ienable; //是否有效 long
	private   Long isort; //排序 long
	private   String sremark; //备注 String
	private   String saddoperator; //添加人 String
	private   Date dadddate; //添加日期 Date
	private   Date dmodifydate; //修改日期 Date
	private   String smodifyoperator; //修改人 String
	   /**
		指令简称 String
		*/
		@Column(name="sshorname",length=100)
		public String getSshorname() {
			return  sshorname;//指令简称 String
		}
		/**
		指令简称 String
		*/
		public void setSshorname(String  sshorname) {
			this.sshorname =  sshorname;//指令简称 String
		}
	   /**
		指令内容 String
		*/
		@Column(name="scontent",length=2000)
		public String getScontent() {
			return  scontent;//指令内容 String
		}
		/**
		指令内容 String
		*/
		public void setScontent(String  scontent) {
			this.scontent =  scontent;//指令内容 String
		}
	   /**
		是否有效 long
		*/
		@Column(name="ienable")
		public Long getIenable() {
			return  ienable;//是否有效 long
		}
		/**
		是否有效 long
		*/
		public void setIenable(Long  ienable) {
			this.ienable =  ienable;//是否有效 long
		}
	   /**
		排序 long
		*/
		@Column(name="isort")
		public Long getIsort() {
			return  isort;//排序 long
		}
		/**
		排序 long
		*/
		public void setIsort(Long  isort) {
			this.isort =  isort;//排序 long
		}
	   /**
		备注 String
		*/
		@Column(name="sremark",length=2000)
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
