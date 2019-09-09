package com.frogsing.project.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "xm_positiontrans")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class PositiontransBase  extends  BaseEntity{
	
	private   String sselfsupport; //自营 String
	private   String snotselfsupport; //非自营 String
	@org.springframework.format.annotation.NumberFormat( style= org.springframework.format.annotation.NumberFormat.Style.NUMBER, pattern="#")//
	private   Double fprice; //点价 double
	private   String saddoperator; //添加人 String
	private   Date dadddate; //添加日期 Date
	private   Date dmodifydate; //修改日期 Date
	private   String smodifyoperator; //修改人 String
	   /**
		自营 String
		*/
		@Column(name="sselfsupport",length=100)
		public String getSselfsupport() {
			return  sselfsupport;//自营 String
		}
		/**
		自营 String
		*/
		public void setSselfsupport(String  sselfsupport) {
			this.sselfsupport =  sselfsupport;//自营 String
		}
	   /**
		非自营 String
		*/
		@Column(name="snotselfsupport",length=100)
		public String getSnotselfsupport() {
			return  snotselfsupport;//非自营 String
		}
		/**
		非自营 String
		*/
		public void setSnotselfsupport(String  snotselfsupport) {
			this.snotselfsupport =  snotselfsupport;//非自营 String
		}
	   /**
		点价 double
		*/
		@Column(name="fprice")
		public Double getFprice() {
			return  fprice;//点价 double
		}
		/**
		点价 double
		*/
		public void setFprice(Double  fprice) {
			this.fprice =  fprice;//点价 double
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
