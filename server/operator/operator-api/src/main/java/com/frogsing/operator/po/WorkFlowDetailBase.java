package com.frogsing.operator.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "wf_workflowdetail")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class WorkFlowDetailBase  extends  BaseEntity{
	
	private   String sworkflowid; //工作流Id String
	private   Integer iseq=0; //排序号 int
	private   Integer ilevel=0; //级别 int
	private   String sno; //节点编号 String
	private   String sname; //节点名称 String
	private   String sdesc; //节点描述 String
	private   Integer bisactive=0; //是否激活 int
	private   Integer istatus=0; //是否通过 int
	private   String spreid; //上级节点Id String
	private   String snextid; //下级节点Id String
	private   String sdepartment; //处理部门 String
	private   String spost; //处理岗位 String
	private   String soperatorid; //审核人Id String
	private   String scheckoperator; //审核人员 String
	private   Date dmodifydate; //审核日期 Date
	private   String scheckinfo; //审核意见 String
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
		节点编号 String
		*/
		@Column(name="sno",length=50)
		public String getSno() {
			return  sno;//节点编号 String
		}
		/**
		节点编号 String
		*/
		public void setSno(String  sno) {
			this.sno =  sno;//节点编号 String
		}
	   /**
		节点名称 String
		*/
		@Column(name="sname",length=100)
		public String getSname() {
			return  sname;//节点名称 String
		}
		/**
		节点名称 String
		*/
		public void setSname(String  sname) {
			this.sname =  sname;//节点名称 String
		}
	   /**
		节点描述 String
		*/
		@Column(name="sdesc",length=2000)
		public String getSdesc() {
			return  sdesc;//节点描述 String
		}
		/**
		节点描述 String
		*/
		public void setSdesc(String  sdesc) {
			this.sdesc =  sdesc;//节点描述 String
		}
	   /**
		是否激活 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisactive")
		public Integer getBisactive() {
			return  bisactive;//是否激活 int
		}
		/**
		是否激活 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisactive(Integer  bisactive) {
			this.bisactive =  bisactive;//是否激活 int
		}
	   /**
		是否通过 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="istatus")
		public Integer getIstatus() {
			return  istatus;//是否通过 int
		}
		/**
		是否通过 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setIstatus(Integer  istatus) {
			this.istatus =  istatus;//是否通过 int
		}
	   /**
		上级节点Id String
		*/
		@Column(name="spreid",length=32)
		public String getSpreid() {
			return  spreid;//上级节点Id String
		}
		/**
		上级节点Id String
		*/
		public void setSpreid(String  spreid) {
			this.spreid =  spreid;//上级节点Id String
		}
	   /**
		下级节点Id String
		*/
		@Column(name="snextid",length=32)
		public String getSnextid() {
			return  snextid;//下级节点Id String
		}
		/**
		下级节点Id String
		*/
		public void setSnextid(String  snextid) {
			this.snextid =  snextid;//下级节点Id String
		}
	   /**
		处理部门 String
		*/
		@Column(name="sdepartment",length=100)
		public String getSdepartment() {
			return  sdepartment;//处理部门 String
		}
		/**
		处理部门 String
		*/
		public void setSdepartment(String  sdepartment) {
			this.sdepartment =  sdepartment;//处理部门 String
		}
	   /**
		处理岗位 String
		*/
		@Column(name="spost",length=100)
		public String getSpost() {
			return  spost;//处理岗位 String
		}
		/**
		处理岗位 String
		*/
		public void setSpost(String  spost) {
			this.spost =  spost;//处理岗位 String
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
		审核意见 String
		*/
		@Column(name="scheckinfo",length=500)
		public String getScheckinfo() {
			return  scheckinfo;//审核意见 String
		}
		/**
		审核意见 String
		*/
		public void setScheckinfo(String  scheckinfo) {
			this.scheckinfo =  scheckinfo;//审核意见 String
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
