package  com.frogsing.project.utils;
import com.frogsing.heart.consts.IConst;
import com.frogsing.heart.json.JSONObject;
import java.util.Map;
public class PROJECT {



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
}