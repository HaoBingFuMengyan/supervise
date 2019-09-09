package com.frogsing.heart.jpa;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class PageUtils {

	static public final int MaxLimit=100;
	static public final int DefaultLimit=20;
	static public final String Limit="20";
	static public Pageable sumPage(HttpServletRequest request,int page, int size,String[] sumcols, String... sort){
		Object obj=request.getParameter("cmd_autoexport");
		if("1".equals(obj))
			size=10000;
		PageSumQuery p= new PageSumQuery(page,size,PageSort.parase(sort).ToSort(),sumcols);
		return p;
	}
	static public Pageable sumPage(HttpServletRequest request,int page, int size,Sort sort,String...sumcols){
		Object obj=request.getParameter("cmd_autoexport");
		if("1".equals(obj))
			size=10000;
		PageSumQuery p= new PageSumQuery(page,size,sort,sumcols);
		return p;
    
	}
	static public Pageable sumPage(int page, int size,String[] sumcols, String... sort){
		
		PageSumQuery p= new PageSumQuery(page,size,PageSort.parase(sort).ToSort(),sumcols);
		return p; 
	}
	static public Pageable sumPage(int page, int size,Sort sort,String...sumcols){
		
		PageSumQuery p= new PageSumQuery(page,size,sort,sumcols);
		return p;
    
	}
//	
	static public Pageable page(HttpServletRequest request,int page, int size){
		Object obj=request.getParameter("cmd_autoexport");
		PageQuery p;
		if(obj!=null&&obj.toString().equals("1"))
			p= new PageQuery(0,100000);
		else
			p= new PageQuery(page,size);
		
		return p;
    
	}
	static public Pageable page(HttpServletRequest request,int page, int size, Map<String, Object> sorts){
		PageSort s=PageSort.parase(sorts);
		PageQuery p;
		Object obj=request.getParameter("cmd_autoexport");
		if(obj!=null&&obj.toString().equals("1"))
			p= new PageQuery(0,100000,s.ToSort());
		else
			p= new PageQuery(page,size,s.ToSort());
		return p;
	}
	
	
	
	static public Pageable page(int page, int size){
		
		PageQuery p= new PageQuery(page,size);
		
		return p;
    
	}
	/**
	 * 
	 * @param page
	 * @param size
	 * @param asc_prop asc_prop desc_prop
	 * @return
	 */
	static public Pageable page(int page, int size, String... asc_prop){
		Sort s=null;
		PageSort x = PageSort.parase(asc_prop);
		if(x!=null)
			s=x.ToSort();
		PageQuery p= new PageQuery(page,size,s);
		return p;
	}

	/**
	 *
	 * @param page
	 * @param size
	 * @param asc_prop asc_prop desc_prop
	 * @return
	 */
	static public Pageable jjpage(int page, int size, String... asc_prop){
		Sort s=null;
		PageSort x = PageSort.parase(asc_prop);
		if(x!=null)
			s=x.ToSort();
		if(page == 0)
			page=1;
		PageQuery p= new PageQuery(page-1,size,s);
		return p;
	}
	
	
//	private static int startToPage(int start,int limit)
//	{
//		return start/(limit<=0?DefaultLimit:(limit>MaxLimit?MaxLimit:limit));
//	}
//	static public Pageable extpage(int start,int limit){
//	
//		Pageable page= new PageQuery(startToPage(start,limit), limit);
//		
//		return page;
//    
//	}
	 
}
