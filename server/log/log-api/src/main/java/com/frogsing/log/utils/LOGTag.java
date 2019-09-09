package  com.frogsing.log.utils;
import com.frogsing.heart.consts.IConst;
import com.frogsing.heart.web.taglib.BaseTag;
import com.frogsing.heart.web.taglib.BaseDoubleTag;
 
public  class LOGTag{

	public static class TagOperatorBillType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.log.utils.LOG.OperatorBillType.get(val);
		}
		public void setBuyer(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.OperatorBillType.Buyer,val);
		}
		public void setSeller(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.OperatorBillType.Seller,val);
		}
		public void setSelf(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.OperatorBillType.Self,val);
		}
		public void setOther(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.OperatorBillType.Other,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.log.utils.LOG.OperatorBillType.values();
		}
	}
	public static class TagBillType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.log.utils.LOG.BillType.get(val);
		}
		public void setContract(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.BillType.Contract,val);
		}
		public void setSalecontract(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.BillType.SaleContract,val);
		}
		public void setOrder(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.BillType.Order,val);
		}
		public void setLong(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.BillType.Long,val);
		}
		public void setSend(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.BillType.Send,val);
		}
		public void setLading(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.BillType.Lading,val);
		}
		public void setSettle(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.BillType.Settle,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.log.utils.LOG.BillType.values();
		}
	}
	public static class TagLG_LogLevel extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.log.utils.LOG.LG_LogLevel.get(val);
		}
		public void setInfo(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.LG_LogLevel.INFO,val);
		}
		public void setWarning(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.LG_LogLevel.WARNING,val);
		}
		public void setError(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.LG_LogLevel.ERROR,val);
		}
		public void setCruel(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.LG_LogLevel.CRUEL,val);
		}
		public void setDead(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.LG_LogLevel.DEAD,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.log.utils.LOG.LG_LogLevel.values();
		}
	}
	public static class TagLG_LogType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.log.utils.LOG.LG_LogType.get(val);
		}
		public void setSystem(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.LG_LogType.SYSTEM,val);
		}
		public void setSecrity(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.LG_LogType.SECRITY,val);
		}
		public void setBusiness(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.LG_LogType.BUSINESS,val);
		}
		public void setOther(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.LG_LogType.OTHER,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.log.utils.LOG.LG_LogType.values();
		}
	}
	public static class TagLG_OperateType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.log.utils.LOG.LG_OperateType.get(val);
		}
		public void setAdd(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.LG_OperateType.ADD,val);
		}
		public void setModify(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.LG_OperateType.MODIFY,val);
		}
		public void setDelete(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.LG_OperateType.DELETE,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.log.utils.LOG.LG_OperateType.values();
		}
	}
	public static class TagOperatorLogLevel extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.log.utils.LOG.OperatorLogLevel.get(val);
		}
		public void setSystem(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.OperatorLogLevel.System,val);
		}
		public void setBussiness(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.OperatorLogLevel.Bussiness,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.log.utils.LOG.OperatorLogLevel.values();
		}
	}
	public static class TagCheckStatus extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.log.utils.LOG.CheckStatus.get(val);
		}
		public void setPass(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.CheckStatus.Pass,val);
		}
		public void setReject(int val) {
			setCurrentconst(com.frogsing.log.utils.LOG.CheckStatus.Reject,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.log.utils.LOG.CheckStatus.values();
		}
	}
}