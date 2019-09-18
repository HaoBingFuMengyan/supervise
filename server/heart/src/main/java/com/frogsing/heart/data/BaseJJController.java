package com.frogsing.heart.data;

import com.frogsing.heart.entity.BaseEntity;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.ext.ExtResult;
import com.frogsing.heart.jpa.PageUtils;
import com.frogsing.heart.json.JsonUtils;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.Layer;
import com.frogsing.heart.web.Msg;
import com.frogsing.heart.web.Servlets;
import com.frogsing.heart.web.login.ILoginUser;
import com.google.common.collect.Maps;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)，
 *
 * 真正登录的POST请求由Filter完成,
 *
 * /dt/infoconfig/list.shtml
 *
 *
 * @frogsing van
 */
public abstract class BaseJJController {

	public abstract IDataService getService();
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@ModelAttribute
	public void prepareData(
			@PathVariable String obj,
			@RequestParam(value = "id", defaultValue = "") String id,
			Model model,HttpServletRequest request) throws IllegalAccessException, InstantiationException {
		//model data 的 po
		if (B.N(id)) {
			obj=obj.toLowerCase();
			Class cls = ClsMap.getEntityClass(obj);
			if(cls==null)
				E.S("未知对象:"+obj);
			BaseEntity data=getService().fetchOne(cls, id);
			if(data==null)
				E.S("非法id操作!");
			model.addAttribute("data", data);

		}
		else{
			obj=obj.toLowerCase();
			Class cls = ClsMap.getEntityClass(obj);
			if(cls==null)
				E.S("未知对象:"+obj);
			model.addAttribute("data", cls.newInstance());

		}

	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/{obj}/save.json")
	@ResponseBody
	public ExtResult save(
			String id,
			@PathVariable String obj,
			@ModelAttribute("data") BaseEntity vo,
			Model model,RedirectAttributes rmodel,
			ServletRequest request) {
		obj=obj.toLowerCase();
		Class cls = ClsMap.getEntityClass(obj);
		if(cls==null)
			E.S("未知对象:"+obj);
		String r;
		if (B.Y(id))
			r=obj + ":" + "add";
		else
			r=obj + ":" + "edit";
		SecurityUtils.getSubject().checkPermission(r);
		ILoginUser u = ShiroUtils.getCurrentUser();
		getService().save(vo,u);
		return ExtResult.success( "帮你保存好了!");

	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/{obj}/save.shtml")
	public String saveit(
			String id,
			@PathVariable String obj,
			@ModelAttribute("data") BaseEntity vo,
			Model model,RedirectAttributes rmodel,
			ServletRequest request) {
		obj=obj.toLowerCase();
		Class cls = ClsMap.getEntityClass(obj);
		try{
			if(cls==null)
				E.S("未知对象:"+obj);
			String r;
			if (B.Y(id))
				r=obj + ":" + "add";
			else
				r=obj + ":" + "edit";
			SecurityUtils.getSubject().checkPermission(r);
			ILoginUser u = ShiroUtils.getCurrentUser();
			getService().save(vo,u);
			Msg.success(model, "保存成功了!", 0);
			return Layer.close();
		}

		catch (Exception e) {
			Msg.error(model, e);
			Map<String, Object> rs = getService().fetchOneForUpate(vo);
			Object olddata = rs.get("data");
			rs.remove("data");
			model.addAllAttributes(rs);
			model.addAttribute("olddata",olddata);
		}

		return dir(cls,"detail");
	}

	private String  dir(Class<?> cls,String page){
		return String.format("/%s/%s-%s", cls.getName().split("\\.")[2],cls.getSimpleName().toLowerCase(),page);
	}

	@RequestMapping(value = "/{obj}/list.json")
	@ResponseBody
	public String list(
			@PathVariable String obj,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "limit", defaultValue = PageUtils.Limit) int limit,
			@RequestParam(value = "sort", defaultValue = "") String[] sort,Model model,
			ServletRequest request) {
		obj=obj.toLowerCase();
		Class<?> cls = ClsMap.getEntityClass(obj);
		if(cls==null)
			E.S("未知对象:"+obj);
		checkPermissionQuery(request,obj);

		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, model);
		Map<String, Object> rs = fetchPageData(model, cls, page-1, limit, sort, searchParams);
		Page<?> list=(Page<?>)rs.get("list");
		rs.remove("list");
		rs.put("data",list.getContent());
		rs.put("code",0);
		rs.put("msg","");
		rs.put("count",list.getTotalElements());


		return JsonUtils.Object2Json(rs);

	}
	@RequestMapping(value = "/{obj}/detail.shtml")
	public String detail_page(
			@PathVariable String obj,
			@ModelAttribute("data") BaseEntity vo,Model model,
			ServletRequest request) {
		SecurityUtils.getSubject().checkPermission(
				obj + ":" + "query");
		/**
		 * 1.prepareData 执行,准备 查看 或 修改 的添加的数据 fetchOne, 新增: 构造obj ,fetchOne ,
		 * 2.转到detail页面
		 */
		Map<String, String[]> map = request.getParameterMap();
		for(Map.Entry<String,String[]>  e:map.entrySet()){
			model.addAttribute(e.getKey(),e.getValue()[0]);
		}
		Map<String, Object> rs = getService().fetchOneForUpate(vo);
		Object x = rs.get("data");
		if (x != null) {
			rs.remove("data");
			BeanUtils.copyProperties(x, vo);
		}
		model.addAllAttributes(rs);
		return dir(vo.getClass(),"detail");
	}
	@RequestMapping(value = "/{obj}/detail.json")
	@ResponseBody
	public String detail(
			@PathVariable String obj,
			@ModelAttribute("data") BaseEntity vo, Model model,
			ServletRequest request) {

		SecurityUtils.getSubject().checkPermission(
				obj + ":" + "query");
//		Map<String, String[]> map = request.getParameterMap();
//		for(Map.Entry<String,String[]>  e:map.entrySet()){
//			model.addAttribute(e.getKey(),e.getValue()[0]);
//		}
		Map<String, Object> rs = getService().fetchOneForUpate(vo);
		Object x = rs.get("data");
		if (x != null) {
			//rs.remove("data");
			//BeanUtils.copyProperties(x, vo);
		}
		return JsonUtils.Object2Json(rs);

	}

