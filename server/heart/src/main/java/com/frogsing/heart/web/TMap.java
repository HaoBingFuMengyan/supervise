package com.frogsing.heart.web;

import com.google.common.collect.Maps;

import java.io.Serializable;
import java.util.Map;

/**
 * Created by fanyijie on 2017/11/7.
 */
public class TMap implements Serializable {
    private Map<String,TNumberWeight> map= Maps.newLinkedHashMap();


    public Map<String, TNumberWeight> getMap() {
        return map;
    }

    public void setMap(Map<String, TNumberWeight> map) {
        this.map = map;
    }
}
