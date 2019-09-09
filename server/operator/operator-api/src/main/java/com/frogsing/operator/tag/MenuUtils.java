package com.frogsing.operator.tag;

import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.spring.SpringContextHolder;
import com.frogsing.operator.IMenuService;
import com.frogsing.operator.po.Menu;
import com.frogsing.parameter.vo.TreeVo;

import java.util.*;

/**
 * 用户工具类
 * @author wangjianglin
 */
public class MenuUtils {

	private static IMenuService menuService = SpringContextHolder.getBean(IMenuService.class);

	
	/**
	 * 获取当前用户授权菜单 
	 * @return
	 */
	public static List<TreeVo> getMenuList(){
		
		List<TreeVo> listvo = new ArrayList<TreeVo>();
		// 获取所有菜单
		Iterable<Menu>  listMenu = menuService.getAllMenu();
		
		HashSet<String> perSet=null;
		boolean isAdmin=ShiroUtils.isAdmin();
		if(!isAdmin)
			perSet= menuService.getAllMenuIdByOperatorId(ShiroUtils.getCurrentUserId());
	//	HashSet<String> perSet =Sets.newHashSet();
		Map<String, TreeVo> treeMap = new LinkedHashMap<String, TreeVo>();
		TreeVo root = new TreeVo();
		//root.setId("0");
		// 把菜单加到Map里
		for (Menu menu : listMenu) {
			if (Consts.BoolType.NO.isEq(menu.getBisleaf())
					||isAdmin|| perSet.contains(menu.getId())) {
				// if (perSet.contains(menu.getId())) {
				TreeVo tree = new TreeVo();
				tree.setBisroot(menu.getBisroot());
				tree.setId(menu.getId());
				tree.setText(menu.getSname());
				tree.setLeaf(menu.getBisleaf() == 1 ? true : false);
				tree.setSparentid(menu.getSparentid());
				tree.setBisdisplay(menu.getBisdisplay());
				if(tree.getBisroot() == 1){
					tree.setExpanded(true);
				}
				tree.setIconCls(menu.getSimagepath());
				if (menu.getBisleaf() == 1) {
					tree.setHref(menu.getSmenupath());
				} else {
					tree.setHref("");
				}
				// tree.setIconCls("resource");
				treeMap.put(menu.getId(), tree);
			}
		}
		// 递归添加子节点
		Iterator<Map.Entry<String, TreeVo>> it = treeMap.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, TreeVo> entry = it.next();
			// String key = entry.getKey();
			TreeVo tree = entry.getValue();
			if (Consts.BoolType.YES.isEq(tree.getBisroot())) {// 如果是根节点
				root.getChildren().add(tree);
			} else {
				TreeVo parent = treeMap.get(tree.getSparentid());// 根据父Id查询
				if (parent != null) {
					parent.getChildren().add(tree);
				}
			}
		}
		// 删除没有子节点的
		root.removeNoRight();
		if (root.getChildren().size() > 0) {
			//root.getChildren().get(0).setExpanded(true);
		}
		for(TreeVo rootVo : root.getChildren()){//根目录
			listvo.add(rootVo);
			for(TreeVo onevo : rootVo.getChildren()){//第一层
				TreeVo treeVo1 =new TreeVo();
				treeVo1.setSparentid("");
				if (Consts.BoolType.NO.isEq(onevo.getBisdisplay())){
					listvo.add(treeVo1);
				}else {
					listvo.add(onevo);
				}
				for(TreeVo twovo : onevo.getChildren()){//第二层
					TreeVo treeVo2 =new TreeVo();
					treeVo2.setSparentid("");
					if (Consts.BoolType.NO.isEq(twovo.getBisdisplay())){
						listvo.add(treeVo2);
					}else {
						listvo.add(twovo);
					}
					for(TreeVo threevo : twovo.getChildren()){//第三层
						/*if (Consts.BoolType.NO.isEq(threevo.getBisdisplay()))
							listvo.add(null);*/
						listvo.add(threevo);
					}
				}
			}
		}
		return listvo;
	}
	
	/**
	 * 获取当前用户授权菜单
	 * @return
	 */
	public static TreeVo getTopMenu(){
		List<TreeVo> m = getMenuList();
		TreeVo topMenu;
		if(m.size()==0)
		{
			 topMenu=new  TreeVo();
			 topMenu.setText("没有找到菜单");
		}
		else
			topMenu =  m.get(0);
		return topMenu;
	}
	
}