	@RequestMapping(value = "/{obj}/delete.json")
	@ResponseBody
	public ExtResult deleteit(
			@PathVariable String obj,
			@RequestParam(value = "ids", defaultValue = "")
					String[] ids) {


		obj=obj.toLowerCase();
		Class<? extends BaseEntity> cls = ClsMap.getEntityClass(obj);
		if(cls==null)
			E.S("未知对象:"+obj);
		ILoginUser u = ShiroUtils.getCurrentUser();
		SecurityUtils.getSubject().checkPermission(
				obj + ":" + "delete");
		getService().deleteit(cls,ids,u);
		return ExtResult.success("已经帮你删除了!");

	}


	@RequestMapping(value = "/{obj}/{page}.shtml")
	public String page(@PathVariable String obj,@PathVariable String page,Model model,@ModelAttribute("data") BaseEntity vo, ServletRequest request){
		//checkPermissionQuery(request,obj);
		Class<? extends BaseEntity> cls = ClsMap.getEntityClass(obj);
		if(cls==null)
			E.S("未知对象:"+obj);
		Map<String, String[]> map = request.getParameterMap();
		for(Map.Entry<String,String[]>  e:map.entrySet()){
			model.addAttribute(e.getKey(),e.getValue()[0]);
		}
		return dir(cls,page);
	}
	@RequestMapping(value = "/{obj}/{op}.json")
	@ResponseBody
	public ExtResult op(@PathVariable String obj, @PathVariable String op, Model model, @ModelAttribute("data") BaseEntity vo,
                        @RequestParam(value = "page", defaultValue = "1") int page,
                        @RequestParam(value = "limit", defaultValue = PageUtils.Limit) int limit,
                        @RequestParam(value = "sort", defaultValue = "") String[] sort,
                        ServletRequest request){
		checkPermission(request,obj,op);

		Class<? extends BaseEntity> cls = ClsMap.getEntityClass(obj);
		if(cls==null)
			E.S("未知对象:"+obj);
		Map<String, Object> data = fetchOpData(model, cls, vo, op,page,limit,sort,request);
		ExtResult rs = ExtResult.success("",data);
		return rs;
	}
	@RequestMapping(value = "/{obj}/query/{op}.json")
	@ResponseBody
	public Object query(@PathVariable String obj, @PathVariable String op,
						Model model, @ModelAttribute("data") BaseEntity vo,
						@RequestParam(value = "page", defaultValue = "1") int page,
						@RequestParam(value = "limit", defaultValue = PageUtils.Limit) int limit,
						@RequestParam(value = "sort", defaultValue = "") String[] sort,
						ServletRequest request) {
        checkPermission(request,obj,op);

		Class<? extends BaseEntity> cls = ClsMap.getEntityClass(obj);
		if(cls==null)
			E.S("未知对象:"+obj);

		Map<String, Object> data = fetchOpData(model, cls, vo, op, page,limit,sort,request);
		if(data.keySet().size()==1)
			return data.values().iterator().next();
		return data;
	}
	@RequestMapping(value = "/{obj}/query/{op}.shtml")
	public String querypage(@PathVariable String obj, @PathVariable String op, Model model,
							@ModelAttribute("data") BaseEntity vo,
							@RequestParam(value = "page", defaultValue = "1") int page,
							@RequestParam(value = "limit", defaultValue = PageUtils.Limit) int limit,
							@RequestParam(value = "sort", defaultValue = "") String[] sort,
							ServletRequest request){

        checkPermission(request,obj,op);
		Class<? extends BaseEntity> cls = ClsMap.getEntityClass(obj);
		if(cls==null)
			E.S("未知对象:"+obj);
		Map<String, String[]> map = request.getParameterMap();
		for(Map.Entry<String,String[]>  e:map.entrySet()){
			model.addAttribute(e.getKey(),e.getValue()[0]);
		}


		Map<String, Object> data = fetchOpData(model, cls, vo, op,page,limit,sort, request);
		model.addAllAttributes(data);


		return dir(cls,op);
	}

//
	private Map<String, Object> fetchOpData(Model model, Class<? extends BaseEntity> cls,
                                            BaseEntity vo, String op, int page,int limit,String[] sort,ServletRequest request) {

        Pageable pageable = PageUtils.page(page-1, limit, sort);

        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, model);

        Map<String, Object> rs = getService().fetchOpData(cls,vo, op,pageable,searchParams,ShiroUtils.getCurrentUser());
		return rs;
	}


	public void checkPermissionQuery(ServletRequest request,String obj) {
		SecurityUtils.getSubject().checkPermission(
				obj.toLowerCase() + ":" + "query");
	}
    public void checkPermission(ServletRequest request,String obj,String op) {
	    String p=obj.toLowerCase() + ":" + op;
        SecurityUtils.getSubject().checkPermission(p);

    }

	private Map<String, Object> fetchPageData(Model model, Class<?>cls,int start, int limit, String[] sort,Map<String,Object> searchParams) {

		//PageSort.parase(sort);
		try {
			Pageable page = PageUtils.page(start, limit, sort);

			Map<String, Object> rs = getService().fetchPage(ShiroUtils.getUser(),cls, page, searchParams);


			return rs;
		}catch (Exception ex){
			ex.printStackTrace();
			return Maps.newHashMap();
		}


	}

}
