package com.frogsing.operator.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "op_servicecompany")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class ServiceCompanyBase  extends  BaseEntity{
	
	private   String sserviceid; //客服ID String
	private   String smemberid; //企业ID String
	   /**
		客服ID String
		*/
		@Column(name="sserviceid",length=32)
		public String getSserviceid() {
			return  sserviceid;//客服ID String
		}
		/**
		客服ID String
		*/
		public void setSserviceid(String  sserviceid) {
			this.sserviceid =  sserviceid;//客服ID String
		}
	   /**
		企业ID String
		*/
		@Column(name="smemberid",length=32)
		public String getSmemberid() {
			return  smemberid;//企业ID String
		}
		/**
		企业ID String
		*/
		public void setSmemberid(String  smemberid) {
			this.smemberid =  smemberid;//企业ID String
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
