package com.frogsing.heart.jpa;

import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;

public class PageSumQuery extends PageQuery {
	private String[] sumcols;

	public String[] getSumcols() {
		return sumcols;
	}

	public void setSumcols(String[] sumcols) {
		this.sumcols = sumcols;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 4650178705623319980L;

	public PageSumQuery(){

	}
	public PageSumQuery(int page, int size,String[] sumcols) {
		super(page,size);
		this.sumcols=sumcols;
	}

	/**
	 * Creates a new {@link PageSumQuery} with sort parameters applied.
	 * 
	 * @param page
	 * @param size
	 * @param direction
	 * @param properties
	 */
	public PageSumQuery(int page, int size, Direction direction,String[] sumcols, String... properties) {

		super(page,size,direction,properties);
		this.sumcols=sumcols;
	}

	/**
	 * Creates a new {@link PageSumQuery} with sort parameters applied.
	 * 
	 * @param page
	 * @param size
	 * @param sort
	 */
	public PageSumQuery(int page, int size, Sort sort,String[] sumcols) {
	
		super(page,size,sort);
		this.sumcols=sumcols;
		
	}
}
