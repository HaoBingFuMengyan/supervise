package com.frogsing.member;

import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.Authapply;

import javax.frogsing.exception.ServiceException;
import java.util.List;

public interface IAuthapplyService  {

	
	/**
	 * 审核通过认证信息
	 * @author XiaoYao
	 * @param id
	 * @param scheckinfo
	 * @param currentUser
	 */
	void checkOk(String id,String scheckinfo, ILoginUser currentUser);
	
	
	/**
	 * 审核拒绝
	 * @author XiaoYao
	 * @param id
	 * @param scheckinfo
	 * @param currentUser
	 */
	void reject(String id,String scheckinfo, ILoginUser currentUser);
	



	/**
	 * 根据类型的会员ID查找出申请
	 * 
	 * @param type
	 * @param memberid
	 * @return
	 * @throws ServiceException
	 */
	List<Authapply> findByType(int type, String memberid) throws ServiceException;

	Authapply findLastApply(String memberid);

	Authapply findOne(String id);

	void refMember(String memberid );

}