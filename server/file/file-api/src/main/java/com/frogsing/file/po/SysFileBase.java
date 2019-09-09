package com.frogsing.file.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "cs_sysfile")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class SysFileBase  extends  BaseEntity{
	
	private   String scode; //编号 String
	private   Integer isysfiletype=0; //系统文件 int
	private   Date dadddate; //添加日期 Date
	private   Date dmoddate; //修改时间 Date
	private   String smodsuserid; //修改人 String
	private   String sreamrk; //备注 String
	private   String surl; //文件地址 String
	private   String sfilename; //文件名称 String
	   /**
		编号 String
		*/
		@Column(name="scode",length=50)
		public String getScode() {
			return  scode;//编号 String
		}
		/**
		编号 String
		*/
		public void setScode(String  scode) {
			this.scode =  scode;//编号 String
		}
	   /**
		系统文件 int
	    SysFileType:
	    0:AuthBook:授权书
1:ShopLogo:店铺logo
2:ShopBanner:店铺banner 
		*/
		@Column(name="isysfiletype")
		public Integer getIsysfiletype() {
			return  isysfiletype;//系统文件 int
		}
		/**
		系统文件 int
	    SysFileType:
	    0:AuthBook:授权书
1:ShopLogo:店铺logo
2:ShopBanner:店铺banner 
		*/
		public void setIsysfiletype(Integer  isysfiletype) {
			this.isysfiletype =  isysfiletype;//系统文件 int
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
		修改时间 Date
		*/
		@Column(name="dmoddate")
		public Date getDmoddate() {
			return  dmoddate;//修改时间 Date
		}
		/**
		修改时间 Date
		*/
		public void setDmoddate(Date  dmoddate) {
			this.dmoddate =  dmoddate;//修改时间 Date
		}
	   /**
		修改人 String
		*/
		@Column(name="smodsuserid",length=50)
		public String getSmodsuserid() {
			return  smodsuserid;//修改人 String
		}
		/**
		修改人 String
		*/
		public void setSmodsuserid(String  smodsuserid) {
			this.smodsuserid =  smodsuserid;//修改人 String
		}
	   /**
		备注 String
		*/
		@Column(name="sreamrk",length=500)
		public String getSreamrk() {
			return  sreamrk;//备注 String
		}
		/**
		备注 String
		*/
		public void setSreamrk(String  sreamrk) {
			this.sreamrk =  sreamrk;//备注 String
		}
	   /**
		文件地址 String
		*/
		@Column(name="surl",length=500)
		public String getSurl() {
			return  surl;//文件地址 String
		}
		/**
		文件地址 String
		*/
		public void setSurl(String  surl) {
			this.surl =  surl;//文件地址 String
		}
	   /**
		文件名称 String
		*/
		@Column(name="sfilename",length=50)
		public String getSfilename() {
			return  sfilename;//文件名称 String
		}
		/**
		文件名称 String
		*/
		public void setSfilename(String  sfilename) {
			this.sfilename =  sfilename;//文件名称 String
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
