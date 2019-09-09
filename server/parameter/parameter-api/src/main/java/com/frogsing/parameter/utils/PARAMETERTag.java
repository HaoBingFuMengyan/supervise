package  com.frogsing.parameter.utils;
import com.frogsing.heart.consts.IConst;
import com.frogsing.heart.web.taglib.BaseTag;
import com.frogsing.heart.web.taglib.BaseDoubleTag;
 
public  class PARAMETERTag{

	public static class TagSiteType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.parameter.utils.PARAMETER.SiteType.get(val);
		}
		public void setGc(int val) {
			setCurrentconst(com.frogsing.parameter.utils.PARAMETER.SiteType.GC,val);
		}
		public void setTks(int val) {
			setCurrentconst(com.frogsing.parameter.utils.PARAMETER.SiteType.TKS,val);
		}
		public void setMt(int val) {
			setCurrentconst(com.frogsing.parameter.utils.PARAMETER.SiteType.MT,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.parameter.utils.PARAMETER.SiteType.values();
		}
	}
	public static class TagExchangeStatus extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.parameter.utils.PARAMETER.ExchangeStatus.get(val);
		}
		public void setOpen(int val) {
			setCurrentconst(com.frogsing.parameter.utils.PARAMETER.ExchangeStatus.Open,val);
		}
		public void setPause(int val) {
			setCurrentconst(com.frogsing.parameter.utils.PARAMETER.ExchangeStatus.Pause,val);
		}
		public void setClose(int val) {
			setCurrentconst(com.frogsing.parameter.utils.PARAMETER.ExchangeStatus.Close,val);
		}
		public void setSettle(int val) {
			setCurrentconst(com.frogsing.parameter.utils.PARAMETER.ExchangeStatus.Settle,val);
		}
		public void setOver(int val) {
			setCurrentconst(com.frogsing.parameter.utils.PARAMETER.ExchangeStatus.Over,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.parameter.utils.PARAMETER.ExchangeStatus.values();
		}
	}
	public static class TagBizParaType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.parameter.utils.PARAMETER.BizParaType.get(val);
		}
		public void setFtpinfo(int val) {
			setCurrentconst(com.frogsing.parameter.utils.PARAMETER.BizParaType.FTPInfo,val);
		}
		public void setGrouptype(int val) {
			setCurrentconst(com.frogsing.parameter.utils.PARAMETER.BizParaType.GroupType,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.parameter.utils.PARAMETER.BizParaType.values();
		}
	}
	public static class TagSysParaType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.parameter.utils.PARAMETER.SysParaType.get(val);
		}
		public void setOnecon(int val) {
			setCurrentconst(com.frogsing.parameter.utils.PARAMETER.SysParaType.ONECON,val);
		}
		public void setTwocon(int val) {
			setCurrentconst(com.frogsing.parameter.utils.PARAMETER.SysParaType.TWOCON,val);
		}
		public void setThreecon(int val) {
			setCurrentconst(com.frogsing.parameter.utils.PARAMETER.SysParaType.THREECON,val);
		}
		public void setImgurl(int val) {
			setCurrentconst(com.frogsing.parameter.utils.PARAMETER.SysParaType.ImgUrl,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.parameter.utils.PARAMETER.SysParaType.values();
		}
	}
	public static class TagSysFileType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.parameter.utils.PARAMETER.SysFileType.get(val);
		}
		public void setAuthbook(int val) {
			setCurrentconst(com.frogsing.parameter.utils.PARAMETER.SysFileType.AuthBook,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.parameter.utils.PARAMETER.SysFileType.values();
		}
	}
}