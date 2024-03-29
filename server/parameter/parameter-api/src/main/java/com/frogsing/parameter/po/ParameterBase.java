package com.frogsing.parameter.po;
//frogsingcode//


import com.frogsing.heart.entity.BaseEntity;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import java.util.Date;
//frogsingcode//
//@Entity
//@Table(name = "cs_parameter")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class ParameterBase  extends  BaseEntity{
	
	private   Integer iparatype=0; //参数类型 int
	private   String sparametervalue; //参数值 String
	private   String sremark; //参数说明 String
	private   String saddoperator; //添加人 String
	private   Date dadddate; //添加日期 Date
	private   Date dmodifydate; //修改日期 Date
	private   String smodifyoperator; //修改人 String
	   /**
		参数类型 int
	    SysParaType:
	    1:ONECON:第一合约名称
2:TWOCON:第二合约名称
3:THREECON:第三合约名称
4:ImgUrl:图片服务器地址 
		*/
		@Column(name="iparatype")
		public Integer getIparatype() {
			return  iparatype;//参数类型 int
		}
		/**
		参数类型 int
	    SysParaType:
	    1:ONECON:第一合约名称
2:TWOCON:第二合约名称
3:THREECON:第三合约名称
4:ImgUrl:图片服务器地址 
		*/
		public void setIparatype(Integer  iparatype) {
			this.iparatype =  iparatype;//参数类型 int
		}
	   /**
		参数值 String
		*/
		@Column(name="sparametervalue",length=100)
		public String getSparametervalue() {
			return  sparametervalue;//参数值 String
		}
		/**
		参数值 String
		*/
		public void setSparametervalue(String  sparametervalue) {
			this.sparametervalue =  sparametervalue;//参数值 String
		}
	   /**
		参数说明 String
		*/
		@Column(name="sremark",length=2000)
		public String getSremark() {
			return  sremark;//参数说明 String
		}
		/**
		参数说明 String
		*/
		public void setSremark(String  sremark) {
			this.sremark =  sremark;//参数说明 String
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
