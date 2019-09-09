package com.frogsing.operator.dao;
//frogsingcode//
//
//
import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.operator.po.Purview;

//frogsingcode//
public interface PurviewDao extends BaseDao<Purview, String>{
//frogsingcode//
	List<Purview> findBySparentid(String id);

	
	@Query("select count(*) from Purview m where m.spurname=?1 and m.sparentid=?2 and m.id=?3")
	long count(String sname, String sparentid, String id);
			
	@Query("select count(*) from Purview m where m.spurname=?1 and m.sparentid=?2 ")
	long count(String sname, String sparentid);
//frogsingcode//
}

