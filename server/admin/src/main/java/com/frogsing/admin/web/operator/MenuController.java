package com.frogsing.admin.web.operator;

import com.frogsing.heart.ext.ExtResult;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.Msg;
import com.frogsing.operator.po.Menu;
import com.frogsing.operator.service.MenuService;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 系统菜单管理
 * @author wjl
 *
 */
@Controller
@RequestMapping(value = "/jj/menu")
public class MenuController  {

	@Autowired
	MenuService menuService;


	/**
	 * 编辑和查看
	 * @param menu
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "detail.shtml")
	public String detail(Menu menu, Model model) {
		// 获取排序号，最末节点排序号+30
		if (!StringUtils.isBlank(menu.getId())){
			menu = menuService.getMenuById(menu.getId());
			if(menu!=null){
				menu.setParent(menuService.getMenuById(menu.getSparentid()));
			}
		}else{
			if(menu.getSparentid()!=null){//增加下级菜单
				menu.setParent(menuService.getMenuById(menu.getSparentid()));
			}else{//增加新菜单
				menu.setParent(menuService.getMenuById("0"));
			}
			menu.setBisdisplay(1);

		}
		model.addAttribute("data", menu);
		return "/operator/menu-detail";
	}


	@RequiresPermissions("menu:edit")
	@RequestMapping(value = "save.shtml")
	@ResponseBody
	public ExtResult save(Menu menu, Model model, RedirectAttributes redirectAttributes) throws Exception{

		if (menuService.isNameSame(menu.getSname(), menu.getParent().getId(), menu.getId())) {
			Msg.error(redirectAttributes, "保存失败，菜单名称已存在！");
		}
		// 如果id为空就就添加
		if (StringUtils.isBlank(menu.getId())) {
			//menu.setSparentid(menu.getParent().getId());// 添加父节点
			menuService.saveMenu(menu, null);
		} else {// 修改
			menuService.saveMenu(menu, menu.getId());
		}
		Msg.success(model, "菜单保存成功！",1);
		return ExtResult.success();


	}

	/**
	 * 菜单树
	 * @param extId
	 * @param isShowHide
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "treeData.shtml")
	@RequiresAuthentication
	public List<Map<String, Object>> treeData(String id,@RequestParam(required=false) String extId,@RequestParam(required=false) String isShowHide, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<Menu> list = menuService.getAllMenu();
		if(B.N(id)){
			Set<String> set= Sets.newHashSet(id);
			List<Menu> sublist=Lists.newArrayList();
			toSubTree(set,list,sublist);
			list=sublist;
		}
		for (int i=0; i<list.size(); i++){
			Menu e = list.get(i);
			if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()))){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getSparentid());
				map.put("name", e.getSname());
				mapList.add(map);
			}
		}
		return mapList;
	}

	private void toSubTree(Set<String> set , List<Menu> list, List<Menu> sublist){
		Set<String> sub=Sets.newHashSet();
		for(Menu m:list){
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
	 * @param menu
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("menu:edit")
	@RequestMapping(value = "delete.shtml")
	public String delete(Menu menu, RedirectAttributes redirectAttributes) {
		try {
			menuService.deleteMune(new String[]{menu.getId()});
			Msg.success(redirectAttributes, "删除菜单成功",1);
		} catch (Exception e) {
			Msg.error(redirectAttributes, e.getMessage());
		}
		return "redirect:list.shtml";
	}

	/**
	 * 删除所有菜单
	 * @param ids
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("menu:edit")
	@RequestMapping(value = "deleteAll.shtml")
	@ResponseBody
	public ExtResult deleteAll(String ids, RedirectAttributes redirectAttributes) {
		String idArray[] =ids.split(",");
		try {
			menuService.deleteMune(idArray);
			return ExtResult.success("删除菜单成功");
			//	Msg.error(redirectAttributes, "删除菜单成功");
		} catch (Exception e) {
			return ExtResult.failure(e.getMessage());

		}

	}



}
