package com.frogsing.member.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "hy_authapplywarn")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class AuthapplyWarnBase  extends  BaseEntity{
	
	private   String scnname; //企业名称 String
	private   Integer icardtype=0; //证件类型 int
	private   String ssocialcreditno; //社会统一信用代码 String
	private   Integer ibiztype=0; //业务类型 int
	private   String sname; //姓名 String
	private   String scardno; //证件号 String
	private   String skzrname; //实际控制人姓名 String
	private   Integer ikrzcardtype=0; //控制人证件类型 int
	private   String skzrcardno; //控制人证件号 String
	private   Integer istatus=0; //状态 int
	private   String scheckuser; //审核人 String
	private   Date dcheckdate; //审核日期 Date
	private   String scheckinfo; //审核意见 String
	private   String sremark; //备注 String
	private   Date dadddate; //添加日期 Date
	private   String sadduser; //添加人 String
	private   Date dmodifydate; //修改日期 Date
	private   String smodifyoperator; //修改人 String
	private   Integer irisklevel=0; //等级 int
	private   Double fscore; //整体评分 double
	private   Double fjgscore; //机构自身评分 double
	private   Double fhxscore; //核心人员评分 double
	private   Double fglqyscore; //关联企业评分 double
	private   Double fzgjjscore; //在管基金评分 double
	private   Double fwbascore; //未备案企业 double
	private   Double fglrscore; //管理人合规性 double
	private   Double fjjyzscore; //基金运作情况 double
	private   Double fwarnnum; //预警数 double
	   /**
		企业名称 String
		*/
		@Column(name="scnname",length=50)
		public String getScnname() {
			return  scnname;//企业名称 String
		}
		/**
		企业名称 String
		*/
		public void setScnname(String  scnname) {
			this.scnname =  scnname;//企业名称 String
		}
	   /**
		证件类型 int
	    MemberCardType:
	    10:ID:身份证
20:PASSPORT:护照
30:HKPASS:港澳通行证 
		*/
		@Column(name="icardtype")
		public Integer getIcardtype() {
			return  icardtype;//证件类型 int
		}
		/**
		证件类型 int
	    MemberCardType:
	    10:ID:身份证
20:PASSPORT:护照
30:HKPASS:港澳通行证 
		*/
		public void setIcardtype(Integer  icardtype) {
			this.icardtype =  icardtype;//证件类型 int
		}
	   /**
		社会统一信用代码 String
		*/
		@Column(name="ssocialcreditno",length=100)
		public String getSsocialcreditno() {
			return  ssocialcreditno;//社会统一信用代码 String
		}
		/**
		社会统一信用代码 String
		*/
		public void setSsocialcreditno(String  ssocialcreditno) {
			this.ssocialcreditno =  ssocialcreditno;//社会统一信用代码 String
		}
	   /**
		业务类型 int
	    BizType:
	    0:JJGLR:基金管理人
1:CTJJ:创投基金
 
		*/
		@Column(name="ibiztype")
		public Integer getIbiztype() {
			return  ibiztype;//业务类型 int
		}
		/**
		业务类型 int
	    BizType:
	    0:JJGLR:基金管理人
1:CTJJ:创投基金
 
		*/
		public void setIbiztype(Integer  ibiztype) {
			this.ibiztype =  ibiztype;//业务类型 int
		}
	   /**
		姓名 String
		*/
		@Column(name="sname",length=50)
		public String getSname() {
			return  sname;//姓名 String
		}
		/**
		姓名 String
		*/
		public void setSname(String  sname) {
			this.sname =  sname;//姓名 String
		}
	   /**
		证件号 String
		*/
		@Column(name="scardno",length=100)
		public String getScardno() {
			return  scardno;//证件号 String
		}
		/**
		证件号 String
		*/
		public void setScardno(String  scardno) {
			this.scardno =  scardno;//证件号 String
		}
	   /**
		实际控制人姓名 String
		*/
		@Column(name="skzrname",length=50)
		public String getSkzrname() {
			return  skzrname;//实际控制人姓名 String
		}
		/**
		实际控制人姓名 String
		*/
		public void setSkzrname(String  skzrname) {
			this.skzrname =  skzrname;//实际控制人姓名 String
		}
	   /**
		控制人证件类型 int
	    MemberCardType:
	    10:ID:身份证
20:PASSPORT:护照
30:HKPASS:港澳通行证 
		*/
		@Column(name="ikrzcardtype")
		public Integer getIkrzcardtype() {
			return  ikrzcardtype;//控制人证件类型 int
		}
		/**
		控制人证件类型 int
	    MemberCardType:
	    10:ID:身份证
20:PASSPORT:护照
30:HKPASS:港澳通行证 
		*/
		public void setIkrzcardtype(Integer  ikrzcardtype) {
			this.ikrzcardtype =  ikrzcardtype;//控制人证件类型 int
		}
	   /**
		控制人证件号 String
		*/
		@Column(name="skzrcardno",length=100)
		public String getSkzrcardno() {
			return  skzrcardno;//控制人证件号 String
		}
		/**
		控制人证件号 String
		*/
		public void setSkzrcardno(String  skzrcardno) {
			this.skzrcardno =  skzrcardno;//控制人证件号 String
		}
	   /**
		状态 int
	    CheckStatus:
	    0 :WAIT:审核中
1: CHECKED:审核通过
2 :REJECT:审核驳回
 
		*/
		@Column(name="istatus")
		public Integer getIstatus() {
			return  istatus;//状态 int
		}
		/**
		状态 int
	    CheckStatus:
	    0 :WAIT:审核中
1: CHECKED:审核通过
2 :REJECT:审核驳回
 
		*/
		public void setIstatus(Integer  istatus) {
			this.istatus =  istatus;//状态 int
		}
	   /**
		审核人 String
		*/
		@Column(name="scheckuser",length=50)
		public String getScheckuser() {
			return  scheckuser;//审核人 String
		}
		/**
		审核人 String
		*/
		public void setScheckuser(String  scheckuser) {
			this.scheckuser =  scheckuser;//审核人 String
		}
	   /**
		审核日期 Date
		*/
		@Column(name="dcheckdate")
		public Date getDcheckdate() {
			return  dcheckdate;//审核日期 Date
		}
		/**
		审核日期 Date
		*/
		public void setDcheckdate(Date  dcheckdate) {
			this.dcheckdate =  dcheckdate;//审核日期 Date
		}
	   /**
		审核意见 String
		*/
		@Column(name="scheckinfo",length=2000)
		public String getScheckinfo() {
			return  scheckinfo;//审核意见 String
		}
		/**
		审核意见 String
		*/
		public void setScheckinfo(String  scheckinfo) {
			this.scheckinfo =  scheckinfo;//审核意见 String
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
		@Column(name="sadduser",length=50)
		public String getSadduser() {
			return  sadduser;//添加人 String
		}
		/**
		添加人 String
		*/
		public void setSadduser(String  sadduser) {
			this.sadduser =  sadduser;//添加人 String
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
		等级 int
	    RiskLevel:
	    0:YX:优秀
1:LH:良好
2:XC:瑕疵
3:FX:风险
 
		*/
		@Column(name="irisklevel")
		public Integer getIrisklevel() {
			return  irisklevel;//等级 int
		}
		/**
		等级 int
	    RiskLevel:
	    0:YX:优秀
1:LH:良好
2:XC:瑕疵
3:FX:风险
 
		*/
		public void setIrisklevel(Integer  irisklevel) {
			this.irisklevel =  irisklevel;//等级 int
		}
	   /**
		整体评分 double
		*/
		@Column(name="fscore")
		public Double getFscore() {
			return  fscore;//整体评分 double
		}
		/**
		整体评分 double
		*/
		public void setFscore(Double  fscore) {
			this.fscore =  fscore;//整体评分 double
		}
	   /**
		机构自身评分 double
		*/
		@Column(name="fjgscore")
		public Double getFjgscore() {
			return  fjgscore;//机构自身评分 double
		}
		/**
		机构自身评分 double
		*/
		public void setFjgscore(Double  fjgscore) {
			this.fjgscore =  fjgscore;//机构自身评分 double
		}
	   /**
		核心人员评分 double
		*/
		@Column(name="fhxscore")
		public Double getFhxscore() {
			return  fhxscore;//核心人员评分 double
		}
		/**
		核心人员评分 double
		*/
		public void setFhxscore(Double  fhxscore) {
			this.fhxscore =  fhxscore;//核心人员评分 double
		}
	   /**
		关联企业评分 double
		*/
		@Column(name="fglqyscore")
		public Double getFglqyscore() {
			return  fglqyscore;//关联企业评分 double
		}
		/**
		关联企业评分 double
		*/
		public void setFglqyscore(Double  fglqyscore) {
			this.fglqyscore =  fglqyscore;//关联企业评分 double
		}
	   /**
		在管基金评分 double
		*/
		@Column(name="fzgjjscore")
		public Double getFzgjjscore() {
			return  fzgjjscore;//在管基金评分 double
		}
		/**
		在管基金评分 double
		*/
		public void setFzgjjscore(Double  fzgjjscore) {
			this.fzgjjscore =  fzgjjscore;//在管基金评分 double
		}
	   /**
		未备案企业 double
		*/
		@Column(name="fwbascore")
		public Double getFwbascore() {
			return  fwbascore;//未备案企业 double
		}
		/**
		未备案企业 double
		*/
		public void setFwbascore(Double  fwbascore) {
			this.fwbascore =  fwbascore;//未备案企业 double
		}
	   /**
		管理人合规性 double
		*/
		@Column(name="fglrscore")
		public Double getFglrscore() {
			return  fglrscore;//管理人合规性 double
		}
		/**
		管理人合规性 double
		*/
		public void setFglrscore(Double  fglrscore) {
			this.fglrscore =  fglrscore;//管理人合规性 double
		}
	   /**
		基金运作情况 double
		*/
		@Column(name="fjjyzscore")
		public Double getFjjyzscore() {
			return  fjjyzscore;//基金运作情况 double
		}
		/**
		基金运作情况 double
		*/
		public void setFjjyzscore(Double  fjjyzscore) {
			this.fjjyzscore =  fjjyzscore;//基金运作情况 double
		}
	   /**
		预警数 double
		*/
		@Column(name="fwarnnum")
		public Double getFwarnnum() {
			return  fwarnnum;//预警数 double
		}
		/**
		预警数 double
		*/
		public void setFwarnnum(Double  fwarnnum) {
			this.fwarnnum =  fwarnnum;//预警数 double
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
