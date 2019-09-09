package com.frogsing.member;

import java.util.List;

import com.frogsing.member.po.ActorRight;

public interface IActorRightService {

	List<String> findSpurviewidBySroleid(String sroleid);

}