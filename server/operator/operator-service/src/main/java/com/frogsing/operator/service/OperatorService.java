package com.frogsing.operator.service;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.security.utils.MD5;
import com.frogsing.operator.IOperatorService;
import com.frogsing.operator.dao.OperatorDao;
import com.frogsing.operator.po.Operator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Component
@Transactional
public class OperatorService implements IOperatorService {

	
	@Autowired
	private OperatorDao operatorDao;


	/**
	 * 根据用户名密码查询管理员表
	 * @param susername
	 * @param spassword
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public Operator operatorLogin(String susername, String spassword) {
		return operatorDao.findBySusernameAndSpassword(susername,
				MD5.encode(spassword));
	}
	/**
	 * 修改密码
	 *
	 * @param operator
	 */
	@Override
	public void updatePassword(Operator operator,String snewpassword) {
		operator.setDmodifydate(new Date());
		operator.setSmodifyoperator(operator.getId());
		operatorDao.updatePassword(operator.getId(),MD5.encode(snewpassword));
	}


	@Override
	public void updateTerminal(String userid,int terminaltype, String clientid) {
		Operator user=this.operatorDao.lock(userid);
		user.setIlastterminaltype(terminaltype);
		user.setSlastterminalid(clientid);
		this.operatorDao.save(user);
	}

	@Override
	public void updatePassword(String soldpassword, String snewpassword,String id) {
		Operator operator=operatorDao.lock(id);
		if(!MD5.encode(soldpassword).equalsIgnoreCase(operator.getSpassword()))
			E.S("旧密码不正确！");
		operator.setSpassword(MD5.encode(snewpassword));
		operator.setDmodifydate(new Date());
		operator.setSmodifyoperator(operator.getId());
		operatorDao.save(operator);

	}
}
