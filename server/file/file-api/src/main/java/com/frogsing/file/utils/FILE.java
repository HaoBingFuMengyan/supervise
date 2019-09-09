package  com.frogsing.file.utils;
import com.frogsing.heart.consts.IConst;
import com.frogsing.heart.json.JSONObject;
import java.util.Map;
public class FILE {



public static enum SysFileType implements  IConst{
	AuthBook(0,"授权书"),
	ShopLogo(1,"店铺logo"),
	ShopBanner(2,"店铺banner");
	public  static SysFileType get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return SysFileType.AuthBook;
    	 case 1:
    		return SysFileType.ShopLogo;
    	 case 2:
    		return SysFileType.ShopBanner;
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
public static enum FileType implements  IConst{
	MEMBER(0,"会员"),
	PAYMENT(1,"付款凭证");
	public  static FileType get(int i){
    	 switch(i)
    	 {
    	 case 0:
    		return FileType.MEMBER;
    	 case 1:
    		return FileType.PAYMENT;
    	 }
    	 return null;
     }
     

	 private   int   nCode ; 
	 private   String   nLabel ;
	 private   FileType ( int   _nCode,String _nlabel) { 
	
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
    	 return FileType.values();
     }
     
	@Override
	public IConst valof(String str) {
		
		return FileType.valueOf(str);
	} 
    public static Map<Integer,String> map(){
		return  com.frogsing.heart.consts.IConstUtils.map(FileType.values());
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