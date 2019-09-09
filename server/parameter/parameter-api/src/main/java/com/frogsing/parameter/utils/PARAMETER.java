package  com.frogsing.parameter.utils;
import com.frogsing.heart.consts.IConst;
import com.frogsing.heart.json.JSONObject;
import java.util.Map;
public class PARAMETER {



public static enum SiteType implements  IConst{
	GC(0,"有色"),
	TKS(1,"铁矿石"),
	MT(2,"煤炭");
	public  static SiteType get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return SiteType.GC;
    	 case 1:
    		return SiteType.TKS;
    	 case 2:
    		return SiteType.MT;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   SiteType ( int   _nCode,String _nlabel) { 
	
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
    	 return SiteType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return SiteType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(SiteType.values());
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
public static enum ExchangeStatus implements  IConst{
	Open(10,"开市"),
	Pause(15,"暂停"),
	Close(20,"闭市"),
	Settle(30,"结算"),
	Over(40,"关闭");
	public  static ExchangeStatus get(int i){
    	 switch(i)
    	 {
    	 case 10:
    		return ExchangeStatus.Open;
    	 case 15:
    		return ExchangeStatus.Pause;
    	 case 20:
    		return ExchangeStatus.Close;
    	 case 30:
    		return ExchangeStatus.Settle;
    	 case 40:
    		return ExchangeStatus.Over;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   ExchangeStatus ( int   _nCode,String _nlabel) { 
	
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
    	 return ExchangeStatus.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return ExchangeStatus.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(ExchangeStatus.values());
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
public static enum BizParaType implements  IConst{
	FTPInfo(200,"Ftp配置"),
	GroupType(300,"群组类型");
	public  static BizParaType get(int i){
    	 switch(i)
    	 {
    	 case 200:
    		return BizParaType.FTPInfo;
    	 case 300:
    		return BizParaType.GroupType;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   BizParaType ( int   _nCode,String _nlabel) { 
	
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
    	 return BizParaType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return BizParaType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(BizParaType.values());
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
public static enum SysParaType implements  IConst{
	ONECON(1,"第一合约名称"),
	TWOCON(2,"第二合约名称"),
	THREECON(3,"第三合约名称"),
	ImgUrl(4,"图片服务器地址");
	public  static SysParaType get(int i){
    	 switch(i)
    	 {
    	 case 1:
    		return SysParaType.ONECON;
    	 case 2:
    		return SysParaType.TWOCON;
    	 case 3:
    		return SysParaType.THREECON;
    	 case 4:
    		return SysParaType.ImgUrl;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   SysParaType ( int   _nCode,String _nlabel) { 
	
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
    	 return SysParaType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return SysParaType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(SysParaType.values());
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
	
	 public String sys(String dfvalue) {
		
		return com.frogsing.parameter.utils.ParaUtils.sys(this.nCode,dfvalue);
	}
	public Long sys(long dfvalue) {
		String rs=com.frogsing.parameter.utils.ParaUtils.sys(this.nCode,String.valueOf(dfvalue));
		return Long.parseLong(rs);
	}
	public Double sys(double dfvalue) {
		String rs=com.frogsing.parameter.utils.ParaUtils.sys(this.nCode,String.valueOf(dfvalue));
		return Double.parseDouble(rs);
	}
}
public static enum SysFileType implements  IConst{
	AuthBook(0,"授权书");
	public  static SysFileType get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return SysFileType.AuthBook;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   SysFileType ( int   _nCode,String _nlabel) { 
	
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
    	 return SysFileType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return SysFileType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(SysFileType.values());
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