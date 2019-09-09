package com.frogsing.heart.web.taglib;

import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.consts.IConst;

public  class ConstsTag {

	public static class TagBoolType extends BaseTag
	{
		@Override
		public IConst GetConst(int val) {
			return Consts.BoolType.get(val);
		}
		public void setNo(int val) {
			setCurrentconst(Consts.BoolType.NO,val);
		}
		public void setYes(int val) {
			setCurrentconst(Consts.BoolType.YES,val);
		}
		@Override
		public IConst[] GetVals() {
			return Consts.BoolType.values();
		}
	}
}