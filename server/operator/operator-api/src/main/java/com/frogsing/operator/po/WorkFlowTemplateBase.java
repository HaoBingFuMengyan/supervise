package com.frogsing.operator.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "wf_workflowtemplate")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class WorkFlowTemplateBase  extends  BaseEntity{
	
	private   String sno; //模板编号 String
	private   String sname; //模板名称 String
	private   String sdesc; //模板描述 String
	private   String sremark; //备注 String
	private   String saddoperator; //添加人 String
	private   Date dadddate; //添加日期 Date
	private   Date dmodifydate; //修改日期 Date
	private   String smodifyoperator; //修改人 String
	   /**
		模板编号 String
		*/
		@Column(name="sno",length=50)
		public String getSno() {
			return  sno;//模板编号 String
		}
		/**
		模板编号 String
		*/
		public void setSno(String  sno) {
			this.sno =  sno;//模板编号 String
		}
	   /**
		模板名称 String
		*/
		@Column(name="sname",length=100)
		public String getSname() {
			return  sname;//模板名称 String
		}
		/**
		模板名称 String
		*/
		public void setSname(String  sname) {
			this.sname =  sname;//模板名称 String
		}
	   /**
		模板描述 String
		*/
		@Column(name="sdesc",length=500)
		public String getSdesc() {
			return  sdesc;//模板描述 String
		}
		/**
		模板描述 String
		*/
		public void setSdesc(String  sdesc) {
			this.sdesc =  sdesc;//模板描述 String
		}
	   /**
		备注 String
		*/
		@Column(name="sremark",length=500)
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
