package com.frogsing.member;

import java.util.List;

import javax.frogsing.exception.ServiceException;

import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.Actor;

public interface IActorService  {

	void rolerightsave(String[] checkPurviewId, String roleId);

	void BaseDelete(String[] checkboxId) throws ServiceException;

	/**
	 * 
	 * @param memberId
	 * @return
	 * @throws ServiceException
	 */
	List<Actor> findSpecialCheckedActor(String memberId) throws ServiceException;

	/**
	 * 
	 * @param memberId
	 * @return
	 * @throws ServiceException
	 */
	List<Actor> findSpecialNoCheckedActor(String memberId) throws ServiceException;

	/**
	 * 保存给会员分配的特殊角色
	 * 
	 * @param memberId
	 * @param actorId
	 * @throws ServiceException
	 */
	void memberActorSave(Actor actor, String smemberid,ILoginUser u) throws ServiceException;

	/**
	 * 统计一个会员id拥有的同名的角色的数量
	 * @param srolename
	 * @param smemberid
	 * @return
	 */
	long countBySrolename(String srolename, String smemberid);

	Actor findOne(String id);

}