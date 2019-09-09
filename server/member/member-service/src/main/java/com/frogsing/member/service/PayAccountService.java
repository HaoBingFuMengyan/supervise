package com.frogsing.member.service;

import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.utils.ObjectUtils;
import com.frogsing.heart.utils.T;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.IPayAccountService;
import com.frogsing.member.dao.PayAccountDao;
import com.frogsing.member.po.PayAccount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.frogsing.exception.ServiceException;

@Component
@Transactional
public class PayAccountService implements IPayAccountService {

	@Autowired
	private IQueryService queryService;

	@Autowired
	private PayAccountDao payAccountDao;

	@Override
	public void save(PayAccount payaccount, ILoginUser u) throws ServiceException {
		payaccount.setDadddate(T.now());
		payaccount.setSadduserid(u.getId());
		payaccount.setSmemberid(u.getMemberId());
		this.payAccountDao.save(payaccount);
	}
	@Override
	public void edit(PayAccount payaccount, ILoginUser u) throws ServiceException {
		PayAccount p=queryService.findOne(PayAccount.class,payaccount.getId());
		ObjectUtils.copyObjValue(payaccount,p);
		p.setDmodifydate(T.now());
		p.setSmodifyuserid(u.getMemberId());
		this.payAccountDao.save(p);
	}
}
