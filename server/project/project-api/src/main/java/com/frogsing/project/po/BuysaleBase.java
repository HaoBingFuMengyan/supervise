package com.frogsing.project.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "xm_buysale")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class BuysaleBase  extends  BaseEntity{
	
	@org.springframework.format.annotation.NumberFormat( style= org.springframework.format.annotation.NumberFormat.Style.NUMBER, pattern="#.####")////
	private   Double ftodayrealitybuyweight; //单日实际采购数量 double
	@org.springframework.format.annotation.NumberFormat( style= org.springframework.format.annotation.NumberFormat.Style.NUMBER, pattern="#.####")////
	private   Double ftomorrowmaybuyweight; //次日可采购数量 double
	@org.springframework.format.annotation.NumberFormat( style= org.springframework.format.annotation.NumberFormat.Style.NUMBER, pattern="#.####")////
	private   Double ftomorrowplanbuyweight; //次日预计采购数量 double
	@org.springframework.format.annotation.NumberFormat( style= org.springframework.format.annotation.NumberFormat.Style.NUMBER, pattern="#.####")////
	private   Double fweekplanbuyweight; //当周预计采购数量 double
	@org.springframework.format.annotation.NumberFormat( style= org.springframework.format.annotation.NumberFormat.Style.NUMBER, pattern="#")//
	private   Double ftodaybuyprice; //当日采购点价 double
	@org.springframework.format.annotation.NumberFormat( style= org.springframework.format.annotation.NumberFormat.Style.NUMBER, pattern="#")//
	private   Double ftodaysaleprice; //当日销售点价 double
	@org.springframework.format.annotation.NumberFormat( style= org.springframework.format.annotation.NumberFormat.Style.NUMBER, pattern="#")//
	private   Double fbuypricefuturesbalance; //采购点价期货套保余额 double
	@org.springframework.format.annotation.NumberFormat( style= org.springframework.format.annotation.NumberFormat.Style.NUMBER, pattern="#")//
	private   Double fsalepricefuturesbalance; //销售点价期货套保余额 double
	@org.springframework.format.annotation.NumberFormat( style= org.springframework.format.annotation.NumberFormat.Style.NUMBER, pattern="#")//
	private   Double fprice; //前日生产总数 double
	private   String saddoperator; //添加人 String
	private   Date dadddate; //添加日期 Date
	private   Date dmodifydate; //修改日期 Date
	private   String smodifyoperator; //修改人 String
	   /**
		单日实际采购数量 double
		*/
		@Column(name="ftodayrealitybuyweight")
		public Double getFtodayrealitybuyweight() {
			return  ftodayrealitybuyweight;//单日实际采购数量 double
		}
		/**
		单日实际采购数量 double
		*/
		public void setFtodayrealitybuyweight(Double  ftodayrealitybuyweight) {
			this.ftodayrealitybuyweight =  ftodayrealitybuyweight;//单日实际采购数量 double
		}
	   /**
		次日可采购数量 double
		*/
		@Column(name="ftomorrowmaybuyweight")
		public Double getFtomorrowmaybuyweight() {
			return  ftomorrowmaybuyweight;//次日可采购数量 double
		}
		/**
		次日可采购数量 double
		*/
		public void setFtomorrowmaybuyweight(Double  ftomorrowmaybuyweight) {
			this.ftomorrowmaybuyweight =  ftomorrowmaybuyweight;//次日可采购数量 double
		}
	   /**
		次日预计采购数量 double
		*/
		@Column(name="ftomorrowplanbuyweight")
		public Double getFtomorrowplanbuyweight() {
			return  ftomorrowplanbuyweight;//次日预计采购数量 double
		}
		/**
		次日预计采购数量 double
		*/
		public void setFtomorrowplanbuyweight(Double  ftomorrowplanbuyweight) {
			this.ftomorrowplanbuyweight =  ftomorrowplanbuyweight;//次日预计采购数量 double
		}
	   /**
		当周预计采购数量 double
		*/
		@Column(name="fweekplanbuyweight")
		public Double getFweekplanbuyweight() {
			return  fweekplanbuyweight;//当周预计采购数量 double
		}
		/**
		当周预计采购数量 double
		*/
		public void setFweekplanbuyweight(Double  fweekplanbuyweight) {
			this.fweekplanbuyweight =  fweekplanbuyweight;//当周预计采购数量 double
		}
	   /**
		当日采购点价 double
		*/
		@Column(name="ftodaybuyprice")
		public Double getFtodaybuyprice() {
			return  ftodaybuyprice;//当日采购点价 double
		}
		/**
		当日采购点价 double
		*/
		public void setFtodaybuyprice(Double  ftodaybuyprice) {
			this.ftodaybuyprice =  ftodaybuyprice;//当日采购点价 double
		}
	   /**
		当日销售点价 double
		*/
		@Column(name="ftodaysaleprice")
		public Double getFtodaysaleprice() {
			return  ftodaysaleprice;//当日销售点价 double
		}
		/**
		当日销售点价 double
		*/
		public void setFtodaysaleprice(Double  ftodaysaleprice) {
			this.ftodaysaleprice =  ftodaysaleprice;//当日销售点价 double
		}
	   /**
		采购点价期货套保余额 double
		*/
		@Column(name="fbuypricefuturesbalance")
		public Double getFbuypricefuturesbalance() {
			return  fbuypricefuturesbalance;//采购点价期货套保余额 double
		}
		/**
		采购点价期货套保余额 double
		*/
		public void setFbuypricefuturesbalance(Double  fbuypricefuturesbalance) {
			this.fbuypricefuturesbalance =  fbuypricefuturesbalance;//采购点价期货套保余额 double
		}
	   /**
		销售点价期货套保余额 double
		*/
		@Column(name="fsalepricefuturesbalance")
		public Double getFsalepricefuturesbalance() {
			return  fsalepricefuturesbalance;//销售点价期货套保余额 double
		}
		/**
		销售点价期货套保余额 double
		*/
		public void setFsalepricefuturesbalance(Double  fsalepricefuturesbalance) {
			this.fsalepricefuturesbalance =  fsalepricefuturesbalance;//销售点价期货套保余额 double
		}
	   /**
		前日生产总数 double
		*/
		@Column(name="fprice")
		public Double getFprice() {
			return  fprice;//前日生产总数 double
		}
		/**
		前日生产总数 double
		*/
		public void setFprice(Double  fprice) {
			this.fprice =  fprice;//前日生产总数 double
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
