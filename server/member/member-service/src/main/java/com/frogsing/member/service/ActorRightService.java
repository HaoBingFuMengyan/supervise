package com.frogsing.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.frogsing.member.IActorRightService;
import com.frogsing.member.dao.ActorRightDao;

@Component
@Transactional
public class ActorRightService  implements IActorRightService {

	@Autowired
	private ActorRightDao actorRightDao;

	
	
	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IActorRightService#findSpurviewidBySroleid(java.lang.String)
	 */
	@Override
	public List<String> findSpurviewidBySroleid(String sroleid){
		return actorRightDao.findSpurviewidBySroleid(sroleid);
	}



	
	
}