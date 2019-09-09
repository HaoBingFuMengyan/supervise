package com.frogsing.parameter.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "cs_sequence")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class SequenceBase  extends  BaseEntity{
	
	private   String scode; //编号 String
	private   String sobjectname; //对象名称 String
	private   String sfromat; //格式 String
	private   Integer iincrement=0; //递增大小 int
	private   Integer istartno=0; //起始值 int
	private   Integer icurrentno=0; //当前编号 int
	private   String sprefix; //前缀 String
	private   String ssuffix; //后缀 String
	private   Integer sseqlength=0; //流水位数 int
	private   String dcurrentdate; //当前日期 String
	private   Integer biscycle=0; //是否重新生成编号 int
	private   String sremark; //备注 String
	private   Integer bisreset=0; //是否结算清零 int
	   /**
		编号 String
		*/
		@Column(name="scode",length=50)
		public String getScode() {
			return  scode;//编号 String
		}
		/**
		编号 String
		*/
		public void setScode(String  scode) {
			this.scode =  scode;//编号 String
		}
	   /**
		对象名称 String
		*/
		@Column(name="sobjectname",length=100)
		public String getSobjectname() {
			return  sobjectname;//对象名称 String
		}
		/**
		对象名称 String
		*/
		public void setSobjectname(String  sobjectname) {
			this.sobjectname =  sobjectname;//对象名称 String
		}
	   /**
		格式 String
		*/
		@Column(name="sfromat",length=100)
		public String getSfromat() {
			return  sfromat;//格式 String
		}
		/**
		格式 String
		*/
		public void setSfromat(String  sfromat) {
			this.sfromat =  sfromat;//格式 String
		}
	   /**
		递增大小 int
		*/
		@Column(name="iincrement")
		public Integer getIincrement() {
			return  iincrement;//递增大小 int
		}
		/**
		递增大小 int
		*/
		public void setIincrement(Integer  iincrement) {
			this.iincrement =  iincrement;//递增大小 int
		}
	   /**
		起始值 int
		*/
		@Column(name="istartno")
		public Integer getIstartno() {
			return  istartno;//起始值 int
		}
		/**
		起始值 int
		*/
		public void setIstartno(Integer  istartno) {
			this.istartno =  istartno;//起始值 int
		}
	   /**
		当前编号 int
		*/
		@Column(name="icurrentno")
		public Integer getIcurrentno() {
			return  icurrentno;//当前编号 int
		}
		/**
		当前编号 int
		*/
		public void setIcurrentno(Integer  icurrentno) {
			this.icurrentno =  icurrentno;//当前编号 int
		}
	   /**
		前缀 String
		*/
		@Column(name="sprefix",length=50)
		public String getSprefix() {
			return  sprefix;//前缀 String
		}
		/**
		前缀 String
		*/
		public void setSprefix(String  sprefix) {
			this.sprefix =  sprefix;//前缀 String
		}
	   /**
		后缀 String
		*/
		@Column(name="ssuffix",length=50)
		public String getSsuffix() {
			return  ssuffix;//后缀 String
		}
		/**
		后缀 String
		*/
		public void setSsuffix(String  ssuffix) {
			this.ssuffix =  ssuffix;//后缀 String
		}
	   /**
		流水位数 int
		*/
		@Column(name="sseqlength")
		public Integer getSseqlength() {
			return  sseqlength;//流水位数 int
		}
		/**
		流水位数 int
		*/
		public void setSseqlength(Integer  sseqlength) {
			this.sseqlength =  sseqlength;//流水位数 int
		}
	   /**
		当前日期 String
		*/
		@Column(name="dcurrentdate",length=50)
		public String getDcurrentdate() {
			return  dcurrentdate;//当前日期 String
		}
		/**
		当前日期 String
		*/
		public void setDcurrentdate(String  dcurrentdate) {
			this.dcurrentdate =  dcurrentdate;//当前日期 String
		}
	   /**
		是否重新生成编号 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="biscycle")
		public Integer getBiscycle() {
			return  biscycle;//是否重新生成编号 int
		}
		/**
		是否重新生成编号 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBiscycle(Integer  biscycle) {
			this.biscycle =  biscycle;//是否重新生成编号 int
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
		是否结算清零 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisreset")
		public Integer getBisreset() {
			return  bisreset;//是否结算清零 int
		}
		/**
		是否结算清零 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisreset(Integer  bisreset) {
			this.bisreset =  bisreset;//是否结算清零 int
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
