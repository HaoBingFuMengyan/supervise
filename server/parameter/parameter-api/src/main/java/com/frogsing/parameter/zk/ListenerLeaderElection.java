package com.frogsing.parameter.zk;

import com.frogsing.heart.log.Lg;
import com.frogsing.heart.spring.SpringContextHolder;
import com.frogsing.heart.utils.T;
import org.I0Itec.zkclient.IZkDataListener;
import org.I0Itec.zkclient.IZkStateListener;
import org.I0Itec.zkclient.ZkClient;
import org.apache.zookeeper.Watcher.Event.KeeperState;

/**
 * 监听任务是主备
 * @author fanyijie
 *
 */
public class ListenerLeaderElection implements IZkDataListener ,IZkStateListener{


	private String sversion;


	private ZkClient zkc;
	private boolean bisLeader=false;
	private final String znode ;
	//+ (T.isDebug()?Props.get("dubbo.version"):"");
	public ListenerLeaderElection(ZkClient zkc,String sversion){
		this.zkc=zkc;
		this.sversion=sversion;
		znode="/frogsing.task."+ sversion;
	    tryLeader();
	    zkc.subscribeStateChanges(this);
	    zkc.subscribeDataChanges(znode, this);
	}
	@Override
	public void handleDataChange(String dataPath, Object data) throws Exception {
		
		Lg.act(String.format("收到任务执行通知!我%s%s执行者",bisLeader?"是":"不是",sversion));
		if(bisLeader){
			ITaskEvent taskEvent= SpringContextHolder.getBean(ITaskEvent.class);
			if(taskEvent!=null){
				taskEvent.newTaskComing();
			}
		}
	}

	@Override
	public void handleDataDeleted(String dataPath) throws Exception {
		 Lg.act("handleDataDeleted:"+dataPath);
		 tryLeader();
	}
	
	private void tryLeader() {
	
		   try{
			   zkc.createEphemeral(znode, T.snow());
			   bisLeader=true;
		   }catch (Exception e) {
			   bisLeader=false;
		   }
		Lg.act(String.format("定时任务结点发生变化!我%s%s的执行者",bisLeader?"是":"不是",sversion));
		
	}
	public boolean isLeader() {
		return bisLeader;
	}
	
	@Override
	public void handleStateChanged(KeeperState state) throws Exception {
	//	 Lg.act("handleStateChanged:"+state.toString()); 
//		if(state==KeeperState.Disconnected)
//			this.bisLeader=false;
		if(state==KeeperState.SyncConnected&&bisLeader==false){
			 tryLeader();
		}
	}
	@Override
	public void handleNewSession() throws Exception {
		
	}
	@Override
	public void handleSessionEstablishmentError(Throwable error) throws Exception {
		
	}

	/**
	 * 有任务消息,修改结点的值
	 */
	public void triggerTaskComing() {

		if(zkc.exists(znode))
			zkc.writeData(znode, T.now());

	}

	public void setSversion(String sversion) {
		this.sversion = sversion;
	}
}
