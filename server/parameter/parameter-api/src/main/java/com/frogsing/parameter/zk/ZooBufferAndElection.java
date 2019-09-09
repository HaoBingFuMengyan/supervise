package com.frogsing.parameter.zk;

import org.I0Itec.zkclient.ZkClient;
import org.springframework.beans.factory.annotation.Value;

public class ZooBufferAndElection  implements IZoo {

	@Value("${dubbo.version}")
	private String sversion;

	private ListenerLeaderElection leaderListen;
	
	
	/**
	 * 监听系统参数是否有变化的
	 */
	   
	@Override
	public void InitBufferWatch(ZkClient zkc) {
		new ListenerBufferClear(zkc);
	}

	
	@Override
	public void InitLeaderElection(ZkClient zkc) {
		
		 leaderListen = new ListenerLeaderElection(zkc,sversion);
	}

	@Override
	public boolean isLeader() { 
		if(leaderListen==null)
			return false;
		return leaderListen.isLeader();
	}

	@Override
	public void triggerTaskComing() {
		leaderListen.triggerTaskComing();
	}


}
