package com.frogsing.project.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "xm_departurevalue")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class DeparturevalueBase  extends  BaseEntity{
	
	private   Double fnewtradedayself; //最新交易日偏离值自营 double
	private   Double fnewtradedaynotself; //最新交易日偏离值非自营 double
	@org.springframework.format.annotation.NumberFormat( style= org.springframework.format.annotation.NumberFormat.Style.NUMBER, pattern="#.####")////
	private   Double fnewtradeflowselfweight; //最新交易流量自营吨数 double
	private   Double fnewtradeflowselfamount; //最新交易流量自营交易额 double
	@org.springframework.format.annotation.NumberFormat( style= org.springframework.format.annotation.NumberFormat.Style.NUMBER, pattern="#.####")////
	private   Double fnewtradeflownotselfweight; //最新交易流量非自营吨数 double
	private   Double fnewtradeflownotselfamount; //最新交易流量非自营交易额 double
	private   String fkttitle; //K11大标题 String
	private   String fkchildtitle; //K11偏离值子标题 String
	private   Double fkself; //K11自营 double
	private   Double fknotself; //K11非自营 double
	private   String fkflowchildtitle; //K11流量子标题 String
	@org.springframework.format.annotation.NumberFormat( style= org.springframework.format.annotation.NumberFormat.Style.NUMBER, pattern="#.####")////
	private   Double fkselfweight; //K11自营吨数 double
	private   Double fkselftradeamount; //K11自营交易额 double
	@org.springframework.format.annotation.NumberFormat( style= org.springframework.format.annotation.NumberFormat.Style.NUMBER, pattern="#.####")////
	private   Double fkselftradeweight; //K11非自营吨数 double
	private   Double fknotselftradeamount; //K11非自营交易额 double
	private   String saddoperator; //添加人 String
	private   Date dadddate; //添加日期 Date
	private   Date dmodifydate; //修改日期 Date
	private   String smodifyoperator; //修改人 String
	   /**
		最新交易日偏离值自营 double
		*/
		@Column(name="fnewtradedayself")
		public Double getFnewtradedayself() {
			return  fnewtradedayself;//最新交易日偏离值自营 double
		}
		/**
		最新交易日偏离值自营 double
		*/
		public void setFnewtradedayself(Double  fnewtradedayself) {
			this.fnewtradedayself =  fnewtradedayself;//最新交易日偏离值自营 double
		}
	   /**
		最新交易日偏离值非自营 double
		*/
		@Column(name="fnewtradedaynotself")
		public Double getFnewtradedaynotself() {
			return  fnewtradedaynotself;//最新交易日偏离值非自营 double
		}
		/**
		最新交易日偏离值非自营 double
		*/
		public void setFnewtradedaynotself(Double  fnewtradedaynotself) {
			this.fnewtradedaynotself =  fnewtradedaynotself;//最新交易日偏离值非自营 double
		}
	   /**
		最新交易流量自营吨数 double
		*/
		@Column(name="fnewtradeflowselfweight")
		public Double getFnewtradeflowselfweight() {
			return  fnewtradeflowselfweight;//最新交易流量自营吨数 double
		}
		/**
		最新交易流量自营吨数 double
		*/
		public void setFnewtradeflowselfweight(Double  fnewtradeflowselfweight) {
			this.fnewtradeflowselfweight =  fnewtradeflowselfweight;//最新交易流量自营吨数 double
		}
	   /**
		最新交易流量自营交易额 double
		*/
		@Column(name="fnewtradeflowselfamount")
		public Double getFnewtradeflowselfamount() {
			return  fnewtradeflowselfamount;//最新交易流量自营交易额 double
		}
		/**
		最新交易流量自营交易额 double
		*/
		public void setFnewtradeflowselfamount(Double  fnewtradeflowselfamount) {
			this.fnewtradeflowselfamount =  fnewtradeflowselfamount;//最新交易流量自营交易额 double
		}
	   /**
		最新交易流量非自营吨数 double
		*/
		@Column(name="fnewtradeflownotselfweight")
		public Double getFnewtradeflownotselfweight() {
			return  fnewtradeflownotselfweight;//最新交易流量非自营吨数 double
		}
		/**
		最新交易流量非自营吨数 double
		*/
		public void setFnewtradeflownotselfweight(Double  fnewtradeflownotselfweight) {
			this.fnewtradeflownotselfweight =  fnewtradeflownotselfweight;//最新交易流量非自营吨数 double
		}
	   /**
		最新交易流量非自营交易额 double
		*/
		@Column(name="fnewtradeflownotselfamount")
		public Double getFnewtradeflownotselfamount() {
			return  fnewtradeflownotselfamount;//最新交易流量非自营交易额 double
		}
		/**
		最新交易流量非自营交易额 double
		*/
		public void setFnewtradeflownotselfamount(Double  fnewtradeflownotselfamount) {
			this.fnewtradeflownotselfamount =  fnewtradeflownotselfamount;//最新交易流量非自营交易额 double
		}
	   /**
		K11大标题 String
		*/
		@Column(name="fkttitle",length=100)
		public String getFkttitle() {
			return  fkttitle;//K11大标题 String
		}
		/**
		K11大标题 String
		*/
		public void setFkttitle(String  fkttitle) {
			this.fkttitle =  fkttitle;//K11大标题 String
		}
	   /**
		K11偏离值子标题 String
		*/
		@Column(name="fkchildtitle",length=100)
		public String getFkchildtitle() {
			return  fkchildtitle;//K11偏离值子标题 String
		}
		/**
		K11偏离值子标题 String
		*/
		public void setFkchildtitle(String  fkchildtitle) {
			this.fkchildtitle =  fkchildtitle;//K11偏离值子标题 String
		}
	   /**
		K11自营 double
		*/
		@Column(name="fkself")
		public Double getFkself() {
			return  fkself;//K11自营 double
		}
		/**
		K11自营 double
		*/
		public void setFkself(Double  fkself) {
			this.fkself =  fkself;//K11自营 double
		}
	   /**
		K11非自营 double
		*/
		@Column(name="fknotself")
		public Double getFknotself() {
			return  fknotself;//K11非自营 double
		}
		/**
		K11非自营 double
		*/
		public void setFknotself(Double  fknotself) {
			this.fknotself =  fknotself;//K11非自营 double
		}
	   /**
		K11流量子标题 String
		*/
		@Column(name="fkflowchildtitle",length=100)
		public String getFkflowchildtitle() {
			return  fkflowchildtitle;//K11流量子标题 String
		}
		/**
		K11流量子标题 String
		*/
		public void setFkflowchildtitle(String  fkflowchildtitle) {
			this.fkflowchildtitle =  fkflowchildtitle;//K11流量子标题 String
		}
	   /**
		K11自营吨数 double
		*/
		@Column(name="fkselfweight")
		public Double getFkselfweight() {
			return  fkselfweight;//K11自营吨数 double
		}
		/**
		K11自营吨数 double
		*/
		public void setFkselfweight(Double  fkselfweight) {
			this.fkselfweight =  fkselfweight;//K11自营吨数 double
		}
	   /**
		K11自营交易额 double
		*/
		@Column(name="fkselftradeamount")
		public Double getFkselftradeamount() {
			return  fkselftradeamount;//K11自营交易额 double
		}
		/**
		K11自营交易额 double
		*/
		public void setFkselftradeamount(Double  fkselftradeamount) {
			this.fkselftradeamount =  fkselftradeamount;//K11自营交易额 double
		}
	   /**
		K11非自营吨数 double
		*/
		@Column(name="fkselftradeweight")
		public Double getFkselftradeweight() {
			return  fkselftradeweight;//K11非自营吨数 double
		}
		/**
		K11非自营吨数 double
		*/
		public void setFkselftradeweight(Double  fkselftradeweight) {
			this.fkselftradeweight =  fkselftradeweight;//K11非自营吨数 double
		}
	   /**
		K11非自营交易额 double
		*/
		@Column(name="fknotselftradeamount")
		public Double getFknotselftradeamount() {
			return  fknotselftradeamount;//K11非自营交易额 double
		}
		/**
		K11非自营交易额 double
		*/
		public void setFknotselftradeamount(Double  fknotselftradeamount) {
			this.fknotselftradeamount =  fknotselftradeamount;//K11非自营交易额 double
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
