package com.frogsing.parameter.zk;

import org.I0Itec.zkclient.ZkClient;

public class ZooBuffer  implements IZoo {
	
	/**
	 * 监听系统参数是否有变化的
	 */
	   
	@Override
	public void InitBufferWatch(ZkClient zkc) {
		new ListenerBufferClear(zkc);
	}

	
	@Override
	public void InitLeaderElection(ZkClient zkc) {
		
	}

	@Override
	public boolean isLeader() {
		return false;
	}

	@Override
	public void triggerTaskComing() {

	}


}
