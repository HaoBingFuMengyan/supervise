package com.frogsing.parameter.zk;

import com.frogsing.heart.log.Lg;
import com.frogsing.heart.spring.SpringContextHolder;
import com.frogsing.heart.utils.T;
import org.I0Itec.zkclient.ZkClient;


public class ZookeeperClient {

	final static public String znode_syspara= "/frogsing.syspara";
	final static public String znode_article= "/frogsing.article";
	final static public String znode_category= "/frogsing.category";
	final static public String znode_layoutdetail= "/frogsing.layoutdetail";
	
private ZkClient zkc;
	
	
   public ZookeeperClient(final String servers) {


       zkc = new ZkClient(servers);
       
       IZoo zoo= SpringContextHolder.getBean(IZoo.class);
       zoo.InitBufferWatch(zkc);//初始化缓存监听
       zoo.InitLeaderElection(zkc);//选举监听
   }

   public ZkClient getZkClient() {


       return zkc;
   }

    public static  void clearCache(String node){

        ZkClient zkc= SpringContextHolder.getBean(ZookeeperClient.class).getZkClient();
        if(zkc==null)
        {
            Lg.act("zkc 为空,请初始化zookeeper");
            return;
        }
        if(!zkc.exists(node))
        {
            Lg.act(node+"不存在");
            return;
        }
        zkc.writeData(node, T.snow());
    }
  
}