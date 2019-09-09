package com.frogsing.heart.tree;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

/**
 * Created by fanyijie on 2018/1/26.
 */
public class FrogTree<T> implements Serializable{


    private boolean hasObj=false;
    public List<FrogNode<T>> getRoot() {
        return root;
    }

    public void setRoot(List<FrogNode<T>> root) {
        this.root = root;
    }

    List<FrogNode<T>> root= Lists.newArrayList();

    public Function<T, String> _getIdFuc() {
        return idFuc;
    }

    public Function<T, String> _getPidFuc() {
        return pidFuc;
    }

    public Function<T, String> _getNameFuc() {
        return nameFuc;
    }

    Function<T, String>  idFuc;
    Function<T, String>  pidFuc;
    Function<T, String>  nameFuc;

    private   FrogTree(List<T> list,Function<T, String> idFuc,Function<T, String> pidFuc,Function<T, String> nameFuc){
        this.idFuc=idFuc;
        this.nameFuc=nameFuc;
        this.pidFuc=pidFuc;
        Map<String,FrogNode<T>> map= Maps.newLinkedHashMap();
        list.forEach(x->{
            FrogNode<T> t=new FrogNode<>(this,x);
            map.put(t.getId(),t);
        });

        map.forEach((k,v)->{
            FrogNode<T> parent=map.get(v.getPid());
            if(parent==null)
               root.add(v);
            else{
                parent.addChild(v);
            }
        });
    }

    public static <T> FrogTree<T> build(List<T> list, Function<T, String> idFuc, Function<T, String> pidFuc, Function<T, String> nameFuc)
    {
        return new FrogTree<T>(list,idFuc,pidFuc,nameFuc);
    }

    public void setHasObj(boolean hasObj) {
        this.hasObj = hasObj;
    }

    public boolean getHasObj() {
        return this.hasObj;
    }
}
