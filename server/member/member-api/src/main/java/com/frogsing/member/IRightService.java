package com.frogsing.member;


import com.frogsing.member.po.Right;

import java.util.Collection;
import java.util.List;

public interface IRightService  {


	boolean copyRight(String nodeId, String targetId);

	List<Right> findByIpurtype(int iroletype);

	Collection<String> findRoleRight(String sroleid);

    void sortUp(String id);
}
