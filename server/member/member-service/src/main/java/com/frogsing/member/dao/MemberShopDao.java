package com.frogsing.member.dao;
//frogsingcode//



import org.springframework.data.jpa.repository.Query;

import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.member.po.MemberShop;


//frogsingcode//

public interface MemberShopDao extends BaseDao<MemberShop, String>{
//frogsingcode//
	
	//根据shopname和状态统计条数
	@Query("SELECT COUNT(1) FROM MemberShop WHERE sShopName=?1 AND iStatus=?2")
	long countByShopNameAndStatus(String sShopName,int iStatus);

	MemberShop findBySmemberid(String smemberid);


//frogsingcode//
}

