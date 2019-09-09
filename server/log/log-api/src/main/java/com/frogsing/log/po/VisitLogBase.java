package com.frogsing.log.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "lg_visitlog")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class VisitLogBase  extends  BaseEntity{
	
	private   String spurviewcode; //权限码 String
	private   String spurviewpath; //访问路径 String
	private   String soperator; //操作人 String
	private   Date ddate; //操作日期 Date
	   /**
		权限码 String
		*/
		@Column(name="spurviewcode",length=500)
		public String getSpurviewcode() {
			return  spurviewcode;//权限码 String
		}
		/**
		权限码 String
		*/
		public void setSpurviewcode(String  spurviewcode) {
			this.spurviewcode =  spurviewcode;//权限码 String
		}
	   /**
		访问路径 String
		*/
		@Column(name="spurviewpath",length=1000)
		public String getSpurviewpath() {
			return  spurviewpath;//访问路径 String
		}
		/**
		访问路径 String
		*/
		public void setSpurviewpath(String  spurviewpath) {
			this.spurviewpath =  spurviewpath;//访问路径 String
		}
	   /**
		操作人 String
		*/
		@Column(name="soperator",length=300)
		public String getSoperator() {
			return  soperator;//操作人 String
		}
		/**
		操作人 String
		*/
		public void setSoperator(String  soperator) {
			this.soperator =  soperator;//操作人 String
		}
	   /**
		操作日期 Date
		*/
		@Column(name="ddate")
		public Date getDdate() {
			return  ddate;//操作日期 Date
		}
		/**
		操作日期 Date
		*/
		public void setDdate(Date  ddate) {
			this.ddate =  ddate;//操作日期 Date
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
