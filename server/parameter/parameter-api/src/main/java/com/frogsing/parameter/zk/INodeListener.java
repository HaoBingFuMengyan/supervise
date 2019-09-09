package com.frogsing.parameter.zk;

/**
 * Created by fanyijie on 2017/10/18.
 */
public interface INodeListener {
     /**
      * 监听的结点
      * @return
      */
     String getNode();
     void OnChange(Object data);
     void OnDelete();
}
