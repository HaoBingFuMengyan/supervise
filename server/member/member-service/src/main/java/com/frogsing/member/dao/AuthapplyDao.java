package com.frogsing.member.dao;
//frogsingcode//


import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.member.po.Authapply;


//frogsingcode//
public interface AuthapplyDao extends BaseDao<Authapply, String>{
//frogsingcode//



	Authapply findBySmemberidAndIstatusAndIauthtype(String memberId,int istatus,int authtype);
	
	Authapply findBySmemberidAndIstatus(String memberId,int istatus);

//frogsingcode//
}

