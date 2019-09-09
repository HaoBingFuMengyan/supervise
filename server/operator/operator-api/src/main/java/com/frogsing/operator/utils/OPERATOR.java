package  com.frogsing.operator.utils;
import com.frogsing.heart.consts.IConst;
import com.frogsing.heart.json.JSONObject;
import java.util.Map;
public class OPERATOR {



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
public static enum WfBizType implements  IConst{
	PROXY(0,"代理融资"),
	CDZY(1,"仓单融资"),
	FreeIndenture(2,"解押审核"),
	GoodsOut(3,"出库审核");
	public  static WfBizType get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return WfBizType.PROXY;
    	 case 1:
    		return WfBizType.CDZY;
    	 case 2:
    		return WfBizType.FreeIndenture;
    	 case 3:
    		return WfBizType.GoodsOut;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   WfBizType ( int   _nCode,String _nlabel) { 
	
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
    	 return WfBizType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return WfBizType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(WfBizType.values());
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
public static enum WfStatus implements  IConst{
	Ready(0,"未开始"),
	Process(1,"执行中"),
	Ok(2,"审核通过"),
	No(3,"不通过");
	public  static WfStatus get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return WfStatus.Ready;
    	 case 1:
    		return WfStatus.Process;
    	 case 2:
    		return WfStatus.Ok;
    	 case 3:
    		return WfStatus.No;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   WfStatus ( int   _nCode,String _nlabel) { 
	
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
    	 return WfStatus.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return WfStatus.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(WfStatus.values());
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
public static enum SysRoleType implements  IConst{
	CS(0,"CS端"),
	BS(1,"WEB端"),
	MB(2,"移动端");
	public  static SysRoleType get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return SysRoleType.CS;
    	 case 1:
    		return SysRoleType.BS;
    	 case 2:
    		return SysRoleType.MB;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   SysRoleType ( int   _nCode,String _nlabel) { 
	
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
    	 return SysRoleType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return SysRoleType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(SysRoleType.values());
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
}