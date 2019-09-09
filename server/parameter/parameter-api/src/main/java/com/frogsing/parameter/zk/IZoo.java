package com.frogsing.parameter.zk;

import org.I0Itec.zkclient.ZkClient;

public interface IZoo {
	
	void InitBufferWatch(ZkClient zkc);
	void InitLeaderElection(ZkClient zkc);
	boolean isLeader();
	void  triggerTaskComing();

}
