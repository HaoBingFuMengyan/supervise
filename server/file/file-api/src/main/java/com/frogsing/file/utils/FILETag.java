package  com.frogsing.file.utils;
import com.frogsing.heart.consts.IConst;
import com.frogsing.heart.web.taglib.BaseTag;
import com.frogsing.heart.web.taglib.BaseDoubleTag;
 
public  class FILETag{

	public static class TagSysFileType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.file.utils.FILE.SysFileType.get(val);
		}
		public void setAuthbook(int val) {
			setCurrentconst(com.frogsing.file.utils.FILE.SysFileType.AuthBook,val);
		}
		public void setShoplogo(int val) {
			setCurrentconst(com.frogsing.file.utils.FILE.SysFileType.ShopLogo,val);
		}
		public void setShopbanner(int val) {
			setCurrentconst(com.frogsing.file.utils.FILE.SysFileType.ShopBanner,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.file.utils.FILE.SysFileType.values();
		}
	}
	public static class TagFileType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.file.utils.FILE.FileType.get(val);
		}
		public void setMember(int val) {
			setCurrentconst(com.frogsing.file.utils.FILE.FileType.MEMBER,val);
		}
		public void setPayment(int val) {
			setCurrentconst(com.frogsing.file.utils.FILE.FileType.PAYMENT,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.file.utils.FILE.FileType.values();
		}
	}
}