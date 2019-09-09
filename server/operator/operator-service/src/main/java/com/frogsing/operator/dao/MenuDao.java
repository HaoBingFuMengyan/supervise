package com.frogsing.operator.dao;
//frogsingcode//
//

import java.util.Collection;
import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;

import com.frogsing.heart.jpa.BaseDao;
import com.frogsing.operator.po.Menu;

//frogsingcode//
public interface MenuDao extends BaseDao<Menu, String>{
//frogsingcode//
	@Query("select p from Menu p where p.isort>?1 and p.isort<?2 order by p.isort")
	List<Menu> getZhongJian(long isort, long isort2);
	
	@Query("select p from  Menu p where p.sparentid = ?1 ")
	List<Menu> getMenuByParentId(String parentid, Sort sort);

	@Query("select count(*) from Menu m where m.sname=?1 and m.sparentid=?2 and m.id=?3")
	long count(String sname, String sparentid, String id);
			
	@Query("select count(*) from Menu m where m.sname=?1 and m.sparentid=?2 ")
	long count(String sname, String sparentid);

	@Query("select distinct p.sparentid from Role ro join ro.purviewList p  where ro.id in (select r.id from  Operator o   join o.roleList r  where o.id=?1 )")
	Collection<String> getAllMenuIdByOperatorId(String operatorid);
	
	

//frogsingcode//
}

