package com.frogsing.operator.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "op_operatorrole")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class OperatorRoleBase  extends  BaseEntity{
	
	private   String soperatorid; //操作员ID String
	private   String sroleid; //角色ID String
	   /**
		操作员ID String
		*/
		@Column(name="soperatorid",length=32)
		public String getSoperatorid() {
			return  soperatorid;//操作员ID String
		}
		/**
		操作员ID String
		*/
		public void setSoperatorid(String  soperatorid) {
			this.soperatorid =  soperatorid;//操作员ID String
		}
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
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
