package  com.frogsing.operator.utils;
import com.frogsing.heart.consts.IConst;
import com.frogsing.heart.web.taglib.BaseTag;
import com.frogsing.heart.web.taglib.BaseDoubleTag;
 
public  class OPERATORTag{

	public static class TagSex extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.operator.utils.OPERATOR.Sex.get(val);
		}
		public void setMan(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.Sex.MAN,val);
		}
		public void setWoman(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.Sex.WOMAN,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.operator.utils.OPERATOR.Sex.values();
		}
	}
	public static class TagWfBizType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.operator.utils.OPERATOR.WfBizType.get(val);
		}
		public void setProxy(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.WfBizType.PROXY,val);
		}
		public void setCdzy(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.WfBizType.CDZY,val);
		}
		public void setFreeindenture(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.WfBizType.FreeIndenture,val);
		}
		public void setGoodsout(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.WfBizType.GoodsOut,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.operator.utils.OPERATOR.WfBizType.values();
		}
	}
	public static class TagWfStatus extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.operator.utils.OPERATOR.WfStatus.get(val);
		}
		public void setReady(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.WfStatus.Ready,val);
		}
		public void setProcess(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.WfStatus.Process,val);
		}
		public void setOk(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.WfStatus.Ok,val);
		}
		public void setNo(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.WfStatus.No,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.operator.utils.OPERATOR.WfStatus.values();
		}
	}
	public static class TagSysRoleType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.operator.utils.OPERATOR.SysRoleType.get(val);
		}
		public void setCs(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.SysRoleType.CS,val);
		}
		public void setBs(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.SysRoleType.BS,val);
		}
		public void setMb(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.SysRoleType.MB,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.operator.utils.OPERATOR.SysRoleType.values();
		}
	}
	public static class TagAppTerminalType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.operator.utils.OPERATOR.AppTerminalType.get(val);
		}
		public void setNone(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.AppTerminalType.None,val);
		}
		public void setIos_phone(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.AppTerminalType.IOS_PHONE,val);
		}
		public void setIos_pad(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.AppTerminalType.IOS_PAD,val);
		}
		public void setAndroid_phone(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.AppTerminalType.Android_Phone,val);
		}
		public void setAndroid_pad(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.AppTerminalType.Android_Pad,val);
		}
		public void setOther(int val) {
			setCurrentconst(com.frogsing.operator.utils.OPERATOR.AppTerminalType.Other,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.operator.utils.OPERATOR.AppTerminalType.values();
		}
	}
}