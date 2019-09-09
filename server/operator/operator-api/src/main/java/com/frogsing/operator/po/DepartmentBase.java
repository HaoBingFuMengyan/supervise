package com.frogsing.operator.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "op_department")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class DepartmentBase  extends  BaseEntity{
	
	private   String sname; //部门名称 String
	private   String sremark; //备注 String
	private   String sparentid; //父节点ID String
	private   Integer bisroot=0; //是否父节点 int
	private   Integer bisleaf=0; //是否叶子节点 int
	private   Date dadddate; //添加日期 Date
	   /**
		部门名称 String
		*/
		@Column(name="sname",length=50)
		public String getSname() {
			return  sname;//部门名称 String
		}
		/**
		部门名称 String
		*/
		public void setSname(String  sname) {
			this.sname =  sname;//部门名称 String
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
		父节点ID String
		*/
		@Column(name="sparentid",length=32)
		public String getSparentid() {
			return  sparentid;//父节点ID String
		}
		/**
		父节点ID String
		*/
		public void setSparentid(String  sparentid) {
			this.sparentid =  sparentid;//父节点ID String
		}
	   /**
		是否父节点 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisroot")
		public Integer getBisroot() {
			return  bisroot;//是否父节点 int
		}
		/**
		是否父节点 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisroot(Integer  bisroot) {
			this.bisroot =  bisroot;//是否父节点 int
		}
	   /**
		是否叶子节点 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisleaf")
		public Integer getBisleaf() {
			return  bisleaf;//是否叶子节点 int
		}
		/**
		是否叶子节点 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisleaf(Integer  bisleaf) {
			this.bisleaf =  bisleaf;//是否叶子节点 int
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
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
