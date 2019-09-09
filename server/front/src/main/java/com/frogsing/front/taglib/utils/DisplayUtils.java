/** 
 * Filename GoodsSearchUtils.java
 * Create on 2014-7-15
 * Copyright 2011 Frogsing All Rights Reserved.
 */
package com.frogsing.front.taglib.utils;

/**
 * Description:
 * 
 * @author <a href="mailto:service@frogsing.com">Sandy</a>
 * @since version1.0
 */
public class DisplayUtils {
//	
//	public static enum CacheType{
//		day,
//		hour,
//		month,
//		now
//	}
//
//	private static Map<String, Object> map = new HashMap<String, Object>();
//	private static Object o = new Object();
//	
//	private static IQueryService queryService;
//	private static ICategoryService categoryService;
//	private static ICategoryMinService categoryMinService;
//	private static IWarehouseService warehouseService;
//	private static ICommodityService commodityService;
//	private static ICommodityMinService commodityMinService;
//	//private static ArticleService articleService;
//	private static ILayoutService layoutService;
//	private static IResourceStockService resourceStockService;
//	private static IContractDetailService contractDetailService;
//	private static IProductorService productorService;
//	//private static CoalResourceStockService coalResourceStockService;
//	//private static TKSResourceStockService tksResourceStockService;
//	//private static TotalService totalService;
//	
//	static{
//		layoutService = SpringContextHolder.getBean(ILayoutService.class);
//		queryService = SpringContextHolder.getBean(IQueryService.class);
//		categoryService = SpringContextHolder.getBean(ICategoryService.class);
//		warehouseService = SpringContextHolder.getBean(IWarehouseService.class);
//		commodityService = SpringContextHolder.getBean(ICommodityService.class);
//		//articleService = SpringContextHolder.getBean(ArticleService.class);
//		resourceStockService = SpringContextHolder.getBean(IResourceStockService.class);
//		contractDetailService = SpringContextHolder.getBean(IContractDetailService.class);
//		productorService = SpringContextHolder.getBean(IProductorService.class);
//		commodityMinService = SpringContextHolder.getBean(ICommodityMinService.class);
//		categoryMinService = SpringContextHolder.getBean(ICategoryMinService.class);
//		//totalService = SpringContextHolder.getBean(TotalService.class);
//	}
//	
//	@SuppressWarnings("unchecked")
//	public static List<Country> findCountry() {
//		String key = DisplayUtils.nowkey("Country");
//		if (!map.containsKey(key)) {
//			synchronized (o) {
//				if (map.containsKey(key))
//					return (List<Country>) map.get(key);
//				List<Country> ss = queryService.findAll(Country.class,null,
//						PageSort.Desc(
//								Colums.sys_country.biscommon).asc(Colums.sys_country.isort));
//				DisplayUtils.remove("Country");
//				map.put(key, ss);
//			}
//		}
//		return (List<Country>) map.get(key);
//	}
//	
//	@SuppressWarnings("unchecked")
//	public static List<Productor> findProductor(int site) {
//		String key = DisplayUtils.nowkey("Productor_"+site);
//		if (!map.containsKey(key)) {
//			synchronized (o) {
//				if (map.containsKey(key))
//					return (List<Productor>) map.get(key);
//				List<Productor> ss = productorService.list(null,
//						PageSort.Desc(sp_productor.biscommon).asc(Colums.sp_productor.isort),
//						SearchFilter.eq(sp_productor.isitetype, site));
//				DisplayUtils.remove("Productor_"+site);
//				map.put(key, ss);
//			}
//		}
//		return (List<Productor>) map.get(key);
//	}
//	
//	@SuppressWarnings("unchecked")
//	public static List<Layout> findLayoutByType(int type,CacheType cash){
//		switch (cash) {
//		case now:
//			return layoutService.findLayoutByPosition(type);
//		default:
//			String key=DisplayUtils.buildKey(cash,"Layout_Type_"+type);
//			if (!map.containsKey(key)) {
//				synchronized (o) {
//					if (map.containsKey(key))
//						return (List<Layout>) map.get(key);
//					List<Layout> ss = layoutService.findLayoutByPosition(type);
//					DisplayUtils.remove("Layout_Type_"+type);
//					map.put(key, ss);
//				}
//			}
//			return (List<Layout>) map.get(key);
//		}
//		
//	}
//	
//	public static Layout findLayoutByCode(String code,CacheType cash){
//		switch (cash) {
//		case now:
//			return layoutService.findByCode(code);
//		default:
//			String key=DisplayUtils.buildKey(cash,"Layout_Code_"+code);
//			if (!map.containsKey(key)) {
//				synchronized (o) {
//					if (map.containsKey(key))
//						return (Layout) map.get(key);
//					Layout ss = layoutService.findByCode(code);
//					DisplayUtils.remove("Layout_Code_"+code);
//					map.put(key, ss);
//				}
//			}
//			return (Layout) map.get(key);
//		}
//		
//	}
//
//	@SuppressWarnings("unchecked")
//	public static List<CategoryMin> findCategory(int site,String parent) {
//		String key = DisplayUtils.nowkey("Category_"+site+"_"+parent);
//		if (!map.containsKey(key)) {
//			synchronized (o) {
//				if (map.containsKey(key))
//					return (List<CategoryMin>) map.get(key);
//				Map<String,Object> sh=new HashMap<String, Object>();
//				sh.put("search_eq_"+sp_category.isitetype, site);
//				if(B.Y(parent)){
//					sh.put("search_eq_"+sp_category.biscommon, Consts.BoolType.YES.val());
//					sh.put("search_ne_"+sp_category.sparentid, "0");
//				}else
//					sh.put("search_eq_"+sp_category.sparentid, parent);
//				List<CategoryMin> ss=categoryMinService.findNoChildren(site);
//				//List<Category> ss = categoryService.findNoChildren();
//				DisplayUtils.remove("Category_"+site+"_"+parent);
//				map.put(key, ss);
//			}
//		}
//		return (List<CategoryMin>) map.get(key);
//	}
//	
//	//查找品种大类
//	@SuppressWarnings("unchecked")
//	public static List<Category> findBigCategory(int site) {
//		String key = DisplayUtils.nowkey("BigCategory_"+site);
//		if (!map.containsKey(key)) {
//			synchronized (o) {
//				if (map.containsKey(key))
//					return (List<Category>) map.get(key);
//				List<Category> ss = categoryService.findBigCategory(site);
//				DisplayUtils.remove("BigCategory_"+site);
//				map.put(key, ss);
//			}
//		}
//		return (List<Category>) map.get(key);
//	}
//
//	@SuppressWarnings("unchecked")
//	public static List<CommodityMin> findCommondity(int site,String parent) {
//		String key = DisplayUtils.nowkey("Commondity_"+site+"_"+parent);
//		if (!map.containsKey(key)) {
//			synchronized (o) {
//				if (map.containsKey(key))
//					return (List<CommodityMin>) map.get(key);
//				Map<String,Object> sh=new HashMap<String, Object>();
//				sh.put("search_eq_isitetype", site);
//				if(B.Y(parent))
//					sh.put("search_eq_biscommon", Consts.BoolType.YES.val());
//				else
//					sh.put("search_eq_scategoryid", parent);
//				List<CommodityMin> ss = commodityMinService.findAll(sh,PageSort.Desc( sp_commodity.biscommon));
//				DisplayUtils.remove("Commondity_"+site+"_"+parent);
//				map.put(key, ss);
//			}
//		}
//		return (List<CommodityMin>) map.get(key);
//	}
//	
//	@SuppressWarnings("unchecked")
//	public static List<Commodity> findCommondityByCategoryId(String categoryid,int limit,int site) {
//		String key = DisplayUtils.nowkey("Commondity_"+categoryid+"_"+limit);
//		if (!map.containsKey(key)) {
//			synchronized (o) {
//				if (map.containsKey(key))
//					return (List<Commodity>) map.get(key);
//				List<Commodity> ss = Lists.newArrayList();
//				if(limit == -1){
//					Map<String,Object> map=new HashMap<String, Object>();
//					map.put("search_eq_"+sp_commodity.scategoryid, categoryid);
//					map.put("search_eq_isitetype", site);
//					ss = commodityService.findAll(map, PageSort.Desc(sp_commodity.biscommon));
//				}else
//					ss = commodityService.findFiltersLimit(PageSort.Desc(sp_commodity.biscommon), limit, SearchFilter.eq(sp_commodity.scategoryid, categoryid),SearchFilter.eq(sp_commodity.isitetype,site));
//				DisplayUtils.remove("Commondity");
//				map.put(key, ss);
//			}
//		}
//		return (List<Commodity>) map.get(key);
//	}
//	
//	public static List<ContractDetail> findCommodityMatchByCategoryCode(String categorycode,int limit){
//		List<ContractDetail> list= contractDetailService.findFiltersLimit(
//				PageSort.Desc( ht_contractdetail.dadddate), limit, SearchFilter.like(ht_contractdetail.scategorysystemcode, categorycode+"%"));
//		return list;
//	}
//	
//	
//	/**
//	 * 查找某一品种下的品名，并按成交量排序
//	 * @param categorycode
//	 * @param limit
//	 * @return
//	 */
//	public static List<Commodity> findCommondityByCategoryCode(String categorycode,int limit) {
//		return commodityService.findFiltersLimit(PageSort.Desc(sp_commodity.fmatchweight), limit, SearchFilter.like(sp_commodity.scategorysystemcode, categorycode+"%"));
//	}
//	
//	/**
//	 * 查找某一品种的挂牌资源
//	 * @param categorycode
//	 * @param limit
//	 * @return
//	 */
//	public static List<Resourcestock> findSaleResource(String scommodityname,int limit){
//			return resourceStockService.findFiltersLimit(PageSort.Desc( vw_resourcestock.dmodifydate), limit, SearchFilter.like(vw_resourcestock.scommodityname, "%"+scommodityname+"%"),SearchFilter.gt(vw_resourcestock.ikeepnumber, 0),SearchFilter.gt(vw_resourcestock.fkeepweight, 0));
//	}
//	
//
//
//	@SuppressWarnings("unchecked")
//	public static List<Warehouse> findWarehouse(int site) {
//		String key = DisplayUtils.nowkey("Warehouse_"+site);
//		if (!map.containsKey(key)) {
//			synchronized (o) {
//				if (map.containsKey(key))
//					return (List<Warehouse>) map.get(key);
//				List<Warehouse> ss = warehouseService.findWarehouse(site);
//				DisplayUtils.remove("Warehouse_"+site);
//				map.put(key, ss);
//			}
//		}
//		return (List<Warehouse>) map.get(key);
//	}
//	
//	
////	/**
////	 * 根据栏目编号查找新闻列表
////	 * @param code
////	 * @param limit
////	 * @return
////	 */
////	public static List<Article> findArticleByNavCode(String code,int limit) {
////		return articleService.findLimitByNavigation(code, limit);
////	}
//
//	private static String nowkey(String key) {
//		return T.snow("yyyyMMdd") + "_" + key;
//	}
//	
//	private static String hourkey(String key) {
//		return T.snow("yyyyMMddHH") + "_" + key;
//	}
//	
//
//	private static void remove(String key) {
//		for(Entry<String,Object> entry:map.entrySet()){
//			if(entry.getKey().endsWith("_"+key))
//				map.remove(entry);
//		}
//	}
//
//	
//	private static String buildKey(CacheType cash,String key){
//		switch (cash) {
//		case day:
//			return T.snow("yyyyMMdd") + "_" + key;
//		case hour:
//			return T.snow("yyyyMMddHH") + "_" + key;
//		case month:
//			return T.snow("yyyyMM") + "_" + key;
//		default:
//			return "_"+key;
//		}
//	}
//	
//	public static void clearcache(){
//		synchronized (o) {
//			map.clear();
//		}
//	}
//	
	
}
