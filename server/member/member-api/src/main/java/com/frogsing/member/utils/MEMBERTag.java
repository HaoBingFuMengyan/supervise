package  com.frogsing.member.utils;
import com.frogsing.heart.consts.IConst;
import com.frogsing.heart.web.taglib.BaseTag;
import com.frogsing.heart.web.taglib.BaseDoubleTag;
 
public  class MEMBERTag{

	public static class TagCheckStatus extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.CheckStatus.get(val);
		}
		public void setWait(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.CheckStatus.WAIT,val);
		}
		public void setChecked(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.CheckStatus. CHECKED,val);
		}
		public void setReject(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.CheckStatus.REJECT,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.CheckStatus.values();
		}
	}
	public static class TagServiceArea extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.ServiceArea.get(val);
		}
		public void setTrade(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ServiceArea.TRADE,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.ServiceArea.values();
		}
	}
	public static class TagMemberStatus extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.MemberStatus.get(val);
		}
		public void setWait(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.MemberStatus.WAIT,val);
		}
		public void setCheck(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.MemberStatus.CHECK,val);
		}
		public void setReject(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.MemberStatus. REJECT,val);
		}
		public void setNormal(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.MemberStatus.NORMAL,val);
		}
		public void setFleeze(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.MemberStatus.FLEEZE,val);
		}
		public void setEdit(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.MemberStatus.EDIT,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.MemberStatus.values();
		}
	}
	public static class TagIRegSource extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.IRegSource.get(val);
		}
		public void setFreereg(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.IRegSource.FREEREG,val);
		}
		public void setPartner(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.IRegSource.PARTNER,val);
		}
		public void setOther(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.IRegSource.OTHER,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.IRegSource.values();
		}
	}
	public static class TagImageType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.ImageType.get(val);
		}
		public void setBusinessno(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ImageType.BUSINESSNO,val);
		}
		public void setOrgcode(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ImageType.ORGCODE,val);
		}
		public void setTaxno(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ImageType.TAXNO,val);
		}
		public void setLegalpersoncode(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ImageType.LEGALPERSONCODE,val);
		}
		public void setStamper(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ImageType.STAMPER,val);
		}
		public void setCompanyimage(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ImageType.COMPANYIMAGE,val);
		}
		public void setOpens(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ImageType.OPENS,val);
		}
		public void setAuthbook(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ImageType.AUTHBOOK,val);
		}
		public void setCardup(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ImageType.CARDUP,val);
		}
		public void setCarddown(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ImageType.CARDDOWN,val);
		}
		public void setNewcard(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ImageType.NewCard,val);
		}
		public void setDriverup(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ImageType.DriverUp,val);
		}
		public void setDriverdown(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ImageType.DriverDown,val);
		}
		public void setDrivingup(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ImageType.DrivingUp,val);
		}
		public void setDrivingdown(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ImageType.DrivingDown,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.ImageType.values();
		}
	}
	public static class TagAuthenticateType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.AuthenticateType.get(val);
		}
		public void setNo(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.AuthenticateType.No,val);
		}
		public void setPersonal(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.AuthenticateType.PERSONAL,val);
		}
		public void setCompany(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.AuthenticateType.Company,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.AuthenticateType.values();
		}
	}
	public static class TagMemberType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.MemberType.get(val);
		}
		public void setExchange(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.MemberType.EXCHANGE,val);
		}
		public void setMember(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.MemberType.MEMBER,val);
		}
		public void setChain(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.MemberType.Chain,val);
		}
		public void setZifang(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.MemberType.ZIFANG,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.MemberType.values();
		}
	}
	public static class TagSex extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.Sex.get(val);
		}
		public void setMan(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.Sex.MAN,val);
		}
		public void setWoman(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.Sex.WOMAN,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.Sex.values();
		}
	}
	public static class TagShopStatus extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.ShopStatus.get(val);
		}
		public void setApply(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ShopStatus.Apply,val);
		}
		public void setChecking(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ShopStatus.Checking,val);
		}
		public void setRefuse(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ShopStatus.Refuse,val);
		}
		public void setOpen(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ShopStatus.Open,val);
		}
		public void setClose(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ShopStatus.Close,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.ShopStatus.values();
		}
	}
	public static class TagInvoiceType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.InvoiceType.get(val);
		}
		public void setSpecial(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.InvoiceType.Special,val);
		}
		public void setCommon(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.InvoiceType.Common,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.InvoiceType.values();
		}
	}
	public static class TagCompanyType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.CompanyType.get(val);
		}
		public void setProductive(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.CompanyType.PRODUCTIVE,val);
		}
		public void setProcessing(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.CompanyType.PROCESSING,val);
		}
		public void setTrade(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.CompanyType.TRADE,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.CompanyType.values();
		}
	}
	public static class TagAppTerminalType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.AppTerminalType.get(val);
		}
		public void setNone(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.AppTerminalType.None,val);
		}
		public void setIos_phone(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.AppTerminalType.IOS_PHONE,val);
		}
		public void setIos_pad(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.AppTerminalType.IOS_PAD,val);
		}
		public void setAndroid_phone(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.AppTerminalType.Android_Phone,val);
		}
		public void setAndroid_pad(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.AppTerminalType.Android_Pad,val);
		}
		public void setOther(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.AppTerminalType.Other,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.AppTerminalType.values();
		}
	}
	public static class TagSpotType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.SpotType.get(val);
		}
		public void setSpot(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.SpotType.SPOT,val);
		}
		public void setNospot(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.SpotType.NOSPOT,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.SpotType.values();
		}
	}
	public static class TagCardType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.CardType.get(val);
		}
		public void setId(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.CardType.ID,val);
		}
		public void setPassport(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.CardType.PASSPORT,val);
		}
		public void setHkpass(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.CardType.HKPASS,val);
		}
		public void setYyzz(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.CardType.YYZZ,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.CardType.values();
		}
	}
	public static class TagMoney extends BaseDoubleTag{
		@Override
		public int getPrecision() {
			return 2;
		}
		@Override
		public int getLength() {
			return 18;
		}
	}
	public static class TagLicenseType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.LicenseType.get(val);
		}
		public void setYyzz(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.LicenseType.YYZZ,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.LicenseType.values();
		}
	}
	public static class TagComType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.ComType.get(val);
		}
		public void setZrr(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ComType.ZRR,val);
		}
		public void setSsgs(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ComType.SSGS,val);
		}
		public void setGqojt(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ComType.GQOJT,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.ComType.values();
		}
	}
	public static class TagMemberCardType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.MemberCardType.get(val);
		}
		public void setId(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.MemberCardType.ID,val);
		}
		public void setPassport(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.MemberCardType.PASSPORT,val);
		}
		public void setHkpass(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.MemberCardType.HKPASS,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.MemberCardType.values();
		}
	}
	public static class TagCorporateType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.CorporateType.get(val);
		}
		public void setZxds(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.CorporateType.ZXDS,val);
		}
		public void setJl(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.CorporateType.JL,val);
		}
		public void setZxdsjjl(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.CorporateType.ZXDSJJL,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.CorporateType.values();
		}
	}
	public static class TagCompanyBizType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.CompanyBizType.get(val);
		}
		public void setZrjj(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.CompanyBizType.ZRJJ,val);
		}
		public void setHhjj(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.CompanyBizType.HHJJ,val);
		}
		public void setHhft(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.CompanyBizType.HHFT,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.CompanyBizType.values();
		}
	}
	public static class TagApprovalStatus extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.ApprovalStatus.get(val);
		}
		public void setWait(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ApprovalStatus.WAIT,val);
		}
		public void setChecked(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ApprovalStatus. CHECKED,val);
		}
		public void setReject(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ApprovalStatus.REJECT,val);
		}
		public void setNoupdate(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ApprovalStatus.NOUPDATE,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.ApprovalStatus.values();
		}
	}
	public static class TagProcess extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.Process.get(val);
		}
		public void setZsjg(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.Process.ZSJG,val);
		}
		public void setJdbsc(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.Process.JDBSC,val);
		}
		public void setOk(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.Process.OK,val);
		}
		public void setReject(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.Process.REJECT,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.Process.values();
		}
	}
	public static class TagAuthapplySource extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.AuthapplySource.get(val);
		}
		public void setNew(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.AuthapplySource.NEW,val);
		}
		public void setQian(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.AuthapplySource.QIAN,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.AuthapplySource.values();
		}
	}
	public static class TagRiskLevel extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.RiskLevel.get(val);
		}
		public void setYx(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.RiskLevel.YX,val);
		}
		public void setLh(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.RiskLevel.LH,val);
		}
		public void setXc(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.RiskLevel.XC,val);
		}
		public void setFx(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.RiskLevel.FX,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.RiskLevel.values();
		}
	}
	public static class TagRiskType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.RiskType.get(val);
		}
		public void setJgself(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.RiskType.JGSELF,val);
		}
		public void setHxry(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.RiskType.HXRY,val);
		}
		public void setGlqy(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.RiskType.GLQY,val);
		}
		public void setZgqy(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.RiskType.ZGQY,val);
		}
		public void setWbahhqy(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.RiskType.WBAHHQY,val);
		}
		public void setGlrhgx(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.RiskType.GLRHGX,val);
		}
		public void setJjyzqk(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.RiskType.JJYZQK,val);
		}
		public void setFxyj(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.RiskType.FXYJ,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.RiskType.values();
		}
	}
	public static class TagExceptionType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.ExceptionType.get(val);
		}
		public void setSfyc(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ExceptionType.SFYC,val);
		}
		public void setXzcf(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ExceptionType.XZCF,val);
		}
		public void setJyqk(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ExceptionType.JYQK,val);
		}
		public void setSsqk(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ExceptionType.SSQK,val);
		}
		public void setPlyc(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ExceptionType.PLYC,val);
		}
		public void setQsyc(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ExceptionType.QSYC,val);
		}
		public void setKyjy(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ExceptionType.KYJY,val);
		}
		public void setDwtzqk(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ExceptionType.DWTZQk,val);
		}
		public void setZjxcfqk(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ExceptionType.ZJXCFQK,val);
		}
		public void setFxyj(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ExceptionType.FXYJ,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.ExceptionType.values();
		}
	}
	public static class TagBizType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.BizType.get(val);
		}
		public void setJjglr(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.BizType.JJGLR,val);
		}
		public void setCtjj(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.BizType.CTJJ,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.BizType.values();
		}
	}
	public static class TagControlType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.member.utils.MEMBER.ControlType.get(val);
		}
		public void setZjkg(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ControlType.ZJKG,val);
		}
		public void setJjkg(int val) {
			setCurrentconst(com.frogsing.member.utils.MEMBER.ControlType.JJKG,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.member.utils.MEMBER.ControlType.values();
		}
	}
}