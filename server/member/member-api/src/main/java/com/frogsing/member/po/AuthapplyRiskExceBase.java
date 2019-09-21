package com.frogsing.member.po;

//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "hy_authapplyriskexce")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class AuthapplyRiskExceBase  extends  BaseEntity{
	
	private   String sriskdetailid; //ID String
	private   Integer iexceptiontype=0; //类型 int
	private   String scontent; //内容 String
	private   String sremark; //备注 String
	   /**
		ID String
		*/
		@Column(name="sriskdetailid",length=32)
		public String getSriskdetailid() {
			return  sriskdetailid;//ID String
		}
		/**
		ID String
		*/
		public void setSriskdetailid(String  sriskdetailid) {
			this.sriskdetailid =  sriskdetailid;//ID String
		}
	   /**
		类型 int
	    ExceptionType:
	    0:SFYC:司法异常
1:XZCF:行政处罚
2:JYQK:经营情况
3:SSQK:涉诉情况
4:PLYC:披露异常
5:QSYC:清算异常
6:KYJY:可疑交易
 
		*/
		@Column(name="iexceptiontype")
		public Integer getIexceptiontype() {
			return  iexceptiontype;//类型 int
		}
		/**
		类型 int
	    ExceptionType:
	    0:SFYC:司法异常
1:XZCF:行政处罚
2:JYQK:经营情况
3:SSQK:涉诉情况
4:PLYC:披露异常
5:QSYC:清算异常
6:KYJY:可疑交易
 
		*/
		public void setIexceptiontype(Integer  iexceptiontype) {
			this.iexceptiontype =  iexceptiontype;//类型 int
		}
	   /**
		内容 String
		*/
		@Column(name="scontent",length=4000)
		public String getScontent() {
			return  scontent;//内容 String
		}
		/**
		内容 String
		*/
		public void setScontent(String  scontent) {
			this.scontent =  scontent;//内容 String
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
	
	//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
