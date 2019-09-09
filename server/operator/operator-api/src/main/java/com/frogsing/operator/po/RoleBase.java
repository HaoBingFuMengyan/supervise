package com.frogsing.operator.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "op_role")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class RoleBase  extends  BaseEntity{
	
	private   String srolenum; //角色编号 String
	private   String srolename; //角色名称 String
	private   String sremark; //备注 String
	private   Integer iroletype=0; //系统角色类型 int
	   /**
		角色编号 String
		*/
		@Column(name="srolenum",length=50)
		public String getSrolenum() {
			return  srolenum;//角色编号 String
		}
		/**
		角色编号 String
		*/
		public void setSrolenum(String  srolenum) {
			this.srolenum =  srolenum;//角色编号 String
		}
	   /**
		角色名称 String
		*/
		@Column(name="srolename",length=50)
		public String getSrolename() {
			return  srolename;//角色名称 String
		}
		/**
		角色名称 String
		*/
		public void setSrolename(String  srolename) {
			this.srolename =  srolename;//角色名称 String
		}
	   /**
		备注 String
		*/
		@Column(name="sremark",length=2000)
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
		系统角色类型 int
	    SysRoleType:
	    0:CS:CS端
1:BS:WEB端
2:MB:移动端 
		*/
		@Column(name="iroletype")
		public Integer getIroletype() {
			return  iroletype;//系统角色类型 int
		}
		/**
		系统角色类型 int
	    SysRoleType:
	    0:CS:CS端
1:BS:WEB端
2:MB:移动端 
		*/
		public void setIroletype(Integer  iroletype) {
			this.iroletype =  iroletype;//系统角色类型 int
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
