package com.frogsing.member.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "hy_useractor")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class UserActorBase  extends  BaseEntity{
	
	private   String suserid; //交易员 String
	private   String sroleid; //角色 String
	   /**
		交易员 String
		*/
		@Column(name="suserid",length=32)
		public String getSuserid() {
			return  suserid;//交易员 String
		}
		/**
		交易员 String
		*/
		public void setSuserid(String  suserid) {
			this.suserid =  suserid;//交易员 String
		}
	   /**
		角色 String
		*/
		@Column(name="sroleid",length=32)
		public String getSroleid() {
			return  sroleid;//角色 String
		}
		/**
		角色 String
		*/
		public void setSroleid(String  sroleid) {
			this.sroleid =  sroleid;//角色 String
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
