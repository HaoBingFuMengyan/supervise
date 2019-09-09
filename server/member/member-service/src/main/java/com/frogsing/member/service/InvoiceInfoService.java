package com.frogsing.member.service;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.IInvoiceInfoService;
import com.frogsing.member.dao.InvoiceInfoDao;
import com.frogsing.member.po.InvoiceInfo;
import com.frogsing.member.utils.MEMBERCol;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

@Component
@Transactional
public class InvoiceInfoService implements IInvoiceInfoService{

	@Autowired
	private InvoiceInfoDao invoiceInfoDao;

	@Override
	public List<InvoiceInfo> findBySmemberid(String memberid) {
		return invoiceInfoDao.findAll(new Specification<InvoiceInfo>() {
			@Override
			public Predicate toPredicate(Root<InvoiceInfo> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				return cb.and(cb.equal(root.get(MEMBERCol.hy_invoiceinfo.smemberid), memberid));
			}
		}, new Sort(Sort.Direction.DESC, MEMBERCol.hy_invoiceinfo.dadddate));
	}

	@Override
	public void docommonSave(InvoiceInfo invoiceInfo, ILoginUser user) {

		invoiceInfo.setSmemberid(user.getMemberId());

		invoiceInfoDao.save(invoiceInfo);

	}

	@Override
	public void dospecialSave(InvoiceInfo invoiceInfo, ILoginUser user) {
		invoiceInfo.setSmemberid(user.getMemberId());
		invoiceInfoDao.save(invoiceInfo);
	}

	@Override
	public void doDelete(String id) {
		if(B.Y(id))
			E.S("开票信息不存在或已被删除");
		invoiceInfoDao.delete(id);
	}

	@Override
	public InvoiceInfo findBySmemberidAndItype(String id, int itype) {
		if (B.Y(id))
			E.S("会员不存在");
		return invoiceInfoDao.findBySmemberidAndItype(id,itype);
	}


}