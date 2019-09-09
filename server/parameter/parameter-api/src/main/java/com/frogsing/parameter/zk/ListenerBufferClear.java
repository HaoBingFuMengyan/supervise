package com.frogsing.parameter.zk;

import com.frogsing.heart.spring.SpringContextHolder;
import org.I0Itec.zkclient.IZkDataListener;
import org.I0Itec.zkclient.ZkClient;

import java.util.Map;

public class ListenerBufferClear implements IZkDataListener {

	private Map<String, INodeListener> map ;
	public ListenerBufferClear(ZkClient zkc){


		map= SpringContextHolder.getBeans(INodeListener.class);
		for(Map.Entry<String,INodeListener>i:map.entrySet()) {
			if (!zkc.exists(i.getValue().getNode()))
				zkc.createPersistent(i.getValue().getNode(), "");
			zkc.subscribeDataChanges(i.getValue().getNode(), this);
		}


		
	}
	@Override
	public void handleDataChange(String dataPath, Object data) throws Exception {

		if(map==null)
			return;
		for(Map.Entry<String,INodeListener>i:map.entrySet()) {
			if(dataPath.equals(i.getValue().getNode())){
				i.getValue().OnChange(data);
			}
		}
//		switch (dataPath)
//		{
//			case ZookeeperClient.znode_syspara:{
//				ParaUtils.clearAll();
//				break;
//			}
//			/*case ZookeeperClient.znode_article:{
//				display.clearAll();
//				break;
//			}
//			case ZookeeperClient.znode_category:{
//				ParaUtils.clearAll();
//				break;
//			}
//			case ZookeeperClient.znode_layoutdetail:{
//				ParaUtils.clearAll();
//				break;
//			}*/
//		}

	}

	@Override
	public void handleDataDeleted(String dataPath) throws Exception {
		for(Map.Entry<String,INodeListener>i:map.entrySet()) {
			if(dataPath.equals(i.getValue().getNode())){
				i.getValue().OnDelete();
			}
		}
//		public final  String node_syspara="/frogsing.syspara";
//		public final  String node_layout="/frogsing.layout";
//		public final  String[]{node_syspara,node_layout};
//
	}
	
	

}
