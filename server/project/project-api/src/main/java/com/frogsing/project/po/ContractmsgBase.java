package com.frogsing.project.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "xm_contractmsg")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class ContractmsgBase  extends  BaseEntity{
	
	private   String scommandid; //指令ID String
	private   String scommandname; //指令名称 String
	private   String smaincontractname; //主力合约名称 String
	@org.springframework.format.annotation.NumberFormat( style= org.springframework.format.annotation.NumberFormat.Style.NUMBER, pattern="#")//
	private   Double fmaincontractprice; //主力合约价格 double
	private   String snextcontractname; //次主力合约名称 String
	@org.springframework.format.annotation.NumberFormat( style= org.springframework.format.annotation.NumberFormat.Style.NUMBER, pattern="#")//
	private   Double fnextcontractprice; //次主力合约价格 double
	private   String snextnextcontractname; //次次主力合约名称 String
	@org.springframework.format.annotation.NumberFormat( style= org.springframework.format.annotation.NumberFormat.Style.NUMBER, pattern="#")//
	private   Double fnextnextcontractprice; //次次主力合约价格 double
	private   String spic; //图片 String
	private   String snewnotice; //最新公告 String
	private   String saddoperator; //添加人 String
	private   Date dadddate; //添加日期 Date
	private   Date dmodifydate; //修改日期 Date
	private   String smodifyoperator; //修改人 String
	   /**
		指令ID String
		*/
		@Column(name="scommandid",length=32)
		public String getScommandid() {
			return  scommandid;//指令ID String
		}
		/**
		指令ID String
		*/
		public void setScommandid(String  scommandid) {
			this.scommandid =  scommandid;//指令ID String
		}
	   /**
		指令名称 String
		*/
		@Column(name="scommandname",length=100)
		public String getScommandname() {
			return  scommandname;//指令名称 String
		}
		/**
		指令名称 String
		*/
		public void setScommandname(String  scommandname) {
			this.scommandname =  scommandname;//指令名称 String
		}
	   /**
		主力合约名称 String
		*/
		@Column(name="smaincontractname",length=100)
		public String getSmaincontractname() {
			return  smaincontractname;//主力合约名称 String
		}
		/**
		主力合约名称 String
		*/
		public void setSmaincontractname(String  smaincontractname) {
			this.smaincontractname =  smaincontractname;//主力合约名称 String
		}
	   /**
		主力合约价格 double
		*/
		@Column(name="fmaincontractprice")
		public Double getFmaincontractprice() {
			return  fmaincontractprice;//主力合约价格 double
		}
		/**
		主力合约价格 double
		*/
		public void setFmaincontractprice(Double  fmaincontractprice) {
			this.fmaincontractprice =  fmaincontractprice;//主力合约价格 double
		}
	   /**
		次主力合约名称 String
		*/
		@Column(name="snextcontractname",length=100)
		public String getSnextcontractname() {
			return  snextcontractname;//次主力合约名称 String
		}
		/**
		次主力合约名称 String
		*/
		public void setSnextcontractname(String  snextcontractname) {
			this.snextcontractname =  snextcontractname;//次主力合约名称 String
		}
	   /**
		次主力合约价格 double
		*/
		@Column(name="fnextcontractprice")
		public Double getFnextcontractprice() {
			return  fnextcontractprice;//次主力合约价格 double
		}
		/**
		次主力合约价格 double
		*/
		public void setFnextcontractprice(Double  fnextcontractprice) {
			this.fnextcontractprice =  fnextcontractprice;//次主力合约价格 double
		}
	   /**
		次次主力合约名称 String
		*/
		@Column(name="snextnextcontractname",length=100)
		public String getSnextnextcontractname() {
			return  snextnextcontractname;//次次主力合约名称 String
		}
		/**
		次次主力合约名称 String
		*/
		public void setSnextnextcontractname(String  snextnextcontractname) {
			this.snextnextcontractname =  snextnextcontractname;//次次主力合约名称 String
		}
	   /**
		次次主力合约价格 double
		*/
		@Column(name="fnextnextcontractprice")
		public Double getFnextnextcontractprice() {
			return  fnextnextcontractprice;//次次主力合约价格 double
		}
		/**
		次次主力合约价格 double
		*/
		public void setFnextnextcontractprice(Double  fnextnextcontractprice) {
			this.fnextnextcontractprice =  fnextnextcontractprice;//次次主力合约价格 double
		}
	   /**
		图片 String
		*/
		@Column(name="spic",length=500)
		public String getSpic() {
			return  spic;//图片 String
		}
		/**
		图片 String
		*/
		public void setSpic(String  spic) {
			this.spic =  spic;//图片 String
		}
	   /**
		最新公告 String
		*/
		@Column(name="snewnotice",length=300)
		public String getSnewnotice() {
			return  snewnotice;//最新公告 String
		}
		/**
		最新公告 String
		*/
		public void setSnewnotice(String  snewnotice) {
			this.snewnotice =  snewnotice;//最新公告 String
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
