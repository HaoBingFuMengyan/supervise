package com.frogsing.message;

import com.frogsing.member.po.Authapply;
import com.frogsing.member.po.Member;
import com.frogsing.member.po.User;
import com.frogsing.message.po.Message;
import com.frogsing.operator.po.Operator;

import javax.frogsing.exception.ServiceException;

public interface IMessageService {

	long countUnRead(String memberid, String userid);

	Message lookOne(String id);

	void allRead(String memberid, String userId) throws ServiceException;

	void delete(String[] ids);

	/**
	 * 向会员发送站内信
	 *
	 * @param title
	 * @param msg
	 * @param o
	 * @return
	 */
	int sendMemberSiteMsg(String title, String msg, Member o);

	/**
	 * 向交易员发送站内信
	 *
	 * @param title
	 * @param msg
	 * @param o
	 * @return
	 */
	int sendTradeSiteMsg(String title, String msg, User o);

	Message buildMessage(Authapply authapply, Operator operator,String scontent);

}