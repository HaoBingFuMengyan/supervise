package  com.frogsing.message.utils;
import com.frogsing.heart.consts.IConst;
import com.frogsing.heart.web.taglib.BaseTag;
import com.frogsing.heart.web.taglib.BaseDoubleTag;
 
public  class MESSAGETag{

	public static class TagReceiveType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.message.utils.MESSAGE.ReceiveType.get(val);
		}
		public void setJdbsc(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.ReceiveType.JDBSC,val);
		}
		public void setGsspk(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.ReceiveType.GSSPK,val);
		}
		public void setJrjgj(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.ReceiveType.JRJGJ,val);
		}
		public void setMember(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.ReceiveType.MEMBER,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.message.utils.MESSAGE.ReceiveType.values();
		}
	}
	public static class TagOperatorOrAdmin extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.message.utils.MESSAGE.OperatorOrAdmin.get(val);
		}
		public void setJdbsc(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.OperatorOrAdmin.JDBSC,val);
		}
		public void setGsspk(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.OperatorOrAdmin.GSSPK,val);
		}
		public void setJrjgj(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.OperatorOrAdmin.JRJGJ,val);
		}
		public void setMember(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.OperatorOrAdmin.MEMBER,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.message.utils.MESSAGE.OperatorOrAdmin.values();
		}
	}
	public static class TagMemberType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.message.utils.MESSAGE.MemberType.get(val);
		}
		public void setExchange(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.MemberType.EXCHANGE,val);
		}
		public void setDriver(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.MemberType.Driver,val);
		}
		public void setStation(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.MemberType.Station,val);
		}
		public void setGoodowner(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.MemberType.GoodOwner,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.message.utils.MESSAGE.MemberType.values();
		}
	}
	public static class TagMSGChannel extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.message.utils.MESSAGE.MSGChannel.get(val);
		}
		public void setNull(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.MSGChannel.NULL,val);
		}
		public void setShenzhen(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.MSGChannel.SHENZHEN,val);
		}
		public void setGuangzhou(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.MSGChannel.GUANGZHOU,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.message.utils.MESSAGE.MSGChannel.values();
		}
	}
	public static class TagInfoType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.message.utils.MESSAGE.InfoType.get(val);
		}
		public void setSms(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.InfoType.SMS,val);
		}
		public void setSite(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.InfoType.SITE,val);
		}
		public void setVoice(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.InfoType.VOICE,val);
		}
		public void setEmail(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.InfoType.EMAIL,val);
		}
		public void setDingtalk(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.InfoType.DingTalk,val);
		}
		public void setApp(int val) {
			setCurrentconst(com.frogsing.message.utils.MESSAGE.InfoType.APP,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.message.utils.MESSAGE.InfoType.values();
		}
	}
}