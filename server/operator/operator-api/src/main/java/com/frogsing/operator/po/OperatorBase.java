package com.frogsing.operator.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "op_operator")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class OperatorBase  extends  BaseEntity{
	
	private   String soperatorno; //管理员编号 String
	private   String susername; //用户名 String
	private   String spassword; //密码 String
	private   String sdepartmentid; //部门ID String
	private   String srealname; //真实姓名 String
	private   String smobile; //手机 String
	private   String sphone; //联系电话 String
	private   String sqq; //联系QQ String
	private   String semail; //邮箱 String
	private   Integer bisfreeze=0; //是否禁用 int
	private   Integer bisadmin=0; //是否管理员 int
	private   Integer bisdelete=0; //是否删除 int
	private   Integer bisservice=0; //是否客服 int
	private   Date dlastlogintime; //上次登陆时间 Date
	private   Date dendlogintime; //最后登陆时间 Date
	private   Date dadddate; //添加日期 Date
	private   String saddoperator; //添加人 String
	private   Date dmodifydate; //修改日期 Date
	private   String smodifyoperator; //修改人 String
	private   String sjpname; //简拼名 String
	private   String spyname; //全拼名 String
	private   Integer isex=0; //性别 int
	private   String swarehouseid; //分库id String
	private   Integer ilastterminaltype=0; //最后登录APP终端 int
	private   String slastterminalid; //终端ID String
	private   Integer ioperatortype=0; //类型 int
	   /**
		管理员编号 String
		*/
		@Column(name="soperatorno",length=50)
		public String getSoperatorno() {
			return  soperatorno;//管理员编号 String
		}
		/**
		管理员编号 String
		*/
		public void setSoperatorno(String  soperatorno) {
			this.soperatorno =  soperatorno;//管理员编号 String
		}
	   /**
		用户名 String
		*/
		@Column(name="susername",length=50)
		public String getSusername() {
			return  susername;//用户名 String
		}
		/**
		用户名 String
		*/
		public void setSusername(String  susername) {
			this.susername =  susername;//用户名 String
		}
	   /**
		密码 String
		*/
		@Column(name="spassword",length=50)
		public String getSpassword() {
			return  spassword;//密码 String
		}
		/**
		密码 String
		*/
		public void setSpassword(String  spassword) {
			this.spassword =  spassword;//密码 String
		}
	   /**
		部门ID String
		*/
		@Column(name="sdepartmentid",length=32)
		public String getSdepartmentid() {
			return  sdepartmentid;//部门ID String
		}
		/**
		部门ID String
		*/
		public void setSdepartmentid(String  sdepartmentid) {
			this.sdepartmentid =  sdepartmentid;//部门ID String
		}
	   /**
		真实姓名 String
		*/
		@Column(name="srealname",length=50)
		public String getSrealname() {
			return  srealname;//真实姓名 String
		}
		/**
		真实姓名 String
		*/
		public void setSrealname(String  srealname) {
			this.srealname =  srealname;//真实姓名 String
		}
	   /**
		手机 String
		*/
		@Column(name="smobile",length=20)
		public String getSmobile() {
			return  smobile;//手机 String
		}
		/**
		手机 String
		*/
		public void setSmobile(String  smobile) {
			this.smobile =  smobile;//手机 String
		}
	   /**
		联系电话 String
		*/
		@Column(name="sphone",length=20)
		public String getSphone() {
			return  sphone;//联系电话 String
		}
		/**
		联系电话 String
		*/
		public void setSphone(String  sphone) {
			this.sphone =  sphone;//联系电话 String
		}
	   /**
		联系QQ String
		*/
		@Column(name="sqq",length=50)
		public String getSqq() {
			return  sqq;//联系QQ String
		}
		/**
		联系QQ String
		*/
		public void setSqq(String  sqq) {
			this.sqq =  sqq;//联系QQ String
		}
	   /**
		邮箱 String
		*/
		@Column(name="semail",length=100)
		public String getSemail() {
			return  semail;//邮箱 String
		}
		/**
		邮箱 String
		*/
		public void setSemail(String  semail) {
			this.semail =  semail;//邮箱 String
		}
	   /**
		是否禁用 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisfreeze")
		public Integer getBisfreeze() {
			return  bisfreeze;//是否禁用 int
		}
		/**
		是否禁用 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisfreeze(Integer  bisfreeze) {
			this.bisfreeze =  bisfreeze;//是否禁用 int
		}
	   /**
		是否管理员 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisadmin")
		public Integer getBisadmin() {
			return  bisadmin;//是否管理员 int
		}
		/**
		是否管理员 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisadmin(Integer  bisadmin) {
			this.bisadmin =  bisadmin;//是否管理员 int
		}
	   /**
		是否删除 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisdelete")
		public Integer getBisdelete() {
			return  bisdelete;//是否删除 int
		}
		/**
		是否删除 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisdelete(Integer  bisdelete) {
			this.bisdelete =  bisdelete;//是否删除 int
		}
	   /**
		是否客服 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisservice")
		public Integer getBisservice() {
			return  bisservice;//是否客服 int
		}
		/**
		是否客服 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisservice(Integer  bisservice) {
			this.bisservice =  bisservice;//是否客服 int
		}
	   /**
		上次登陆时间 Date
		*/
		@Column(name="dlastlogintime")
		public Date getDlastlogintime() {
			return  dlastlogintime;//上次登陆时间 Date
		}
		/**
		上次登陆时间 Date
		*/
		public void setDlastlogintime(Date  dlastlogintime) {
			this.dlastlogintime =  dlastlogintime;//上次登陆时间 Date
		}
	   /**
		最后登陆时间 Date
		*/
		@Column(name="dendlogintime")
		public Date getDendlogintime() {
			return  dendlogintime;//最后登陆时间 Date
		}
		/**
		最后登陆时间 Date
		*/
		public void setDendlogintime(Date  dendlogintime) {
			this.dendlogintime =  dendlogintime;//最后登陆时间 Date
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
		简拼名 String
		*/
		@Column(name="sjpname",length=50)
		public String getSjpname() {
			return  sjpname;//简拼名 String
		}
		/**
		简拼名 String
		*/
		public void setSjpname(String  sjpname) {
			this.sjpname =  sjpname;//简拼名 String
		}
	   /**
		全拼名 String
		*/
		@Column(name="spyname",length=100)
		public String getSpyname() {
			return  spyname;//全拼名 String
		}
		/**
		全拼名 String
		*/
		public void setSpyname(String  spyname) {
			this.spyname =  spyname;//全拼名 String
		}
	   /**
		性别 int
	    Sex:
	    0:MAN:男
1:WOMAN:女 
		*/
		@Column(name="isex")
		public Integer getIsex() {
			return  isex;//性别 int
		}
		/**
		性别 int
	    Sex:
	    0:MAN:男
1:WOMAN:女 
		*/
		public void setIsex(Integer  isex) {
			this.isex =  isex;//性别 int
		}
	   /**
		分库id String
		*/
		@Column(name="swarehouseid",length=32)
		public String getSwarehouseid() {
			return  swarehouseid;//分库id String
		}
		/**
		分库id String
		*/
		public void setSwarehouseid(String  swarehouseid) {
			this.swarehouseid =  swarehouseid;//分库id String
		}
	   /**
		最后登录APP终端 int
	    AppTerminalType:
	    0:None:无APP登录
10:IOS_PHONE:苹果手机
11:IOS_PAD:苹果平板
20:Android_Phone:安卓手机
21:Android_Pad:安卓平板
90:Other:其它 
		*/
		@Column(name="ilastterminaltype")
		public Integer getIlastterminaltype() {
			return  ilastterminaltype;//最后登录APP终端 int
		}
		/**
		最后登录APP终端 int
	    AppTerminalType:
	    0:None:无APP登录
10:IOS_PHONE:苹果手机
11:IOS_PAD:苹果平板
20:Android_Phone:安卓手机
21:Android_Pad:安卓平板
90:Other:其它 
		*/
		public void setIlastterminaltype(Integer  ilastterminaltype) {
			this.ilastterminaltype =  ilastterminaltype;//最后登录APP终端 int
		}
	   /**
		终端ID String
		*/
		@Column(name="slastterminalid",length=50)
		public String getSlastterminalid() {
			return  slastterminalid;//终端ID String
		}
		/**
		终端ID String
		*/
		public void setSlastterminalid(String  slastterminalid) {
			this.slastterminalid =  slastterminalid;//终端ID String
		}
	   /**
		类型 int
	    OperatorType:
	    10:ZDBSC:街道办事处
20:GSSPK:工商审批科
30:JRGLJ:金融管理局
40:ZSJF:招商机构 
		*/
		@Column(name="ioperatortype")
		public Integer getIoperatortype() {
			return  ioperatortype;//类型 int
		}
		/**
		类型 int
	    OperatorType:
	    10:ZDBSC:街道办事处
20:GSSPK:工商审批科
30:JRGLJ:金融管理局
40:ZSJF:招商机构 
		*/
		public void setIoperatortype(Integer  ioperatortype) {
			this.ioperatortype =  ioperatortype;//类型 int
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
