package com.frogsing.heart.data;

import com.alibaba.dubbo.config.annotation.Reference;
import com.frogsing.heart.data.ClsMap;
import com.frogsing.heart.data.IDataService;
import com.frogsing.heart.entity.BaseEntity;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.ext.ExtResult;
import com.frogsing.heart.jpa.PageUtils;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.S;
import com.frogsing.heart.web.Layer;
import com.frogsing.heart.web.Msg;
import com.frogsing.heart.web.Servlets;
import com.frogsing.heart.web.login.ILoginUser;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.frogsing.exception.ServiceException;
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
public abstract class BaseDataController {


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
			model.addAttribute("data", data);
//			String s = request.getRequestURI();
//			if(s.indexOf("save.shtml")>0){//now is  save
//
//			}
//			else{//now is detail look
//
//				//model.addAllAttributes( getService().fetchOneForUpate(cls, id,false));
//			}

		}
		else{
			//String s = request.getRequestURI();
			//save 
			//if(s.indexOf("detail.shtml")>0||s.indexOf("save.shtml")>0){//to add
				 obj=obj.toLowerCase();
				 Class cls = ClsMap.getEntityClass(obj);
				 if(cls==null)
					 E.S("未知对象:"+obj);
				model.addAttribute("data", cls.newInstance());
			//}

		
		}
		
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/{obj}/save.shtml")
	protected String save(
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
		System.out.println(String.format("/%s/%s-%s", cls.getName().split("\\.")[2],cls.getSimpleName().toLowerCase(),page));
		return String.format("/%s/%s-%s", cls.getName().split("\\.")[2],cls.getSimpleName().toLowerCase(),page);
	}
	
	@RequestMapping(value = "/{obj}/list.shtml")
	protected String list(
			@PathVariable String obj,
			@RequestParam(value = "start", defaultValue = "0") int start,
			@RequestParam(value = "limit", defaultValue = PageUtils.Limit) int limit,
			@RequestParam(value = "sort", defaultValue = "") String[] sort,Model model,
			ServletRequest request) {
		 obj=obj.toLowerCase();
		 Class<?> cls = ClsMap.getEntityClass(obj);
		 if(cls==null)
			 E.S("未知对象:"+obj);
		 checkPermissionQuery(request,obj);
		 
		 Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, model);
		 fetchPageData(model, cls, start, limit, sort, searchParams);
		 return dir(cls,"list");
	}
	@RequestMapping(value = "/{obj}/detail.shtml")
	protected String detail(
			@PathVariable String obj,
			@ModelAttribute("data") BaseEntity vo,Model model,
			ServletRequest request) {
	/**
	 * 1.prepareData 执行,准备 查看 或 修改 的添加的数据 fetchOne, 新增: 构造obj ,fetchOne ,
	 * 2.转到detail页面
	 */
	try {
		Map<String, Object> params = Servlets.getParametersStartingWith(request, "param_");
		model.addAllAttributes(params);
		Map<String, Object> rs = getService().fetchOneForUpate(vo);
		Object x = rs.get("data");
		if (x != null) {
			rs.remove("data");
			BeanUtils.copyProperties(x, vo);
		}
		model.addAllAttributes(rs);
	}
	catch (Exception ex){
		ex.printStackTrace();
	}

		 return dir(vo.getClass(),"detail");
	}

//	@RequestMapping(value = "/{obj}/ask_{op}.shtml")
//	protected String ask_op(
//			@PathVariable String obj,
//			@PathVariable String op,
//			String[] ids,Model model,
//			ServletRequest request) {
//	/**
//	 * 1.prepareData 执行,准备 查看 或 修改 的添加的数据 fetchOne, 新增: 构造obj ,fetchOne ,
//	 * 2.转到detail页面
//	 */
//		 Map<String,Object> params = Servlets.getParametersStartingWith(request, "param_");
//		 model.addAllAttributes(params);
//		 getService().fetchAskData();
//		 return "dt/"+obj.toLowerCase()+"-"+op;
//	}

	
	@RequestMapping(value = "/{obj}/delete.shtml")
	protected String deleteit(
			@PathVariable String obj,
			String[] ids,Model model,RedirectAttributes rmodel,
			ServletRequest request) {
		try{
		 obj=obj.toLowerCase();
		 Class<? extends BaseEntity> cls = ClsMap.getEntityClass(obj);
		 if(cls==null)
			 E.S("未知对象:"+obj);
		 ILoginUser u = ShiroUtils.getCurrentUser();
		 SecurityUtils.getSubject().checkPermission(
					obj + ":" + "delete");
		 getService().deleteit(cls,ids,u);
		 Map<String,Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		 rmodel.addAllAttributes(searchParams);
		 Msg.success(rmodel, "成功删除了!", 0);
		}
		catch (Exception e) {
			Msg.error(rmodel, e);
		}
		return S.redirect("/dt/"+obj+"/list.shtml");
	}
	
	@RequestMapping(value = "/{obj}/deleteJson.shtml")
	@ResponseBody
	protected ExtResult delete(@PathVariable String obj,String[] ids){
		try {
			obj=obj.toLowerCase();
			 Class<? extends BaseEntity> cls = ClsMap.getEntityClass(obj);
			 if(cls==null)
				 E.S("未知对象:"+obj);
			 ILoginUser u = ShiroUtils.getCurrentUser();
			 SecurityUtils.getSubject().checkPermission(
						obj + ":" + "delete");
			 getService().deleteit(cls,ids,u);
			 return ExtResult.success("成功删除了!");
		} catch (ServiceException ex) {
			return ExtResult.failure(ex.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return ExtResult.failure("操作出错，删除失败!");
		}
	}

	@RequestMapping(value = "/{obj}/{page}.shtml")
	protected String page(@PathVariable String obj,@PathVariable String page,@ModelAttribute("data") BaseEntity vo){

		Class<? extends BaseEntity> cls = ClsMap.getEntityClass(obj);
		if(cls==null)
			E.S("未知对象:"+obj);
		return dir(cls,page);
	}


	protected void checkPermissionQuery(ServletRequest request,String obj) {
		SecurityUtils.getSubject().checkPermission(
				obj.toLowerCase() + ":" + "query");
	}

	public void fetchPageData(Model model, Class<?>cls,int start, int limit, String[] sort,Map<String,Object> searchParams) {

		try {
			Pageable page = PageUtils.page(start, limit, sort);
			ILoginUser u = ShiroUtils.getCurrentUser();
			Map<String, Object> rs = getService().fetchPage(ShiroUtils.getCurrentUser(),cls, page, searchParams);
			model.addAllAttributes(rs);
		}catch (Exception ex){
			ex.printStackTrace();
		}

	}

}
