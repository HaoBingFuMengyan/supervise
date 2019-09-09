package com.frogsing.heart.jpa;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.google.common.collect.Maps;

public class SumPageImpl<T> extends PageResult<T> {

	private Map<String,Object> sum=Maps.newHashMap();
	

	public Map<String, Object> getSum() {
		
		
		return sum;
	}

	public void setSum(Map<String, Object> sum) {
		this.sum = sum;
	}

	public SumPageImpl(){

	}
	public SumPageImpl(List<T> content) {
		super(content);
	}

	public SumPageImpl(List<T> content, Pageable pageable, long total) {
		super(content, pageable, total);
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = -3047501096477184547L;

}
