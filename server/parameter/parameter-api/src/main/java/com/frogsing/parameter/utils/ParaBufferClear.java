package com.frogsing.parameter.utils;

import com.frogsing.heart.spring.SpringContextHolder;
import com.frogsing.parameter.zk.INodeListener;
import com.frogsing.parameter.zk.ZookeeperClient;

/**
 * Created by fanyijie on 2017/10/18.
 */
public class ParaBufferClear implements INodeListener {
    @Override
    public String getNode() {
        return "/frogsing.para";
    }

    @Override
    public void OnChange(Object data) {
        ParaUtils.clearcache();
    }

    @Override
    public void OnDelete() {

    }

    public static void  clear(){

        //ZookeeperClient.clearCache(SpringContextHolder.getBean(ParaBufferClear.class).getNode());


    }

}
