package com.frogsing.member.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "hy_actor")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class ActorBase  extends  BaseEntity{
	
	private   String srolecode; //角色编号 String
	private   String srolename; //角色名称 String
	private   Integer iroletype=0; //角色类型 int
	private   String smemberid; //会员ID String
	private   String suserid; //操作员 String
	private   Date dinputdate; //创建日期 Date
	private   String sremark; //备注 String
	private   Integer isortno=0; //排序号 int
	private   Date dadddate; //添加日期 Date
	private   String saddoperator; //添加人 String
	private   Date dmodifydate; //修改日期 Date
	private   String smodifyoperator; //修改人 String
	private   Integer bissystem=0; //是否系统角色 int
	private   Integer imemberstatus=0; //认证类型 int
	private   Integer bisspecial=0; //是否特殊 int
	private   String sspecialroleid; //特殊角色id String
	   /**
		角色编号 String
		*/
		@Column(name="srolecode",length=50)
		public String getSrolecode() {
			return  srolecode;//角色编号 String
		}
		/**
		角色编号 String
		*/
		public void setSrolecode(String  srolecode) {
			this.srolecode =  srolecode;//角色编号 String
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
		角色类型 int
	    MemberType:
	    0:EXCHANGE:交易中心
1:MEMBER:交易会员
2:Chain:供应链会员
3:ZIFANG:资方
 
		*/
		@Column(name="iroletype")
		public Integer getIroletype() {
			return  iroletype;//角色类型 int
		}
		/**
		角色类型 int
	    MemberType:
	    0:EXCHANGE:交易中心
1:MEMBER:交易会员
2:Chain:供应链会员
3:ZIFANG:资方
 
		*/
		public void setIroletype(Integer  iroletype) {
			this.iroletype =  iroletype;//角色类型 int
		}
	   /**
		会员ID String
		*/
		@Column(name="smemberid",length=32)
		public String getSmemberid() {
			return  smemberid;//会员ID String
		}
		/**
		会员ID String
		*/
		public void setSmemberid(String  smemberid) {
			this.smemberid =  smemberid;//会员ID String
		}
	   /**
		操作员 String
		*/
		@Column(name="suserid",length=32)
		public String getSuserid() {
			return  suserid;//操作员 String
		}
		/**
		操作员 String
		*/
		public void setSuserid(String  suserid) {
			this.suserid =  suserid;//操作员 String
		}
	   /**
		创建日期 Date
		*/
		@Column(name="dinputdate")
		public Date getDinputdate() {
			return  dinputdate;//创建日期 Date
		}
		/**
		创建日期 Date
		*/
		public void setDinputdate(Date  dinputdate) {
			this.dinputdate =  dinputdate;//创建日期 Date
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
		排序号 int
		*/
		@Column(name="isortno")
		public Integer getIsortno() {
			return  isortno;//排序号 int
		}
		/**
		排序号 int
		*/
		public void setIsortno(Integer  isortno) {
			this.isortno =  isortno;//排序号 int
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
	   /**
		是否系统角色 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bissystem")
		public Integer getBissystem() {
			return  bissystem;//是否系统角色 int
		}
		/**
		是否系统角色 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBissystem(Integer  bissystem) {
			this.bissystem =  bissystem;//是否系统角色 int
		}
	   /**
		认证类型 int
	    AuthenticateType:
	    0:No:注册会员
10:PERSONAL:个人认证
20:Company:企业认证 
		*/
		@Column(name="imemberstatus")
		public Integer getImemberstatus() {
			return  imemberstatus;//认证类型 int
		}
		/**
		认证类型 int
	    AuthenticateType:
	    0:No:注册会员
10:PERSONAL:个人认证
20:Company:企业认证 
		*/
		public void setImemberstatus(Integer  imemberstatus) {
			this.imemberstatus =  imemberstatus;//认证类型 int
		}
	   /**
		是否特殊 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisspecial")
		public Integer getBisspecial() {
			return  bisspecial;//是否特殊 int
		}
		/**
		是否特殊 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisspecial(Integer  bisspecial) {
			this.bisspecial =  bisspecial;//是否特殊 int
		}
	   /**
		特殊角色id String
		*/
		@Column(name="sspecialroleid",length=32)
		public String getSspecialroleid() {
			return  sspecialroleid;//特殊角色id String
		}
		/**
		特殊角色id String
		*/
		public void setSspecialroleid(String  sspecialroleid) {
			this.sspecialroleid =  sspecialroleid;//特殊角色id String
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
