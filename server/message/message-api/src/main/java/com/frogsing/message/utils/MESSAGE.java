package  com.frogsing.message.utils;
import com.frogsing.heart.consts.IConst;
import com.frogsing.heart.json.JSONObject;
import java.util.Map;
public class MESSAGE {



public static enum ReceiveType implements  IConst{
	JGB(0,"监管部"),
	MEMBER(3,"会员");
	public  static ReceiveType get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return ReceiveType.JGB;
    	 case 3:
    		return ReceiveType.MEMBER;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   ReceiveType ( int   _nCode,String _nlabel) { 
	
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
    	 return ReceiveType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return ReceiveType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(ReceiveType.values());
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
public static enum OperatorOrAdmin implements  IConst{
	JGB(0,"监管部"),
	MEMBER(3,"会员");
	public  static OperatorOrAdmin get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return OperatorOrAdmin.JGB;
    	 case 3:
    		return OperatorOrAdmin.MEMBER;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   OperatorOrAdmin ( int   _nCode,String _nlabel) { 
	
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
    	 return OperatorOrAdmin.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return OperatorOrAdmin.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(OperatorOrAdmin.values());
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
	EXCHANGE(0,"平台"),
	Driver(1,"司机"),
	Station(3,"货站"),
	GoodOwner(8,"货主");
	public  static MemberType get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return MemberType.EXCHANGE;
    	 case 1:
    		return MemberType.Driver;
    	 case 3:
    		return MemberType.Station;
    	 case 8:
    		return MemberType.GoodOwner;
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
public static enum MSGChannel implements  IConst{
	NULL(0,"无"),
	SHENZHEN(1," 深圳通道"),
	GUANGZHOU(2,"广州通道");
	public  static MSGChannel get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return MSGChannel.NULL;
    	 case 1:
    		return MSGChannel.SHENZHEN;
    	 case 2:
    		return MSGChannel.GUANGZHOU;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   MSGChannel ( int   _nCode,String _nlabel) { 
	
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
    	 return MSGChannel.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return MSGChannel.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(MSGChannel.values());
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
public static enum InfoType implements  IConst{
	SMS(0,"短信"),
	SITE(1,"站内信"),
	VOICE(2,"语音"),
	EMAIL(3,"邮件"),
	DingTalk(4,"钉钉群消息"),
	APP(5,"APP消息");
	public  static InfoType get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return InfoType.SMS;
    	 case 1:
    		return InfoType.SITE;
    	 case 2:
    		return InfoType.VOICE;
    	 case 3:
    		return InfoType.EMAIL;
    	 case 4:
    		return InfoType.DingTalk;
    	 case 5:
    		return InfoType.APP;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   InfoType ( int   _nCode,String _nlabel) { 
	
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
    	 return InfoType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return InfoType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(InfoType.values());
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