package  com.frogsing.log.utils;
import com.frogsing.heart.consts.IConst;
import com.frogsing.heart.json.JSONObject;
import java.util.Map;
public class LOG {



public static enum OperatorBillType implements  IConst{
	Buyer(10,"买家"),
	Seller(20,"卖家"),
	Self(30,"平台"),
	Other(99,"其它");
	public  static OperatorBillType get(int i){
    	 switch(i)
    	 {
    	 case 10:
    		return OperatorBillType.Buyer;
    	 case 20:
    		return OperatorBillType.Seller;
    	 case 30:
    		return OperatorBillType.Self;
    	 case 99:
    		return OperatorBillType.Other;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   OperatorBillType ( int   _nCode,String _nlabel) { 
	
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
    	 return OperatorBillType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return OperatorBillType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(OperatorBillType.values());
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
public static enum BillType implements  IConst{
	Contract(10,"采购合同"),
	SaleContract(11,"销售合同"),
	Order(20,"订单"),
	Long(21,"长约"),
	Send(30,"发货单"),
	Lading(40,"提货单"),
	Settle(50,"结算单");
	public  static BillType get(int i){
    	 switch(i)
    	 {
    	 case 10:
    		return BillType.Contract;
    	 case 11:
    		return BillType.SaleContract;
    	 case 20:
    		return BillType.Order;
    	 case 21:
    		return BillType.Long;
    	 case 30:
    		return BillType.Send;
    	 case 40:
    		return BillType.Lading;
    	 case 50:
    		return BillType.Settle;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   BillType ( int   _nCode,String _nlabel) { 
	
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
    	 return BillType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return BillType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(BillType.values());
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
public static enum LG_LogLevel implements  IConst{
	INFO(0,"信息"),
	WARNING(1,"警告"),
	ERROR(2,"错误"),
	CRUEL(3,"严重"),
	DEAD(4,"瘫痪");
	public  static LG_LogLevel get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return LG_LogLevel.INFO;
    	 case 1:
    		return LG_LogLevel.WARNING;
    	 case 2:
    		return LG_LogLevel.ERROR;
    	 case 3:
    		return LG_LogLevel.CRUEL;
    	 case 4:
    		return LG_LogLevel.DEAD;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   LG_LogLevel ( int   _nCode,String _nlabel) { 
	
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
    	 return LG_LogLevel.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return LG_LogLevel.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(LG_LogLevel.values());
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
public static enum LG_LogType implements  IConst{
	SYSTEM(1,"系统日志"),
	SECRITY(2,"安全日志"),
	BUSINESS(3,"应用日志"),
	OTHER(4,"其它日志");
	public  static LG_LogType get(int i){
    	 switch(i)
    	 {
    	 case 1:
    		return LG_LogType.SYSTEM;
    	 case 2:
    		return LG_LogType.SECRITY;
    	 case 3:
    		return LG_LogType.BUSINESS;
    	 case 4:
    		return LG_LogType.OTHER;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   LG_LogType ( int   _nCode,String _nlabel) { 
	
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
    	 return LG_LogType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return LG_LogType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(LG_LogType.values());
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
public static enum LG_OperateType implements  IConst{
	ADD(0,"新增"),
	MODIFY(1,"修改"),
	DELETE(2,"删除");
	public  static LG_OperateType get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return LG_OperateType.ADD;
    	 case 1:
    		return LG_OperateType.MODIFY;
    	 case 2:
    		return LG_OperateType.DELETE;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   LG_OperateType ( int   _nCode,String _nlabel) { 
	
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
    	 return LG_OperateType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return LG_OperateType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(LG_OperateType.values());
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
public static enum OperatorLogLevel implements  IConst{
	System(0,"系统操作"),
	Bussiness(1,"业务操作");
	public  static OperatorLogLevel get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return OperatorLogLevel.System;
    	 case 1:
    		return OperatorLogLevel.Bussiness;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   OperatorLogLevel ( int   _nCode,String _nlabel) { 
	
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
    	 return OperatorLogLevel.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return OperatorLogLevel.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(OperatorLogLevel.values());
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
public static enum CheckStatus implements  IConst{
	Pass(10,"通过"),
	Reject(20,"拒绝");
	public  static CheckStatus get(int i){
    	 switch(i)
    	 {
    	 case 10:
    		return CheckStatus.Pass;
    	 case 20:
    		return CheckStatus.Reject;
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
}