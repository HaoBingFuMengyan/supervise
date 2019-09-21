package  com.frogsing.member.utils;
import com.frogsing.heart.consts.IConst;
import com.frogsing.heart.json.JSONObject;
import java.util.Map;
public class MEMBER {



public static enum CheckStatus implements  IConst{
	WAIT(0 ,"审核中"),
	 CHECKED(1,"审核通过"),
	REJECT(2 ,"审核驳回");
	public  static CheckStatus get(int i){
    	 switch(i)
    	 {
    	 case 0 :
    		return CheckStatus.WAIT;
    	 case 1:
    		return CheckStatus. CHECKED;
    	 case 2 :
    		return CheckStatus.REJECT;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   CheckStatus ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return CheckStatus.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return CheckStatus.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(CheckStatus.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum ServiceArea implements  IConst{
	TRADE(1,"交易");
	public  static ServiceArea get(int i){
    	 switch(i)
    	 {
    	 case 1:
    		return ServiceArea.TRADE;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   ServiceArea ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return ServiceArea.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return ServiceArea.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(ServiceArea.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum MemberStatus implements  IConst{
	WAIT(0,"待激活"),
	CHECK(1,"待审核"),
	 REJECT(2,"被拒绝"),
	NORMAL(3 ,"正常"),
	FLEEZE(4 ,"冻结"),
	EDIT(5,"待完善资料");
	public  static MemberStatus get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return MemberStatus.WAIT;
    	 case 1:
    		return MemberStatus.CHECK;
    	 case 2:
    		return MemberStatus. REJECT;
    	 case 3 :
    		return MemberStatus.NORMAL;
    	 case 4 :
    		return MemberStatus.FLEEZE;
    	 case 5:
    		return MemberStatus.EDIT;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   MemberStatus ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return MemberStatus.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return MemberStatus.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(MemberStatus.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum IRegSource implements  IConst{
	FREEREG(1,"自主注册"),
	PARTNER(2,"合作网站"),
	OTHER(3,"其他来源");
	public  static IRegSource get(int i){
    	 switch(i)
    	 {
    	 case 1:
    		return IRegSource.FREEREG;
    	 case 2:
    		return IRegSource.PARTNER;
    	 case 3:
    		return IRegSource.OTHER;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   IRegSource ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return IRegSource.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return IRegSource.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(IRegSource.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum ImageType implements  IConst{
	BUSINESSNO(0,"营业执照副本"),
	ORGCODE(1,"组织机构代码"),
	TAXNO(2,"税务登记证副本"),
	LEGALPERSONCODE(3,"法人身份证"),
	STAMPER(4,"预留印鉴"),
	COMPANYIMAGE(5,"公司图片"),
	OPENS(6,"开户许可证"),
	AUTHBOOK(7,"授权书"),
	CARDUP(8,"身份证正面"),
	CARDDOWN(9,"身份证反面"),
	NewCard(10,"新版营业执照副本"),
	DriverUp(11,"驾驶证正面"),
	DriverDown(12,"驾驶证反面"),
	DrivingUp(13,"行驶证正面"),
	DrivingDown(14,"行驶证反面");
	public  static ImageType get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return ImageType.BUSINESSNO;
    	 case 1:
    		return ImageType.ORGCODE;
    	 case 2:
    		return ImageType.TAXNO;
    	 case 3:
    		return ImageType.LEGALPERSONCODE;
    	 case 4:
    		return ImageType.STAMPER;
    	 case 5:
    		return ImageType.COMPANYIMAGE;
    	 case 6:
    		return ImageType.OPENS;
    	 case 7:
    		return ImageType.AUTHBOOK;
    	 case 8:
    		return ImageType.CARDUP;
    	 case 9:
    		return ImageType.CARDDOWN;
    	 case 10:
    		return ImageType.NewCard;
    	 case 11:
    		return ImageType.DriverUp;
    	 case 12:
    		return ImageType.DriverDown;
    	 case 13:
    		return ImageType.DrivingUp;
    	 case 14:
    		return ImageType.DrivingDown;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   ImageType ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return ImageType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return ImageType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(ImageType.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum AuthenticateType implements  IConst{
	No(0,"注册会员"),
	PERSONAL(10,"个人认证"),
	Company(20,"企业认证");
	public  static AuthenticateType get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return AuthenticateType.No;
    	 case 10:
    		return AuthenticateType.PERSONAL;
    	 case 20:
    		return AuthenticateType.Company;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   AuthenticateType ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return AuthenticateType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return AuthenticateType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(AuthenticateType.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum MemberType implements  IConst{
	EXCHANGE(0,"交易中心"),
	MEMBER(1,"交易会员"),
	Chain(2,"供应链会员"),
	ZIFANG(3,"资方");
	public  static MemberType get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return MemberType.EXCHANGE;
    	 case 1:
    		return MemberType.MEMBER;
    	 case 2:
    		return MemberType.Chain;
    	 case 3:
    		return MemberType.ZIFANG;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   MemberType ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return MemberType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return MemberType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(MemberType.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum Sex implements  IConst{
	MAN(0,"男"),
	WOMAN(1,"女");
	public  static Sex get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return Sex.MAN;
    	 case 1:
    		return Sex.WOMAN;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   Sex ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return Sex.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return Sex.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(Sex.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum ShopStatus implements  IConst{
	Apply(10,"申请中"),
	Checking(20,"审核中"),
	Refuse(21,"审核拒绝"),
	Open(30,"已开通"),
	Close(90,"已关闭");
	public  static ShopStatus get(int i){
    	 switch(i)
    	 {
    	 case 10:
    		return ShopStatus.Apply;
    	 case 20:
    		return ShopStatus.Checking;
    	 case 21:
    		return ShopStatus.Refuse;
    	 case 30:
    		return ShopStatus.Open;
    	 case 90:
    		return ShopStatus.Close;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   ShopStatus ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return ShopStatus.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return ShopStatus.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(ShopStatus.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum InvoiceType implements  IConst{
	Special(10,"增值税专用发票"),
	Common(20,"增值税普通发票");
	public  static InvoiceType get(int i){
    	 switch(i)
    	 {
    	 case 10:
    		return InvoiceType.Special;
    	 case 20:
    		return InvoiceType.Common;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   InvoiceType ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return InvoiceType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return InvoiceType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(InvoiceType.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum CompanyType implements  IConst{
	PRODUCTIVE(0,"生产型"),
	PROCESSING(1,"加工型"),
	TRADE(2,"贸易型");
	public  static CompanyType get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return CompanyType.PRODUCTIVE;
    	 case 1:
    		return CompanyType.PROCESSING;
    	 case 2:
    		return CompanyType.TRADE;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   CompanyType ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return CompanyType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return CompanyType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(CompanyType.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum AppTerminalType implements  IConst{
	None(0,"无APP登录"),
	IOS_PHONE(10,"苹果手机"),
	IOS_PAD(11,"苹果平板"),
	Android_Phone(20,"安卓手机"),
	Android_Pad(21,"安卓平板"),
	Other(90,"其它");
	public  static AppTerminalType get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return AppTerminalType.None;
    	 case 10:
    		return AppTerminalType.IOS_PHONE;
    	 case 11:
    		return AppTerminalType.IOS_PAD;
    	 case 20:
    		return AppTerminalType.Android_Phone;
    	 case 21:
    		return AppTerminalType.Android_Pad;
    	 case 90:
    		return AppTerminalType.Other;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   AppTerminalType ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return AppTerminalType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return AppTerminalType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(AppTerminalType.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum SpotType implements  IConst{
	SPOT(0,"现货"),
	NOSPOT(1,"非现货");
	public  static SpotType get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return SpotType.SPOT;
    	 case 1:
    		return SpotType.NOSPOT;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   SpotType ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return SpotType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return SpotType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(SpotType.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum CardType implements  IConst{
	ID(10,"身份证"),
	PASSPORT(20,"护照"),
	HKPASS(30,"港澳通行证"),
	YYZZ(40,"营业执照");
	public  static CardType get(int i){
    	 switch(i)
    	 {
    	 case 10:
    		return CardType.ID;
    	 case 20:
    		return CardType.PASSPORT;
    	 case 30:
    		return CardType.HKPASS;
    	 case 40:
    		return CardType.YYZZ;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   CardType ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return CardType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return CardType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(CardType.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum LicenseType implements  IConst{
	YYZZ(0,"营业执照");
	public  static LicenseType get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return LicenseType.YYZZ;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   LicenseType ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return LicenseType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return LicenseType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(LicenseType.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum ComType implements  IConst{
	ZRR(10,"自然人"),
	SSGS(20,"上市公司"),
	GQOJT(30,"国企或集体企业");
	public  static ComType get(int i){
    	 switch(i)
    	 {
    	 case 10:
    		return ComType.ZRR;
    	 case 20:
    		return ComType.SSGS;
    	 case 30:
    		return ComType.GQOJT;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   ComType ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return ComType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return ComType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(ComType.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum MemberCardType implements  IConst{
	ID(10,"身份证"),
	PASSPORT(20,"护照"),
	HKPASS(30,"港澳通行证");
	public  static MemberCardType get(int i){
    	 switch(i)
    	 {
    	 case 10:
    		return MemberCardType.ID;
    	 case 20:
    		return MemberCardType.PASSPORT;
    	 case 30:
    		return MemberCardType.HKPASS;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   MemberCardType ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return MemberCardType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return MemberCardType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(MemberCardType.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum CorporateType implements  IConst{
	ZXDS(10,"执行董事"),
	JL(20,"经理"),
	ZXDSJJL(30,"执行董事兼经理");
	public  static CorporateType get(int i){
    	 switch(i)
    	 {
    	 case 10:
    		return CorporateType.ZXDS;
    	 case 20:
    		return CorporateType.JL;
    	 case 30:
    		return CorporateType.ZXDSJJL;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   CorporateType ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return CorporateType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return CorporateType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(CorporateType.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum CompanyBizType implements  IConst{
	ZRJJ(10,"责任公司基金管理"),
	HHJJ(20,"合伙企业基金管理"),
	HHFT(30,"合伙企业风投基金");
	public  static CompanyBizType get(int i){
    	 switch(i)
    	 {
    	 case 10:
    		return CompanyBizType.ZRJJ;
    	 case 20:
    		return CompanyBizType.HHJJ;
    	 case 30:
    		return CompanyBizType.HHFT;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   CompanyBizType ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return CompanyBizType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return CompanyBizType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(CompanyBizType.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum ApprovalStatus implements  IConst{
	WAIT(0 ,"审核中"),
	 CHECKED(1,"审核通过"),
	REJECT(2 ,"审核驳回"),
	NOUPDATE(3,"未变更");
	public  static ApprovalStatus get(int i){
    	 switch(i)
    	 {
    	 case 0 :
    		return ApprovalStatus.WAIT;
    	 case 1:
    		return ApprovalStatus. CHECKED;
    	 case 2 :
    		return ApprovalStatus.REJECT;
    	 case 3:
    		return ApprovalStatus.NOUPDATE;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   ApprovalStatus ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return ApprovalStatus.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return ApprovalStatus.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(ApprovalStatus.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum Process implements  IConst{
	ZSJG(10,"招商机构"),
	JDBSC(20,"街道办事处"),
	OK(30,"通过"),
	REJECT(40,"拒绝");
	public  static Process get(int i){
    	 switch(i)
    	 {
    	 case 10:
    		return Process.ZSJG;
    	 case 20:
    		return Process.JDBSC;
    	 case 30:
    		return Process.OK;
    	 case 40:
    		return Process.REJECT;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   Process ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return Process.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return Process.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(Process.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
public static enum AuthapplySource implements  IConst{
	NEW(10,"新设"),
	QIAN(20,"迁入");
	public  static AuthapplySource get(int i){
    	 switch(i)
    	 {
    	 case 10:
    		return AuthapplySource.NEW;
    	 case 20:
    		return AuthapplySource.QIAN;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   AuthapplySource ( int   _nCode,String _nlabel) { 
	
	       this. nCode  = _nCode;  
	       this.nLabel=_nlabel;
	 } 

      @Override
     public int val(){
    	 return nCode;
     }
    @Override
     public String label(){
    	 return nLabel;
     }
     @Override
     public String getLabel(){
    	 return nLabel;
     }
      @Override
     public int getVal(){
    	 return nCode;
     }
     @Override
     public IConst[] vals(){
    	 return AuthapplySource.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return AuthapplySource.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(AuthapplySource.values());
	}
	public static String json(){
		return JSONObject.wrap(map(),3).toString();
	}
	 @Override
	public boolean isEq(int i) {
		
		return nCode==i;
	}

	@Override
	public boolean isNot(int i) {
		
		return nCode!=i;
	} 
	
}
}