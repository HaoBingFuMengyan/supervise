package com.frogsing.heart.persistence;

import com.frogsing.heart.utils.R;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import java.util.function.Supplier;

/**
 * Created by fanyijie on 2017/11/14.
 */
public   class XSpec<T> implements Specification<T>  ,Serializable{

    private Class<T> cls;
    public  XSpec(Class<T> t){
        cls=t;
    }


    private Map<String, Object> searchParams = Maps.newHashMap();

    List<SearchFilter> searchFilterList= Lists.newArrayList();
    List<SearchFilter> searchOrList= Lists.newArrayList();
    List<String> fetchs=Lists.newArrayList();
    public XSpec<T> and(SearchFilter ... sfs ){


       for(SearchFilter sf:sfs){
           searchFilterList.add(sf);
       }
       return this;
    }

    public XSpec<T> or(SearchFilter ... sfs ){



        for(SearchFilter sf:sfs){
            searchOrList.add(sf);
        }
        return this;
    }
    public XSpec<T> and(Map<String, Object> map){

        searchParams.putAll(map);
        return this;
    }
    public XSpec<T> and(String key, Object val){

        searchParams.put(key,val);
        return this;
    }
    public  XSpec<T> fetch(String ...fetch){
        for(String f:fetch){
            fetchs.add(f);
        }

        return this;
    }


    @Override
    public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

       // query.distinct(true);
        Collection<SearchFilter> alls = SearchFilter.parse(searchParams).values();
        Set<SearchFilter> x= Sets.newHashSet(alls);
        x.addAll(searchFilterList);

        Set<SearchFilter> y= Sets.newHashSet(searchOrList);



        Specification<T> rs = DynamicSpecifications.bySearchFilter(x, null,fetchs.toArray(new String[fetchs.size()]));

        Specification<T> orRs = DynamicSpecifications.byOrFilter(y, null);

        return cb.and(rs.toPredicate(root, query, cb),orRs.toPredicate(root, query, cb));
    }


    public Class<T> getCls() {
        return cls;
    }
}
