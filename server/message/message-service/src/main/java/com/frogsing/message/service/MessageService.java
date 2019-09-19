package com.frogsing.message.service;


import com.frogsing.member.po.Member;
import com.frogsing.member.po.User;
import com.frogsing.message.IMessageService;
import com.frogsing.message.dao.MessageDao;
import com.frogsing.message.po.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.frogsing.exception.ServiceException;
import java.util.Arrays;

@Component
@Transactional
public class MessageService implements IMessageService {

	@Autowired
	private MessageDao messageDao;


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

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMessageService#sendTradeSiteMsg(java.lang.String, java.lang.String, com.frogsing.po.entity.hy.User)
	 */
	@Override
	public int sendTradeSiteMsg(String title, String msg, User o) {
		return 1;
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IMessageService#buildMessage(java.lang.String, java.lang.String)
	 */
	@Override
	public Message buildMessage(String title, String msg) {
		Message obj = new Message();
//		obj.setBisdelete(0);
//		obj.setBisread(0);
//		obj.setBissendok(1);
//		obj.setIcount(0);
//		obj.setDsenddatetime(T.now());
//		obj.setScontext(msg);
//		obj.setStitle(title);
//		messageDao.save(obj);
		return obj;
	}

}
