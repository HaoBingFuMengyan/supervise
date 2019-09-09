package com.frogsing.operator.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "wf_workflow")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class WorkFlowBase  extends  BaseEntity{
	
	private   String sno; //流程编号 String
	private   Integer ibiztype=0; //业务类型 int
	private   String sbizid; //业务Id String
	private   String sbizno; //业务单据号 String
	private   String sname; //流程名称 String
	private   String sdesc; //流程描述 String
	private   Integer bisauth=0; //是否生效 int
	private   Integer istatus=0; //状态 int
	private   String saddoperator; //编制人员 String
	private   Date dadddate; //编制日期 Date
	private   String scheckoperator; //审核人员 String
	private   Date dmodifydate; //审核日期 Date
	private   String sremark; //备注 String
	   /**
		流程编号 String
		*/
		@Column(name="sno",length=50)
		public String getSno() {
			return  sno;//流程编号 String
		}
		/**
		流程编号 String
		*/
		public void setSno(String  sno) {
			this.sno =  sno;//流程编号 String
		}
	   /**
		业务类型 int
	    WfBizType:
	    0:PROXY:代理融资
1:CDZY:仓单融资
2:FreeIndenture:解押审核
3:GoodsOut:出库审核 
		*/
		@Column(name="ibiztype")
		public Integer getIbiztype() {
			return  ibiztype;//业务类型 int
		}
		/**
		业务类型 int
	    WfBizType:
	    0:PROXY:代理融资
1:CDZY:仓单融资
2:FreeIndenture:解押审核
3:GoodsOut:出库审核 
		*/
		public void setIbiztype(Integer  ibiztype) {
			this.ibiztype =  ibiztype;//业务类型 int
		}
	   /**
		业务Id String
		*/
		@Column(name="sbizid",length=32)
		public String getSbizid() {
			return  sbizid;//业务Id String
		}
		/**
		业务Id String
		*/
		public void setSbizid(String  sbizid) {
			this.sbizid =  sbizid;//业务Id String
		}
	   /**
		业务单据号 String
		*/
		@Column(name="sbizno",length=50)
		public String getSbizno() {
			return  sbizno;//业务单据号 String
		}
		/**
		业务单据号 String
		*/
		public void setSbizno(String  sbizno) {
			this.sbizno =  sbizno;//业务单据号 String
		}
	   /**
		流程名称 String
		*/
		@Column(name="sname",length=100)
		public String getSname() {
			return  sname;//流程名称 String
		}
		/**
		流程名称 String
		*/
		public void setSname(String  sname) {
			this.sname =  sname;//流程名称 String
		}
	   /**
		流程描述 String
		*/
		@Column(name="sdesc",length=2000)
		public String getSdesc() {
			return  sdesc;//流程描述 String
		}
		/**
		流程描述 String
		*/
		public void setSdesc(String  sdesc) {
			this.sdesc =  sdesc;//流程描述 String
		}
	   /**
		是否生效 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisauth")
		public Integer getBisauth() {
			return  bisauth;//是否生效 int
		}
		/**
		是否生效 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisauth(Integer  bisauth) {
			this.bisauth =  bisauth;//是否生效 int
		}
	   /**
		状态 int
	    WfStatus:
	    0:Ready:未开始
1:Process:执行中
2:Ok:审核通过
3:No:不通过 
		*/
		@Column(name="istatus")
		public Integer getIstatus() {
			return  istatus;//状态 int
		}
		/**
		状态 int
	    WfStatus:
	    0:Ready:未开始
1:Process:执行中
2:Ok:审核通过
3:No:不通过 
		*/
		public void setIstatus(Integer  istatus) {
			this.istatus =  istatus;//状态 int
		}
	   /**
		编制人员 String
		*/
		@Column(name="saddoperator",length=50)
		public String getSaddoperator() {
			return  saddoperator;//编制人员 String
		}
		/**
		编制人员 String
		*/
		public void setSaddoperator(String  saddoperator) {
			this.saddoperator =  saddoperator;//编制人员 String
		}
	   /**
		编制日期 Date
		*/
		@Column(name="dadddate")
		public Date getDadddate() {
			return  dadddate;//编制日期 Date
		}
		/**
		编制日期 Date
		*/
		public void setDadddate(Date  dadddate) {
			this.dadddate =  dadddate;//编制日期 Date
		}
	   /**
		审核人员 String
		*/
		@Column(name="scheckoperator",length=50)
		public String getScheckoperator() {
			return  scheckoperator;//审核人员 String
		}
		/**
		审核人员 String
		*/
		public void setScheckoperator(String  scheckoperator) {
			this.scheckoperator =  scheckoperator;//审核人员 String
		}
	   /**
		审核日期 Date
		*/
		@Column(name="dmodifydate")
		public Date getDmodifydate() {
			return  dmodifydate;//审核日期 Date
		}
		/**
		审核日期 Date
		*/
		public void setDmodifydate(Date  dmodifydate) {
			this.dmodifydate =  dmodifydate;//审核日期 Date
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
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
