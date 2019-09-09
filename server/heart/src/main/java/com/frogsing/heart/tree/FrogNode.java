package com.frogsing.heart.tree;

import com.google.common.collect.Maps;

import java.io.Serializable;
import java.util.Collection;
import java.util.Map;

/**
 * Created by fanyijie on 2018/1/26.
 */
public class FrogNode<T> implements Serializable {



    FrogTree<T> tree;
    private  T t;


//    public FrogNode<T> getParent() {
//        return parent;
//    }
//    public void setParent(FrogNode<T> parent) {
//        this.parent = parent;
//    }

    FrogNode<T> parent;

    public T getObj(){
        if(tree.getHasObj())
         return t;
        else
            return null;
    }

    public Collection<FrogNode<T>> getChilds() {
        return childs.values();
    }

    Map<String,FrogNode<T>> childs = Maps.newLinkedHashMap();

   public String getId() {
        return tree._getIdFuc().apply(t);
    }
    public String getPid() {
        return tree._getPidFuc().apply(t);
    }
    public String getName() {
        return tree._getNameFuc().apply(t);
    }




    public boolean isLeaf() {
        return childs == null || childs.size() == 0;
    }

    public  boolean isRoot(){
        return parent==null;
    }
    public FrogNode(FrogTree<T> tree, T t)
    {
       this.tree=tree;
       this.t=t;
    }

    public FrogNode<T> addChild(FrogNode<T> x) {

        x.parent=this;
        this.childs.put(x.getId(),x);
        return x;
    }

}
