package com.frogsing.admin.web.operator;

import com.frogsing.heart.jpa.PageUtils;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.Msg;
import com.frogsing.heart.web.Servlets;
import com.frogsing.operator.po.Department;
import com.frogsing.operator.service.DepartmentService;
import com.frogsing.parameter.service.QueryService;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 部门管理
 *
 */
@Controller
@RequestMapping(value = "/dt/department")
public class DepartmentController  {

	@Autowired
	DepartmentService departmentService;

	@Autowired
	QueryService queryService;
	 
	@RequestMapping(value = "list.shtml")
	protected String dolist(
			@RequestParam(value = "start", defaultValue = "0") int start,
			@RequestParam(value = "limit", defaultValue = PageUtils.Limit) int limit,
			@RequestParam(value = "sort", defaultValue = "") String sort,Model model,
			ServletRequest request) {

		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, model);
		Pageable page = PageUtils.page(start, limit, sort);
		model.addAttribute("list",queryService.listPage(Department.class,page,searchParams));
		return "/operator/department-list";
	}
	
	/**
	 * 获取部门树
	 * @param extId
	 * @param isShowHide
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "treeData.shtml")
	@RequiresAuthentication
	public List<Map<String, Object>> treeData(String id, @RequestParam(required=false) String extId, @RequestParam(required=false) String isShowHide, HttpServletResponse response, HttpServletRequest request) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		List<Department> list = queryService.findAll(Department.class,searchParams);
		if(B.N(id)){
			Set<String> set= Sets.newHashSet(id);
			List<Department> sublist=Lists.newArrayList();
			toSubTree(set,list,sublist);
			list=sublist;
		}
		for (int i=0; i<list.size(); i++){
			Department e = list.get(i);
			if (B.Y(extId) || (extId!=null && !extId.equals(e.getId()))){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getSparentid());
				map.put("name", e.getSname());
				mapList.add(map);
			}
		}
		return mapList;
	}

	 private void toSubTree(Set<String> set , List<Department> list, List<Department> sublist){
		    Set<String> sub=Sets.newHashSet();
	        for(Department m:list){
	            if(set.contains(m.getSparentid())) {
	                sublist.add(m);
	                sub.add(m.getId());
	            }
	        }
	        if(sub.isEmpty()){
	            return ;
	        }
	        else{
	            toSubTree(sub,list,sublist);
	        }

	    }
	 /**
	 * 删除菜单
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("department:edit")
	@RequestMapping(value = "delet e.shtml")
	public String delete(Department department, RedirectAttributes redirectAttributes) {
		try {
			departmentService.deleteDepartment(new String[]{department.getId()});
			Msg.success(redirectAttributes, "删除部门成功",1);
		} catch (Exception e) {
			Msg.error(redirectAttributes, e.getMessage());
		}
		return "redirect:list.shtml";
	}
	
}
