package com.frogsing.file.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "wj_filedirection")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class FileDirectionBase  extends  BaseEntity{
	
	private   String sbillid; //单据ID String
	private   Integer isort=0; //序号 int
	private   String sfilepath; //文件路径 String
	private   String sfilename; //文件名 String
	private   Integer bisdefault=0; //是否默认 int
	private   Integer bisused=0; //是否已使用 int
	private   String sremark; //备注 String
	private   Date dadddate; //添加日期 Date
	   /**
		单据ID String
		*/
		@Column(name="sbillid",length=32)
		public String getSbillid() {
			return  sbillid;//单据ID String
		}
		/**
		单据ID String
		*/
		public void setSbillid(String  sbillid) {
			this.sbillid =  sbillid;//单据ID String
		}
	   /**
		序号 int
		*/
		@Column(name="isort")
		public Integer getIsort() {
			return  isort;//序号 int
		}
		/**
		序号 int
		*/
		public void setIsort(Integer  isort) {
			this.isort =  isort;//序号 int
		}
	   /**
		文件路径 String
		*/
		@Column(name="sfilepath",length=100)
		public String getSfilepath() {
			return  sfilepath;//文件路径 String
		}
		/**
		文件路径 String
		*/
		public void setSfilepath(String  sfilepath) {
			this.sfilepath =  sfilepath;//文件路径 String
		}
	   /**
		文件名 String
		*/
		@Column(name="sfilename",length=100)
		public String getSfilename() {
			return  sfilename;//文件名 String
		}
		/**
		文件名 String
		*/
		public void setSfilename(String  sfilename) {
			this.sfilename =  sfilename;//文件名 String
		}
	   /**
		是否默认 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisdefault")
		public Integer getBisdefault() {
			return  bisdefault;//是否默认 int
		}
		/**
		是否默认 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisdefault(Integer  bisdefault) {
			this.bisdefault =  bisdefault;//是否默认 int
		}
	   /**
		是否已使用 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisused")
		public Integer getBisused() {
			return  bisused;//是否已使用 int
		}
		/**
		是否已使用 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisused(Integer  bisused) {
			this.bisused =  bisused;//是否已使用 int
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
