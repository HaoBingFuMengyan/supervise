package com.frogsing.heart.jpa;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.NullHandling;
import org.springframework.data.domain.Sort.Order;

import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.K;
import com.frogsing.heart.utils.MapUtil;
import com.google.common.collect.Lists;

public class PageSort  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1756965624881781591L;
	private List<PageOrder> list;
	public static PageSort Asc(String property){
		PageSort s=new PageSort();
		s.list=Lists.newArrayList(PageOrder.asc(property));
		return s;
	}
	public static PageSort Desc(String property){
		PageSort s=new PageSort();
		s.list=Lists.newArrayList(PageOrder.desc(property));
		return s;
	}
	public  PageSort asc(String property){
		list.add(PageOrder.asc(property));
		return this;
	}
	public  PageSort desc(String property){
		list.add(PageOrder.desc(property));
		return this;
	}
	
	public List<PageOrder> getList() {
		return list;
	}

	public void setList(List<PageOrder> list) {
		this.list = list;
	}
/**
 * 构造PageSort 根据PageOrder List
 *  * @param list
 */
	public PageSort(List<PageOrder> list) {
		this.list=list;
	}
	public PageSort() {
		
		
	}
	
	public static class PageOrder implements Serializable{
		
		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
		public PageOrder(){
			
		}
		
		public static PageOrder asc(String property){
			/**
			 * 参考 spring data Order;
			 */
			return new PageOrder(Direction.ASC, property,false,null );
		}
		public static PageOrder desc(String property){
			/**
			 * 参考 spring data Order;
			 */
			return new PageOrder(Direction.DESC, property,false,null );
		}
		public PageOrder(Direction direction,String property,boolean ignoreCase,NullHandling nullHandling){
			this.direction=direction;
			this.property=property;
			this.ignoreCase=ignoreCase;
			this.nullHandling=nullHandling;
		}
		private  Direction direction;
		private  String property;
		private  boolean ignoreCase;
		private  NullHandling nullHandling;
		public Direction getDirection() {
			return direction;
		}
		public void setDirection(Direction direction) {
			this.direction = direction;
		}
		public String getProperty() {
			return property;
		}
		public void setProperty(String property) {
			this.property = property;
		}
		public boolean isIgnoreCase() {
			return ignoreCase;
		}
		public void setIgnoreCase(boolean ignoreCase) {
			this.ignoreCase = ignoreCase;
		}
		public NullHandling getNullHandling() {
			return nullHandling;
		}
		public void setNullHandling(NullHandling nullHandling) {
			this.nullHandling = nullHandling;
		}
		
	}

	public Sort ToSort() {
		if(list==null||list.size()==0)
			return null;
		List<Order> orderlist=Lists.newArrayList();
		for(PageOrder po:this.getList()){
			
			Order order=new Order(po.getDirection(),po.getProperty(),po.getNullHandling());
			if(po.isIgnoreCase())
				 order=order.ignoreCase();
			orderlist.add(order);
		}
		Sort s=new Sort(orderlist);
		return s;
	}

	public static PageSort build(Sort sort) {
		if(sort==null)
			return null;
		List<PageOrder> orderlist=Lists.newArrayList();
		for( Order s:sort){
			
			PageOrder o=new PageOrder(s.getDirection(), s.getProperty(), s.isIgnoreCase(), s.getNullHandling());
			orderlist.add(o);
		}
		PageSort psort=new PageSort(orderlist);
		return psort;
	}
	/**
	 * @param sort 例子: desc_time
	 * @param sort
	 * @return
	 */
//	static public Sort stringToSort(String... asc_prop){
//		Sort ss=null;
//		if(asc_prop != null && asc_prop.length>0)
//		{
//			List<Order> orders=Lists.newArrayList();
//			for(String sort:asc_prop){
//				if(B.Y(sort))
//					continue;
//				String [] keys=sort.split("_");
//				Direction direct=Direction.DESC;
//				if("asc".equalsIgnoreCase(keys[0]))
//					direct=Direction.ASC;
//				orders.add(new Order(direct, keys[1]));
//			}
//			if(orders.size() != 0)
//				ss= new Sort(orders);
//		}
//		return ss;
//    
//	}
	static public PageSort parase(String ...asc_prop){
		PageSort ss=null;
		if(asc_prop != null && asc_prop.length>0)
		{
			List<PageOrder> orders=Lists.newArrayList();
			for(String sort:asc_prop){
				if(B.Y(sort))
					continue;
				String [] keys=sort.split("_");
				PageOrder od;
				if("asc".equalsIgnoreCase(keys[0]))
					od=PageOrder.asc(keys[1]);
				else
					od=PageOrder.desc(keys[1]);
				orders.add(od);
			}
			ss= new PageSort(orders);
		}
		return ss;
    
	}
	
	static public PageSort parase(Map<String,Object> map){
		Map<String, Object> rs = MapUtil.sortByValue(map);
		Set<String> sets = rs.keySet();
		PageSort o=new PageSort();
		for(String k:sets){
			if(k.indexOf("asc")==0){
				o.asc(k.split("_")[1]);
			}
			else{
				o.desc(k.split("_")[1]);
			}
		}
		return o;
    
	}
	
}
