package com.frogsing.operator.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "wf_workflowtemplatedetail")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class WorkFlowTemplateDetailBase  extends  BaseEntity{
	
	private   String sworkflowid; //工作流Id String
	private   Integer iseq=0; //排序号 int
	private   Integer ilevel=0; //级别 int
	private   String soperatorid; //审核人Id String
	private   String scheckoperator; //审核人员 String
	private   String sremark; //备注 String
	   /**
		工作流Id String
		*/
		@Column(name="sworkflowid",length=32)
		public String getSworkflowid() {
			return  sworkflowid;//工作流Id String
		}
		/**
		工作流Id String
		*/
		public void setSworkflowid(String  sworkflowid) {
			this.sworkflowid =  sworkflowid;//工作流Id String
		}
	   /**
		排序号 int
		*/
		@Column(name="iseq")
		public Integer getIseq() {
			return  iseq;//排序号 int
		}
		/**
		排序号 int
		*/
		public void setIseq(Integer  iseq) {
			this.iseq =  iseq;//排序号 int
		}
	   /**
		级别 int
		*/
		@Column(name="ilevel")
		public Integer getIlevel() {
			return  ilevel;//级别 int
		}
		/**
		级别 int
		*/
		public void setIlevel(Integer  ilevel) {
			this.ilevel =  ilevel;//级别 int
		}
	   /**
		审核人Id String
		*/
		@Column(name="soperatorid",length=32)
		public String getSoperatorid() {
			return  soperatorid;//审核人Id String
		}
		/**
		审核人Id String
		*/
		public void setSoperatorid(String  soperatorid) {
			this.soperatorid =  soperatorid;//审核人Id String
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
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
