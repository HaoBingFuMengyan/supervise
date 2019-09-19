package com.frogsing.message;

import com.frogsing.heart.web.login.ILoginUser;
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


	void sendTradeSiteMsg(String ssenderid, String sreceiveid, String scontent, ILoginUser user);

	Message buildMessage(Authapply authapply, Operator operator,String scontent);

}