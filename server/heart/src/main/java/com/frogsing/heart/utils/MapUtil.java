package com.frogsing.heart.utils;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.apache.poi.hssf.record.formula.functions.IfFunc;

import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

@SuppressWarnings({ "unchecked", "rawtypes" })
public class MapUtil  
{  
    public static <K,V> Map<K, V>   
        sortByValue( Map<K, V> map )  
    {  
        List<Map.Entry<K, V>> list =  
            new LinkedList<Map.Entry<K, V>>( map.entrySet() );  
        Collections.sort( list, new Comparator<Map.Entry<K, V>>()  
        {  
            
			public int compare( Map.Entry<K, V> o1, Map.Entry<K, V> o2 )  
            {  
            	if(o1.getValue()==null)
            		return -1;
            	if(o2.getValue()==null)
            		return 1;
            	if(o1.getValue() instanceof Comparable  && o2.getValue() instanceof Comparable)
            		return ((Comparable)o1.getValue()).compareTo( o2.getValue() );  
            	else
            		return 0;
            }  
        } );  
  
        Map<K, V> result = new LinkedHashMap<K, V>();  
        for (Map.Entry<K, V> entry : list)  
        {  
            result.put( entry.getKey(), entry.getValue() );  
        }  
        return result;  
    }
    public  static <K,V,T> Map<K,T> toMap(List<V> list,Function<V, K> idFuc,Function<V, T> valueFuc){
        Map<K,T> map= Maps.newLinkedHashMap();
        list.forEach(x->{
            K k=idFuc.apply(x);
            map.put(k,valueFuc.apply(x));
        });
        return map;
    }
    public  static <K,V,T> Map<K,List<T>> toMapList(List<V> list,Function<V, K> idFuc,Function<V, T> valueFuc){
        Map<K,List<T>> map= Maps.newLinkedHashMap();
        list.forEach(x->{
            K k=idFuc.apply(x);
            List<T> tmp=map.get(k);
            if(tmp==null){
                tmp= Lists.newArrayList();
                map.put(k,tmp);
            }
           tmp.add(valueFuc.apply(x));
        });
        return map;
    }
}  