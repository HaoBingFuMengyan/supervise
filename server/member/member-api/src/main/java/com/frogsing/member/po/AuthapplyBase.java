package com.frogsing.member.po;
//frogsingcode//


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import com.frogsing.heart.entity.BaseEntity;
//frogsingcode//
//@Entity
//@Table(name = "hy_authapply")
//frogsingcode//
//frogsingcode//
@MappedSuperclass
public class AuthapplyBase  extends  BaseEntity{
	
	private   String smemberid; //会员ID String
	private   String smemberno; //会员编号 String
	private   String sapplyuserid; //申请人 String
	private   String scnname; //企业名称 String
	private   String senname; //英文名称 String
	private   String sshortname; //中文简称 String
	private   Long icredit=0l; //信用值 int
	private   Integer icompanytype=0; //公司类型 int
	private   Integer imembertype=0; //会员类型 int
	private   String sbusinessmode; //经营模式 String
	private   String smemberkind; //企业性质 String
	private   String sbusinessno; //营业执照副本 String
	private   String sorgcode; //组织机构代码 String
	private   String slegalpersoncode; //法人代表身份证号码 String
	private   String sopenbank; //开户银行 String
	private   String sopenname; //开户名称 String
	private   String sopenaccount; //开户账号 String
	private   String sunionaccount; //联行号 String
	private   String staxno; //税务登记证副本 String
	private   String slegalperson; //法人 String
	private   Long iemployeeamount; //员工人数 int
	private   String scountry; //国家 String
	private   String sareaid; //地区区号 String
	private   String sprovince; //省份 String
	private   String scity; //城市 String
	private   String sregion; //区县 String
	private   String sregmoneytype; //注册资金货币种类 String
	private   Long iregmoney; //注册资金 int
	private   String sfax; //传真 String
	private   String sbusbigtype; //主营行业大类 String
	private   String sbussmalltype; //主营行业小类 String
	private   String sbussmallname; //主营小类名称 String
	private   String sregaddress; //注册地址 String
	private   String sbusaddress; //经营地址 String
	private   String slinkman; //联系人 String
	private   String szipcode; //邮编 String
	private   String sphone; //电话 String
	private   String smobile; //手机 String
	private   String semail; //Email String
	private   String scompanydesc; //公司简介 String
	private   Integer istatus=0; //状态 int
	private   Date dapplydate; //申请日期 Date
	private   String scheckuser; //审核人 String
	private   Date dcheckdate; //审核日期 Date
	private   String scheckinfo; //审核意见 String
	private   String sremark; //备注 String
	private   Date dadddate; //添加日期 Date
	private   String sadduser; //添加人 String
	private   Date dmodifydate; //修改日期 Date
	private   String smodifyoperator; //修改人 String
	private   String sshortnamejpname; //简称简拼名 String
	private   String sshortnamepyname; //简称全拼名 String
	private   String sjpname; //简拼名 String
	private   String spyname; //全拼名 String
	private   Integer iapplytype=0; //申请认证类型 int
	private   Integer iauthtype=0; //认证类型 int
	private   String scardup; //身份证正面 String
	private   String scarddown; //身份证反面 String
	private   Long iintegralavailable; //当前可用积分 int
	private   Long iintegralamount; //总积分 int
	private   Long iintegralused; //已兑换积分 int
	private   Long isort=0l; //排序号 int
	private   String slocation; //地理位置 String
	private   Integer bisstop=0; //是否营业 int
	private   Integer bisselfsaler=0; //是否自营 int
	private   Integer biscardmerged=0; //是否三码合一 int
	private   Integer bisone=0; //是否三证合一 int
	private   String ssocialcreditno; //统一社会信息用代码 String
	private   Integer ilegaltype=0; //执行董事证件类型 int
	private   Integer bisjoblegal=0; //执行董事是否兼职 int
	private   String smanagername; //公司经理姓名 String
	private   String smanagerno; //公司经理证件号 String
	private   Integer imanagertype=0; //公司经理证件类型 int
	private   Integer bisjobmanager=0; //公司经理是否兼职 int
	private   Integer icorporatetype=0; //法定代表人 int
	private   Integer icorbiztype=0; //企业业务类型 int
	private   Integer iapprovalstatus=0; //审核状态 int
	private   String sriskresult; //风险监测报告结果 String
	private   String srisktext; //风险监测报告内文 String
	private   String scnuno; //承诺函 String
	private   String sgxrtno; //关系人控制图 String
	private   String sfdlinkman; //法定/委派联系人 String
	private   String sfdsmobile; //法定/委派手机号 String
	private   String sfdemail; //法定/委派邮箱 String
	private   String skzrlinkman; //控制人联系人 String
	private   String skzrsmobile; //控制人手机 String
	private   String skzremail; //控制人邮箱 String
	private   Integer iprocess=0; //审批流 int
	private   Integer bisincompany=0; //是否入住企业 int
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
		会员编号 String
		*/
		@Column(name="smemberno",length=50)
		public String getSmemberno() {
			return  smemberno;//会员编号 String
		}
		/**
		会员编号 String
		*/
		public void setSmemberno(String  smemberno) {
			this.smemberno =  smemberno;//会员编号 String
		}
	   /**
		申请人 String
		*/
		@Column(name="sapplyuserid",length=32)
		public String getSapplyuserid() {
			return  sapplyuserid;//申请人 String
		}
		/**
		申请人 String
		*/
		public void setSapplyuserid(String  sapplyuserid) {
			this.sapplyuserid =  sapplyuserid;//申请人 String
		}
	   /**
		企业名称 String
		*/
		@Column(name="scnname",length=100)
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
		英文名称 String
		*/
		@Column(name="senname",length=50)
		public String getSenname() {
			return  senname;//英文名称 String
		}
		/**
		英文名称 String
		*/
		public void setSenname(String  senname) {
			this.senname =  senname;//英文名称 String
		}
	   /**
		中文简称 String
		*/
		@Column(name="sshortname",length=50)
		public String getSshortname() {
			return  sshortname;//中文简称 String
		}
		/**
		中文简称 String
		*/
		public void setSshortname(String  sshortname) {
			this.sshortname =  sshortname;//中文简称 String
		}
	   /**
		信用值 int
		*/
		@Column(name="icredit")
		public Long getIcredit() {
			return  icredit;//信用值 int
		}
		/**
		信用值 int
		*/
		public void setIcredit(Long  icredit) {
			this.icredit =  icredit;//信用值 int
		}
	   /**
		公司类型 int
	    CompanyType:
	    0:PRODUCTIVE:生产型
1:PROCESSING:加工型
2:TRADE:贸易型 
		*/
		@Column(name="icompanytype")
		public Integer getIcompanytype() {
			return  icompanytype;//公司类型 int
		}
		/**
		公司类型 int
	    CompanyType:
	    0:PRODUCTIVE:生产型
1:PROCESSING:加工型
2:TRADE:贸易型 
		*/
		public void setIcompanytype(Integer  icompanytype) {
			this.icompanytype =  icompanytype;//公司类型 int
		}
	   /**
		会员类型 int
	    MemberType:
	    0:EXCHANGE:交易中心
1:MEMBER:交易会员
2:Chain:供应链会员
3:ZIFANG:资方
 
		*/
		@Column(name="imembertype")
		public Integer getImembertype() {
			return  imembertype;//会员类型 int
		}
		/**
		会员类型 int
	    MemberType:
	    0:EXCHANGE:交易中心
1:MEMBER:交易会员
2:Chain:供应链会员
3:ZIFANG:资方
 
		*/
		public void setImembertype(Integer  imembertype) {
			this.imembertype =  imembertype;//会员类型 int
		}
	   /**
		经营模式 String
		*/
		@Column(name="sbusinessmode",length=50)
		public String getSbusinessmode() {
			return  sbusinessmode;//经营模式 String
		}
		/**
		经营模式 String
		*/
		public void setSbusinessmode(String  sbusinessmode) {
			this.sbusinessmode =  sbusinessmode;//经营模式 String
		}
	   /**
		企业性质 String
		*/
		@Column(name="smemberkind",length=50)
		public String getSmemberkind() {
			return  smemberkind;//企业性质 String
		}
		/**
		企业性质 String
		*/
		public void setSmemberkind(String  smemberkind) {
			this.smemberkind =  smemberkind;//企业性质 String
		}
	   /**
		营业执照副本 String
		*/
		@Column(name="sbusinessno",length=300)
		public String getSbusinessno() {
			return  sbusinessno;//营业执照副本 String
		}
		/**
		营业执照副本 String
		*/
		public void setSbusinessno(String  sbusinessno) {
			this.sbusinessno =  sbusinessno;//营业执照副本 String
		}
	   /**
		组织机构代码 String
		*/
		@Column(name="sorgcode",length=50)
		public String getSorgcode() {
			return  sorgcode;//组织机构代码 String
		}
		/**
		组织机构代码 String
		*/
		public void setSorgcode(String  sorgcode) {
			this.sorgcode =  sorgcode;//组织机构代码 String
		}
	   /**
		法人代表身份证号码 String
		*/
		@Column(name="slegalpersoncode",length=50)
		public String getSlegalpersoncode() {
			return  slegalpersoncode;//法人代表身份证号码 String
		}
		/**
		法人代表身份证号码 String
		*/
		public void setSlegalpersoncode(String  slegalpersoncode) {
			this.slegalpersoncode =  slegalpersoncode;//法人代表身份证号码 String
		}
	   /**
		开户银行 String
		*/
		@Column(name="sopenbank",length=50)
		public String getSopenbank() {
			return  sopenbank;//开户银行 String
		}
		/**
		开户银行 String
		*/
		public void setSopenbank(String  sopenbank) {
			this.sopenbank =  sopenbank;//开户银行 String
		}
	   /**
		开户名称 String
		*/
		@Column(name="sopenname",length=50)
		public String getSopenname() {
			return  sopenname;//开户名称 String
		}
		/**
		开户名称 String
		*/
		public void setSopenname(String  sopenname) {
			this.sopenname =  sopenname;//开户名称 String
		}
	   /**
		开户账号 String
		*/
		@Column(name="sopenaccount",length=50)
		public String getSopenaccount() {
			return  sopenaccount;//开户账号 String
		}
		/**
		开户账号 String
		*/
		public void setSopenaccount(String  sopenaccount) {
			this.sopenaccount =  sopenaccount;//开户账号 String
		}
	   /**
		联行号 String
		*/
		@Column(name="sunionaccount",length=50)
		public String getSunionaccount() {
			return  sunionaccount;//联行号 String
		}
		/**
		联行号 String
		*/
		public void setSunionaccount(String  sunionaccount) {
			this.sunionaccount =  sunionaccount;//联行号 String
		}
	   /**
		税务登记证副本 String
		*/
		@Column(name="staxno",length=50)
		public String getStaxno() {
			return  staxno;//税务登记证副本 String
		}
		/**
		税务登记证副本 String
		*/
		public void setStaxno(String  staxno) {
			this.staxno =  staxno;//税务登记证副本 String
		}
	   /**
		法人 String
		*/
		@Column(name="slegalperson",length=50)
		public String getSlegalperson() {
			return  slegalperson;//法人 String
		}
		/**
		法人 String
		*/
		public void setSlegalperson(String  slegalperson) {
			this.slegalperson =  slegalperson;//法人 String
		}
	   /**
		员工人数 int
		*/
		@Column(name="iemployeeamount")
		public Long getIemployeeamount() {
			return  iemployeeamount;//员工人数 int
		}
		/**
		员工人数 int
		*/
		public void setIemployeeamount(Long  iemployeeamount) {
			this.iemployeeamount =  iemployeeamount;//员工人数 int
		}
	   /**
		国家 String
		*/
		@Column(name="scountry",length=50)
		public String getScountry() {
			return  scountry;//国家 String
		}
		/**
		国家 String
		*/
		public void setScountry(String  scountry) {
			this.scountry =  scountry;//国家 String
		}
	   /**
		地区区号 String
		*/
		@Column(name="sareaid",length=30)
		public String getSareaid() {
			return  sareaid;//地区区号 String
		}
		/**
		地区区号 String
		*/
		public void setSareaid(String  sareaid) {
			this.sareaid =  sareaid;//地区区号 String
		}
	   /**
		省份 String
		*/
		@Column(name="sprovince",length=50)
		public String getSprovince() {
			return  sprovince;//省份 String
		}
		/**
		省份 String
		*/
		public void setSprovince(String  sprovince) {
			this.sprovince =  sprovince;//省份 String
		}
	   /**
		城市 String
		*/
		@Column(name="scity",length=50)
		public String getScity() {
			return  scity;//城市 String
		}
		/**
		城市 String
		*/
		public void setScity(String  scity) {
			this.scity =  scity;//城市 String
		}
	   /**
		区县 String
		*/
		@Column(name="sregion",length=50)
		public String getSregion() {
			return  sregion;//区县 String
		}
		/**
		区县 String
		*/
		public void setSregion(String  sregion) {
			this.sregion =  sregion;//区县 String
		}
	   /**
		注册资金货币种类 String
		*/
		@Column(name="sregmoneytype",length=50)
		public String getSregmoneytype() {
			return  sregmoneytype;//注册资金货币种类 String
		}
		/**
		注册资金货币种类 String
		*/
		public void setSregmoneytype(String  sregmoneytype) {
			this.sregmoneytype =  sregmoneytype;//注册资金货币种类 String
		}
	   /**
		注册资金 int
		*/
		@Column(name="iregmoney")
		public Long getIregmoney() {
			return  iregmoney;//注册资金 int
		}
		/**
		注册资金 int
		*/
		public void setIregmoney(Long  iregmoney) {
			this.iregmoney =  iregmoney;//注册资金 int
		}
	   /**
		传真 String
		*/
		@Column(name="sfax",length=30)
		public String getSfax() {
			return  sfax;//传真 String
		}
		/**
		传真 String
		*/
		public void setSfax(String  sfax) {
			this.sfax =  sfax;//传真 String
		}
	   /**
		主营行业大类 String
		*/
		@Column(name="sbusbigtype",length=500)
		public String getSbusbigtype() {
			return  sbusbigtype;//主营行业大类 String
		}
		/**
		主营行业大类 String
		*/
		public void setSbusbigtype(String  sbusbigtype) {
			this.sbusbigtype =  sbusbigtype;//主营行业大类 String
		}
	   /**
		主营行业小类 String
		*/
		@Column(name="sbussmalltype",length=2000)
		public String getSbussmalltype() {
			return  sbussmalltype;//主营行业小类 String
		}
		/**
		主营行业小类 String
		*/
		public void setSbussmalltype(String  sbussmalltype) {
			this.sbussmalltype =  sbussmalltype;//主营行业小类 String
		}
	   /**
		主营小类名称 String
		*/
		@Column(name="sbussmallname",length=2000)
		public String getSbussmallname() {
			return  sbussmallname;//主营小类名称 String
		}
		/**
		主营小类名称 String
		*/
		public void setSbussmallname(String  sbussmallname) {
			this.sbussmallname =  sbussmallname;//主营小类名称 String
		}
	   /**
		注册地址 String
		*/
		@Column(name="sregaddress",length=300)
		public String getSregaddress() {
			return  sregaddress;//注册地址 String
		}
		/**
		注册地址 String
		*/
		public void setSregaddress(String  sregaddress) {
			this.sregaddress =  sregaddress;//注册地址 String
		}
	   /**
		经营地址 String
		*/
		@Column(name="sbusaddress",length=200)
		public String getSbusaddress() {
			return  sbusaddress;//经营地址 String
		}
		/**
		经营地址 String
		*/
		public void setSbusaddress(String  sbusaddress) {
			this.sbusaddress =  sbusaddress;//经营地址 String
		}
	   /**
		联系人 String
		*/
		@Column(name="slinkman",length=100)
		public String getSlinkman() {
			return  slinkman;//联系人 String
		}
		/**
		联系人 String
		*/
		public void setSlinkman(String  slinkman) {
			this.slinkman =  slinkman;//联系人 String
		}
	   /**
		邮编 String
		*/
		@Column(name="szipcode",length=10)
		public String getSzipcode() {
			return  szipcode;//邮编 String
		}
		/**
		邮编 String
		*/
		public void setSzipcode(String  szipcode) {
			this.szipcode =  szipcode;//邮编 String
		}
	   /**
		电话 String
		*/
		@Column(name="sphone",length=20)
		public String getSphone() {
			return  sphone;//电话 String
		}
		/**
		电话 String
		*/
		public void setSphone(String  sphone) {
			this.sphone =  sphone;//电话 String
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
		Email String
		*/
		@Column(name="semail",length=100)
		public String getSemail() {
			return  semail;//Email String
		}
		/**
		Email String
		*/
		public void setSemail(String  semail) {
			this.semail =  semail;//Email String
		}
	   /**
		公司简介 String
		*/
		@Column(name="scompanydesc",length=4000)
		public String getScompanydesc() {
			return  scompanydesc;//公司简介 String
		}
		/**
		公司简介 String
		*/
		public void setScompanydesc(String  scompanydesc) {
			this.scompanydesc =  scompanydesc;//公司简介 String
		}
	   /**
		状态 int
	    CheckStatus:
	    0 :WAIT:待审核
1: CHECKED:审核通过
2 :REJECT:被拒绝
 
		*/
		@Column(name="istatus")
		public Integer getIstatus() {
			return  istatus;//状态 int
		}
		/**
		状态 int
	    CheckStatus:
	    0 :WAIT:待审核
1: CHECKED:审核通过
2 :REJECT:被拒绝
 
		*/
		public void setIstatus(Integer  istatus) {
			this.istatus =  istatus;//状态 int
		}
	   /**
		申请日期 Date
		*/
		@Column(name="dapplydate")
		public Date getDapplydate() {
			return  dapplydate;//申请日期 Date
		}
		/**
		申请日期 Date
		*/
		public void setDapplydate(Date  dapplydate) {
			this.dapplydate =  dapplydate;//申请日期 Date
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
		简称简拼名 String
		*/
		@Column(name="sshortnamejpname",length=50)
		public String getSshortnamejpname() {
			return  sshortnamejpname;//简称简拼名 String
		}
		/**
		简称简拼名 String
		*/
		public void setSshortnamejpname(String  sshortnamejpname) {
			this.sshortnamejpname =  sshortnamejpname;//简称简拼名 String
		}
	   /**
		简称全拼名 String
		*/
		@Column(name="sshortnamepyname",length=100)
		public String getSshortnamepyname() {
			return  sshortnamepyname;//简称全拼名 String
		}
		/**
		简称全拼名 String
		*/
		public void setSshortnamepyname(String  sshortnamepyname) {
			this.sshortnamepyname =  sshortnamepyname;//简称全拼名 String
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
		申请认证类型 int
	    AuthenticateType:
	    0:No:注册会员
10:PERSONAL:个人认证
20:Company:企业认证 
		*/
		@Column(name="iapplytype")
		public Integer getIapplytype() {
			return  iapplytype;//申请认证类型 int
		}
		/**
		申请认证类型 int
	    AuthenticateType:
	    0:No:注册会员
10:PERSONAL:个人认证
20:Company:企业认证 
		*/
		public void setIapplytype(Integer  iapplytype) {
			this.iapplytype =  iapplytype;//申请认证类型 int
		}
	   /**
		认证类型 int
	    AuthenticateType:
	    0:No:注册会员
10:PERSONAL:个人认证
20:Company:企业认证 
		*/
		@Column(name="iauthtype")
		public Integer getIauthtype() {
			return  iauthtype;//认证类型 int
		}
		/**
		认证类型 int
	    AuthenticateType:
	    0:No:注册会员
10:PERSONAL:个人认证
20:Company:企业认证 
		*/
		public void setIauthtype(Integer  iauthtype) {
			this.iauthtype =  iauthtype;//认证类型 int
		}
	   /**
		身份证正面 String
		*/
		@Column(name="scardup",length=200)
		public String getScardup() {
			return  scardup;//身份证正面 String
		}
		/**
		身份证正面 String
		*/
		public void setScardup(String  scardup) {
			this.scardup =  scardup;//身份证正面 String
		}
	   /**
		身份证反面 String
		*/
		@Column(name="scarddown",length=200)
		public String getScarddown() {
			return  scarddown;//身份证反面 String
		}
		/**
		身份证反面 String
		*/
		public void setScarddown(String  scarddown) {
			this.scarddown =  scarddown;//身份证反面 String
		}
	   /**
		当前可用积分 int
		*/
		@Column(name="iintegralavailable")
		public Long getIintegralavailable() {
			return  iintegralavailable;//当前可用积分 int
		}
		/**
		当前可用积分 int
		*/
		public void setIintegralavailable(Long  iintegralavailable) {
			this.iintegralavailable =  iintegralavailable;//当前可用积分 int
		}
	   /**
		总积分 int
		*/
		@Column(name="iintegralamount")
		public Long getIintegralamount() {
			return  iintegralamount;//总积分 int
		}
		/**
		总积分 int
		*/
		public void setIintegralamount(Long  iintegralamount) {
			this.iintegralamount =  iintegralamount;//总积分 int
		}
	   /**
		已兑换积分 int
		*/
		@Column(name="iintegralused")
		public Long getIintegralused() {
			return  iintegralused;//已兑换积分 int
		}
		/**
		已兑换积分 int
		*/
		public void setIintegralused(Long  iintegralused) {
			this.iintegralused =  iintegralused;//已兑换积分 int
		}
	   /**
		排序号 int
		*/
		@Column(name="isort")
		public Long getIsort() {
			return  isort;//排序号 int
		}
		/**
		排序号 int
		*/
		public void setIsort(Long  isort) {
			this.isort =  isort;//排序号 int
		}
	   /**
		地理位置 String
		*/
		@Column(name="slocation",length=300)
		public String getSlocation() {
			return  slocation;//地理位置 String
		}
		/**
		地理位置 String
		*/
		public void setSlocation(String  slocation) {
			this.slocation =  slocation;//地理位置 String
		}
	   /**
		是否营业 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisstop")
		public Integer getBisstop() {
			return  bisstop;//是否营业 int
		}
		/**
		是否营业 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisstop(Integer  bisstop) {
			this.bisstop =  bisstop;//是否营业 int
		}
	   /**
		是否自营 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisselfsaler")
		public Integer getBisselfsaler() {
			return  bisselfsaler;//是否自营 int
		}
		/**
		是否自营 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisselfsaler(Integer  bisselfsaler) {
			this.bisselfsaler =  bisselfsaler;//是否自营 int
		}
	   /**
		是否三码合一 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="biscardmerged")
		public Integer getBiscardmerged() {
			return  biscardmerged;//是否三码合一 int
		}
		/**
		是否三码合一 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBiscardmerged(Integer  biscardmerged) {
			this.biscardmerged =  biscardmerged;//是否三码合一 int
		}
	   /**
		是否三证合一 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisone")
		public Integer getBisone() {
			return  bisone;//是否三证合一 int
		}
		/**
		是否三证合一 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisone(Integer  bisone) {
			this.bisone =  bisone;//是否三证合一 int
		}
	   /**
		统一社会信息用代码 String
		*/
		@Column(name="ssocialcreditno",length=50)
		public String getSsocialcreditno() {
			return  ssocialcreditno;//统一社会信息用代码 String
		}
		/**
		统一社会信息用代码 String
		*/
		public void setSsocialcreditno(String  ssocialcreditno) {
			this.ssocialcreditno =  ssocialcreditno;//统一社会信息用代码 String
		}
	   /**
		执行董事证件类型 int
	    MemberCardType:
	    10:ID:身份证
20:PASSPORT:护照
30:HKPASS:港澳通行证 
		*/
		@Column(name="ilegaltype")
		public Integer getIlegaltype() {
			return  ilegaltype;//执行董事证件类型 int
		}
		/**
		执行董事证件类型 int
	    MemberCardType:
	    10:ID:身份证
20:PASSPORT:护照
30:HKPASS:港澳通行证 
		*/
		public void setIlegaltype(Integer  ilegaltype) {
			this.ilegaltype =  ilegaltype;//执行董事证件类型 int
		}
	   /**
		执行董事是否兼职 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisjoblegal")
		public Integer getBisjoblegal() {
			return  bisjoblegal;//执行董事是否兼职 int
		}
		/**
		执行董事是否兼职 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisjoblegal(Integer  bisjoblegal) {
			this.bisjoblegal =  bisjoblegal;//执行董事是否兼职 int
		}
	   /**
		公司经理姓名 String
		*/
		@Column(name="smanagername",length=100)
		public String getSmanagername() {
			return  smanagername;//公司经理姓名 String
		}
		/**
		公司经理姓名 String
		*/
		public void setSmanagername(String  smanagername) {
			this.smanagername =  smanagername;//公司经理姓名 String
		}
	   /**
		公司经理证件号 String
		*/
		@Column(name="smanagerno",length=100)
		public String getSmanagerno() {
			return  smanagerno;//公司经理证件号 String
		}
		/**
		公司经理证件号 String
		*/
		public void setSmanagerno(String  smanagerno) {
			this.smanagerno =  smanagerno;//公司经理证件号 String
		}
	   /**
		公司经理证件类型 int
	    MemberCardType:
	    10:ID:身份证
20:PASSPORT:护照
30:HKPASS:港澳通行证 
		*/
		@Column(name="imanagertype")
		public Integer getImanagertype() {
			return  imanagertype;//公司经理证件类型 int
		}
		/**
		公司经理证件类型 int
	    MemberCardType:
	    10:ID:身份证
20:PASSPORT:护照
30:HKPASS:港澳通行证 
		*/
		public void setImanagertype(Integer  imanagertype) {
			this.imanagertype =  imanagertype;//公司经理证件类型 int
		}
	   /**
		公司经理是否兼职 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisjobmanager")
		public Integer getBisjobmanager() {
			return  bisjobmanager;//公司经理是否兼职 int
		}
		/**
		公司经理是否兼职 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisjobmanager(Integer  bisjobmanager) {
			this.bisjobmanager =  bisjobmanager;//公司经理是否兼职 int
		}
	   /**
		法定代表人 int
	    CorporateType:
	    10:ZXDS:执行董事
20:JL:经理
30:ZXDSJJL:执行董事兼经理 
		*/
		@Column(name="icorporatetype")
		public Integer getIcorporatetype() {
			return  icorporatetype;//法定代表人 int
		}
		/**
		法定代表人 int
	    CorporateType:
	    10:ZXDS:执行董事
20:JL:经理
30:ZXDSJJL:执行董事兼经理 
		*/
		public void setIcorporatetype(Integer  icorporatetype) {
			this.icorporatetype =  icorporatetype;//法定代表人 int
		}
	   /**
		企业业务类型 int
	    CompanyBizType:
	    10:ZRJJ:责任公司基金管理
20:HHJJ:合伙企业基金管理
30:HHFT:合伙企业风投基金 
		*/
		@Column(name="icorbiztype")
		public Integer getIcorbiztype() {
			return  icorbiztype;//企业业务类型 int
		}
		/**
		企业业务类型 int
	    CompanyBizType:
	    10:ZRJJ:责任公司基金管理
20:HHJJ:合伙企业基金管理
30:HHFT:合伙企业风投基金 
		*/
		public void setIcorbiztype(Integer  icorbiztype) {
			this.icorbiztype =  icorbiztype;//企业业务类型 int
		}
	   /**
		审核状态 int
	    ApprovalStatus:
	    0 :WAIT:审核中
1: CHECKED:审核通过
2 :REJECT:审核驳回
 
		*/
		@Column(name="iapprovalstatus")
		public Integer getIapprovalstatus() {
			return  iapprovalstatus;//审核状态 int
		}
		/**
		审核状态 int
	    ApprovalStatus:
	    0 :WAIT:审核中
1: CHECKED:审核通过
2 :REJECT:审核驳回
 
		*/
		public void setIapprovalstatus(Integer  iapprovalstatus) {
			this.iapprovalstatus =  iapprovalstatus;//审核状态 int
		}
	   /**
		风险监测报告结果 String
		*/
		@Column(name="sriskresult",length=4000)
		public String getSriskresult() {
			return  sriskresult;//风险监测报告结果 String
		}
		/**
		风险监测报告结果 String
		*/
		public void setSriskresult(String  sriskresult) {
			this.sriskresult =  sriskresult;//风险监测报告结果 String
		}
	   /**
		风险监测报告内文 String
		*/
		@Column(name="srisktext",length=0)
		public String getSrisktext() {
			return  srisktext;//风险监测报告内文 String
		}
		/**
		风险监测报告内文 String
		*/
		public void setSrisktext(String  srisktext) {
			this.srisktext =  srisktext;//风险监测报告内文 String
		}
	   /**
		承诺函 String
		*/
		@Column(name="scnuno",length=300)
		public String getScnuno() {
			return  scnuno;//承诺函 String
		}
		/**
		承诺函 String
		*/
		public void setScnuno(String  scnuno) {
			this.scnuno =  scnuno;//承诺函 String
		}
	   /**
		关系人控制图 String
		*/
		@Column(name="sgxrtno",length=300)
		public String getSgxrtno() {
			return  sgxrtno;//关系人控制图 String
		}
		/**
		关系人控制图 String
		*/
		public void setSgxrtno(String  sgxrtno) {
			this.sgxrtno =  sgxrtno;//关系人控制图 String
		}
	   /**
		法定/委派联系人 String
		*/
		@Column(name="sfdlinkman",length=50)
		public String getSfdlinkman() {
			return  sfdlinkman;//法定/委派联系人 String
		}
		/**
		法定/委派联系人 String
		*/
		public void setSfdlinkman(String  sfdlinkman) {
			this.sfdlinkman =  sfdlinkman;//法定/委派联系人 String
		}
	   /**
		法定/委派手机号 String
		*/
		@Column(name="sfdsmobile",length=20)
		public String getSfdsmobile() {
			return  sfdsmobile;//法定/委派手机号 String
		}
		/**
		法定/委派手机号 String
		*/
		public void setSfdsmobile(String  sfdsmobile) {
			this.sfdsmobile =  sfdsmobile;//法定/委派手机号 String
		}
	   /**
		法定/委派邮箱 String
		*/
		@Column(name="sfdemail",length=100)
		public String getSfdemail() {
			return  sfdemail;//法定/委派邮箱 String
		}
		/**
		法定/委派邮箱 String
		*/
		public void setSfdemail(String  sfdemail) {
			this.sfdemail =  sfdemail;//法定/委派邮箱 String
		}
	   /**
		控制人联系人 String
		*/
		@Column(name="skzrlinkman",length=50)
		public String getSkzrlinkman() {
			return  skzrlinkman;//控制人联系人 String
		}
		/**
		控制人联系人 String
		*/
		public void setSkzrlinkman(String  skzrlinkman) {
			this.skzrlinkman =  skzrlinkman;//控制人联系人 String
		}
	   /**
		控制人手机 String
		*/
		@Column(name="skzrsmobile",length=20)
		public String getSkzrsmobile() {
			return  skzrsmobile;//控制人手机 String
		}
		/**
		控制人手机 String
		*/
		public void setSkzrsmobile(String  skzrsmobile) {
			this.skzrsmobile =  skzrsmobile;//控制人手机 String
		}
	   /**
		控制人邮箱 String
		*/
		@Column(name="skzremail",length=100)
		public String getSkzremail() {
			return  skzremail;//控制人邮箱 String
		}
		/**
		控制人邮箱 String
		*/
		public void setSkzremail(String  skzremail) {
			this.skzremail =  skzremail;//控制人邮箱 String
		}
	   /**
		审批流 int
	    Process:
	    10:ZSJG:招商机构
20:JDBSC:街道办事处
30:OK:通过
40:REJECT:拒绝
 
		*/
		@Column(name="iprocess")
		public Integer getIprocess() {
			return  iprocess;//审批流 int
		}
		/**
		审批流 int
	    Process:
	    10:ZSJG:招商机构
20:JDBSC:街道办事处
30:OK:通过
40:REJECT:拒绝
 
		*/
		public void setIprocess(Integer  iprocess) {
			this.iprocess =  iprocess;//审批流 int
		}
	   /**
		是否入住企业 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		@Column(name="bisincompany")
		public Integer getBisincompany() {
			return  bisincompany;//是否入住企业 int
		}
		/**
		是否入住企业 int
	    BoolType:
	    0:NO:否
1:YES:是
 
		*/
		public void setBisincompany(Integer  bisincompany) {
			this.bisincompany =  bisincompany;//是否入住企业 int
		}
	
//frogsingcode//
	
	
	
	
	//frogsingcode//
	
}
