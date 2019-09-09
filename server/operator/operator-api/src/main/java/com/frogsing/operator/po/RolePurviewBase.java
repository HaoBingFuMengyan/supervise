package com.frogsing.operator.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "op_rolepurview")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class RolePurviewBase  extends  BaseEntity{
	
	private   String sroleid; //角色ID String
	private   String spurviewid; //权限码ID String
	   /**
		角色ID String
		*/
		@Column(name="sroleid",length=32)
		public String getSroleid() {
			return  sroleid;//角色ID String
		}
		/**
		角色ID String
		*/
		public void setSroleid(String  sroleid) {
			this.sroleid =  sroleid;//角色ID String
		}
	   /**
		权限码ID String
		*/
		@Column(name="spurviewid",length=32)
		public String getSpurviewid() {
			return  spurviewid;//权限码ID String
		}
		/**
		权限码ID String
		*/
		public void setSpurviewid(String  spurviewid) {
			this.spurviewid =  spurviewid;//权限码ID String
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
