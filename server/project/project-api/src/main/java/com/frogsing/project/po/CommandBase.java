package com.frogsing.project.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "xm_command")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class CommandBase  extends  BaseEntity{
	
	private   String sno; //指令编号 String
	private   String scontent; //指令内容 String
	private   String saddoperator; //添加人 String
	private   Date dadddate; //添加日期 Date
	private   Date dmodifydate; //修改日期 Date
	private   String smodifyoperator; //修改人 String
	   /**
		指令编号 String
		*/
		@Column(name="sno",length=100)
		public String getSno() {
			return  sno;//指令编号 String
		}
		/**
		指令编号 String
		*/
		public void setSno(String  sno) {
			this.sno =  sno;//指令编号 String
		}
	   /**
		指令内容 String
		*/
		@Column(name="scontent",length=2000)
		public String getScontent() {
			return  scontent;//指令内容 String
		}
		/**
		指令内容 String
		*/
		public void setScontent(String  scontent) {
			this.scontent =  scontent;//指令内容 String
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
