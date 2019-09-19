package com.frogsing.message.service;


import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.persistence.XSpec;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.po.Authapply;
import com.frogsing.member.po.Member;
import com.frogsing.member.po.User;
import com.frogsing.message.IMessageService;
import com.frogsing.message.dao.MessageDao;
import com.frogsing.message.dao.MessageDetailDao;
import com.frogsing.message.po.Message;
import com.frogsing.message.po.MessageDetail;
import com.frogsing.message.utils.MESSAGE;
import com.frogsing.message.utils.MESSAGECol;
import com.frogsing.operator.po.Operator;
import com.frogsing.operator.utils.OPERATOR;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.frogsing.exception.ServiceException;
import java.util.Arrays;
import java.util.Date;

@Component
@Transactional
public class MessageService implements IMessageService {

	@Autowired
	private MessageDao messageDao;

	@Autowired
	private MessageDetailDao messageDetailDao;

	@Autowired
	private IQueryService queryService;


	@Override
	public long countUnRead(final String memberid,final String userid) {


		return 0L;
	}
	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMessageService#lookOne(java.lang.String)
	 */
	@Override
	public Message lookOne(String id) {
		Message m=messageDao.findOne(id);
//		if(m!=null&&m.getBisread()==0){
//			m.setBisread(1);
//			messageDao.save(m);
//		}
		return m;
	}


	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMessageService#allRead(java.lang.String, java.lang.String)
	 */
	@Override
	public void allRead(String memberid,String userId) throws ServiceException{
		String sql="update cx_message m set m.bisread=1 where m.bisdelete=0 and m.ireceivetype=0 and m.sreceiveid=?";
		String sql2="update cx_message m set m.bisread=1 where m.bisdelete=0 and m.ireceivetype=1 and m.sreceiveid=?";
		this.messageDao.executeNativeSql(sql, memberid);
		this.messageDao.executeNativeSql(sql2, userId);
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMessageService#delete(java.lang.String[])
	 */
	@Override
	public void delete(String[] ids){
		Iterable<Message> list=this.messageDao.findAll(Arrays.asList(ids));
		this.messageDao.delete(list);
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMessageService#sendMemberSiteMsg(java.lang.String, java.lang.String, com.frogsing.po.entity.hy.Member)
	 */
	@Override
	public int sendMemberSiteMsg(String title, String msg, Member o) {
		return 1;
	}

	@Override
	public void sendTradeSiteMsg(String ssenderid, String sreceiveid, String scontent, ILoginUser user) {
		XSpec<Message> xSpec = MESSAGECol.cx_message.xspec();

		xSpec.and(SearchFilter.eq(MESSAGECol.cx_message.ssenderid,ssenderid),
				SearchFilter.eq(MESSAGECol.cx_message.sreceiveid,sreceiveid));
	}


	@Override
	public Message buildMessage(Authapply authapply, Operator operator, String scontent) {

		XSpec<Message> xSpec = MESSAGECol.cx_message.xspec();

		xSpec.and(SearchFilter.eq(MESSAGECol.cx_message.sreceiveid,authapply.getId()));

		if (OPERATOR.OperatorType.ZDBSC.isEq(operator.getIoperatortype()))
			xSpec.and(SearchFilter.eq(MESSAGECol.cx_message.isendertype, MESSAGE.OperatorOrAdmin.JDBSC.val()));
		else if (OPERATOR.OperatorType.GSSPK.isEq(operator.getIoperatortype()))
			xSpec.and(SearchFilter.eq(MESSAGECol.cx_message.isendertype, MESSAGE.OperatorOrAdmin.GSSPK.val()));
		else if (OPERATOR.OperatorType.JRGLJ.isEq(operator.getIoperatortype()))
			xSpec.and(SearchFilter.eq(MESSAGECol.cx_message.isendertype, MESSAGE.OperatorOrAdmin.JRJGJ.val()));

		xSpec.and(SearchFilter.eq(MESSAGECol.cx_message.ssenderid,operator.getId()));

		Message message = queryService.fetchOne(xSpec);

		if (message == null){
			message = new Message();

			message.setId(null);
			if (OPERATOR.OperatorType.ZDBSC.isEq(operator.getIoperatortype()))
				message.setIsendertype(MESSAGE.OperatorOrAdmin.JDBSC.val());
			else if (OPERATOR.OperatorType.GSSPK.isEq(operator.getIoperatortype()))
				message.setIsendertype(MESSAGE.OperatorOrAdmin.GSSPK.val());
			else if (OPERATOR.OperatorType.JRGLJ.isEq(operator.getIoperatortype()))
				message.setIsendertype(MESSAGE.OperatorOrAdmin.JRJGJ.val());
			message.setSsenderid(operator.getId());
			message.setSsendername(operator.getSrealname());
			message.setIreceivetype(MESSAGE.OperatorOrAdmin.MEMBER.val());
			message.setSreceiveid(authapply.getId());
			message.setSreceivename(authapply.getScnname());
			message.setDsenddatetime(new Date());

			Message obj = this.messageDao.saveAndFlush(message);

			buildMessageDetail(obj,authapply,operator,scontent);
		}else {
			buildMessageDetail(message,authapply,operator,scontent);
		}
		return message;
	}

	private void buildMessageDetail(Message message, Authapply authapply, Operator operator, String scontent){
		MessageDetail detail = new MessageDetail();

		detail.setId(null);
		detail.setSsenderid(operator.getId());
		if (OPERATOR.OperatorType.ZDBSC.isEq(operator.getIoperatortype()))
			detail.setIsendertype(MESSAGE.OperatorOrAdmin.JDBSC.val());
		else if (OPERATOR.OperatorType.GSSPK.isEq(operator.getIoperatortype()))
			detail.setIsendertype(MESSAGE.OperatorOrAdmin.GSSPK.val());
		else if (OPERATOR.OperatorType.JRGLJ.isEq(operator.getIoperatortype()))
			detail.setIsendertype(MESSAGE.OperatorOrAdmin.JRJGJ.val());
		detail.setIreceivetype(MESSAGE.OperatorOrAdmin.MEMBER.val());
		detail.setSreceiveid(authapply.getId());
		detail.setBisread(Consts.BoolType.NO.val());
		detail.setIcount(0);
		detail.setBisdelete(Consts.BoolType.NO.val());
		detail.setBissendok(Consts.BoolType.YES.val());
		detail.setStitle("");
		detail.setScontext(scontent);
		detail.setDsenddatetime(new Date());
		detail.setSmessageid(message.getId());

		this.messageDetailDao.save(detail);

	}

}
