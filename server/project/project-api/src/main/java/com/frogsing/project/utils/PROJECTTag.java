package  com.frogsing.project.utils;
import com.frogsing.heart.consts.IConst;
import com.frogsing.heart.web.taglib.BaseTag;
import com.frogsing.heart.web.taglib.BaseDoubleTag;
 
public  class PROJECTTag{

	public static class TagOperatorBillType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return com.frogsing.project.utils.PROJECT.OperatorBillType.get(val);
		}
		public void setBuyer(int val) {
			setCurrentconst(com.frogsing.project.utils.PROJECT.OperatorBillType.Buyer,val);
		}
		public void setSeller(int val) {
			setCurrentconst(com.frogsing.project.utils.PROJECT.OperatorBillType.Seller,val);
		}
		public void setSelf(int val) {
			setCurrentconst(com.frogsing.project.utils.PROJECT.OperatorBillType.Self,val);
		}
		public void setOther(int val) {
			setCurrentconst(com.frogsing.project.utils.PROJECT.OperatorBillType.Other,val);
		}
		@Override
		public IConst[] GetVals() {
			return com.frogsing.project.utils.PROJECT.OperatorBillType.values();
		}
	}
	public static class TagFeePercent extends BaseDoubleTag{
		@Override
		public int getPrecision() {
			return 6;
		}
		@Override
		public int getLength() {
			return 10;
		}
	}
	public static class TagFloat extends BaseDoubleTag{
		@Override
		public int getPrecision() {
			return 2;
		}
		@Override
		public int getLength() {
			return 18;
		}
	}
	public static class TagPercent extends BaseDoubleTag{
		@Override
		public int getPrecision() {
			return 2;
		}
		@Override
		public int getLength() {
			return 8;
		}
	}
	public static class TagWeight extends BaseDoubleTag{
		@Override
		public int getPrecision() {
			return 4;
		}
		@Override
		public int getLength() {
			return 18;
		}
	}
	public static class TagMoney extends BaseDoubleTag{
		@Override
		public int getPrecision() {
			return 2;
		}
		@Override
		public int getLength() {
			return 18;
		}
	}
	public static class TagArea extends BaseDoubleTag{
		@Override
		public int getPrecision() {
			return 4;
		}
		@Override
		public int getLength() {
			return 10;
		}
	}
	public static class TagPrice extends BaseDoubleTag{
		@Override
		public int getPrecision() {
			return 2;
		}
		@Override
		public int getLength() {
			return 18;
		}
	}
}