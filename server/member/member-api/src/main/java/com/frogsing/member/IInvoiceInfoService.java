package com.frogsing.member;

import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.Authapply;
import com.frogsing.member.po.InvoiceInfo;

import java.util.List;

public interface IInvoiceInfoService {
	/**
	 * 添加增值税普通发票
	 * @param invoiceInfo
	 * @param user
	 */
	void docommonSave(InvoiceInfo invoiceInfo, ILoginUser user);
	/**
	 * 添加增值税普通发票
	 * @param invoiceInfo
	 * @param user
	 */
	void dospecialSave(InvoiceInfo invoiceInfo, ILoginUser user);

	/**
	 * 删除开票信息
	 * @param id
	 */
	void doDelete(String id);
	/**
	 * 根据memberid查找
	 * @param id
	 * @return
	 */
	InvoiceInfo findBySmemberidAndItype(String id,int itypes);
	/**
	 * 根据memberid查找
	 * @return
	 */
	List<InvoiceInfo> findBySmemberid(String id);
}