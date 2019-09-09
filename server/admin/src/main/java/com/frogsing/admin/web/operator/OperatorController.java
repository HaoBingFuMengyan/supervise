package com.frogsing.admin.web.operator;

import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.log.Lg;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.security.utils.AnnotationUtils;
import com.frogsing.heart.utils.S;
import com.frogsing.heart.utils.T;
import com.frogsing.heart.web.Msg;
import com.frogsing.heart.web.Servlets;
import com.frogsing.operator.po.Menu;
import com.frogsing.operator.po.Operator;
import com.frogsing.operator.po.Purview;
import com.frogsing.operator.service.MenuService;
import com.frogsing.operator.service.OperatorService;
import com.frogsing.operator.service.PurviewService;
import com.frogsing.operator.service.StaffService;
import com.frogsing.operator.vo.OperatorUser;
import com.frogsing.parameter.service.QueryService;
import com.frogsing.parameter.vo.TreeVo;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * LoginController负责打开登录页面(GET请求)和登录出错页面(POST请求)，
 * 
 * 真正登录的POST请求由Filter完成,
 * 
 * @frogsing van
 */
@Controller
@RequestMapping(value = "/")
public class OperatorController {


//	@RequestMapping(value = "**/**/*.jsp", method = RequestMethod.GET)
//	public String jspto(){
//		return S.redirect("login.shtml");
//	}
	@Autowired
	private MenuService menuService;

	@Autowired
	private QueryService queryService;

	@Autowired
	StaffService staffService;

	@Autowired
	private OperatorService operatorService;

	@Autowired
	PurviewService iPurviewService;

	
	@RequestMapping(value = "check.shtml", method = RequestMethod.GET)
	@ResponseBody
	public  Set<String> checkRight(){
		Set<String> list = menuService.getAllPurview();
		Set<String> rs = AnnotationUtils.getAllRight("com.frogsing.*.controller");
		for(String p:list){
			rs.remove(p);
		}
		for(String x:rs){
			Lg.error(String.format("未定义的权限码:%s", x));
		}
		return rs;
	}

	@RequestMapping(value = "center.shtml", method = RequestMethod.GET)
	public String center(Model mod) {
		return "/operator/center";
	}

	@RequestMapping(value = "login.shtml", method = RequestMethod.GET)
	public String login(Model mod) {

		mod.addAttribute("debug", T.isDebug());
		return "/operator/login";
	}

	@RequestMapping(value = "index.shtml", method = RequestMethod.GET)
	public String index(Model mod) {
		OperatorUser user = ShiroUtils.getCurrentUser();
		if (user == null) {
			return login(mod);
		}
		return "/operator/index";
	}

	/**
	 *加载带部门树的页面
	 * @return
	 */
	@RequestMapping(value="dt/operator/index.shtml")
	public  String index(){
		return "/operator/operator";
	}

	@RequestMapping(value = "home.shtml", method = RequestMethod.GET)
	public String home(Model model) {
			
		return "/operator/home";
	}

	/**
	 * 选择员工
	 * @param mod
	 * @return
	 */
	@RequestMapping(value = "dt/operator/choiceoperatorindex.shtml", method = RequestMethod.GET)
	public String choiceOperatorindex(Model mod) {
		OperatorUser user = ShiroUtils.getCurrentUser();
		if (user == null) {
			return login(mod);
		}
		return "/operator/choiceoperatorindex";
	}


	
	/**
	 * 建筑物结构图
	 * @param structureNo
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "structureView.shtml")
	public String structureView(String structureNo, Model model,ServletRequest request) {
		String structno = request.getParameter("structureNo");
		model.addAttribute("structno", structno);
		return "sys/structureView";
	}

	@RequestMapping(value = "logout.shtml", method = RequestMethod.GET)
	public String logout() {
		return "/operator/login";
	}

	@RequestMapping(value = "login.shtml", method = RequestMethod.POST)
	public String fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model) {
		model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);

		model.addAttribute("bisneedword",true );
		return "/operator/login";
	}

	@RequestMapping(value = "categorytree.shtml", method = RequestMethod.GET)
	public String categoryTree(@RequestParam(value = "type", defaultValue = "-1") int type,
			@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "selectleaf", defaultValue = "false") boolean selectleaf, HttpServletRequest request,
			Model model) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		model.addAttribute("searchs", searchParams);
		Map<String, Object> params = Servlets.getParametersStartingWith(request, "param_");
		model.addAllAttributes(params);
		model.addAttribute("name", name);
		model.addAttribute("url", "/sp/category/getCategoryTreeAll.shtml?site=" + type);
		return "/operator/commontree";
	}

	@RequestMapping(value = "commoditytree.shtml", method = RequestMethod.GET)
	public String commoditytree(@RequestParam(value = "type", defaultValue = "-1") int type,
			@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "selectleaf", defaultValue = "true") boolean selectleaf, HttpServletRequest request,
			Model model) {
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		model.addAttribute("searchs", searchParams);
		Map<String, Object> params = Servlets.getParametersStartingWith(request, "param_");
		model.addAllAttributes(params);
		model.addAttribute("name", name);
		model.addAttribute("selectleaf", selectleaf);
		model.addAttribute("url", "/sp/commodity/getCommodityTree.shtml?site=" + type);
		return "/operator/commontree";
	}

	@RequestMapping(value = "navigationtree.shtml", method = RequestMethod.GET)
	public String navigationTree(@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "selectleaf", defaultValue = "false") boolean selectleaf, HttpServletRequest request,
			Model model) {
		model.addAttribute("name", name);
		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
		model.addAttribute("searchs", searchParams);
		Map<String, Object> params = Servlets.getParametersStartingWith(request, "param_");
		model.addAllAttributes(params);
		model.addAttribute("url", "/xw/navigation/getNavigationTree.shtml");
		return "/operator/commontree";
	}

	@RequestMapping(value = "getmenu.shtml")
	@ResponseBody
	public List<TreeVo> menu() {
		// 获取登陆User信息
		// ShiroUser user =
		// (ShiroUser)SecurityUtils.getSubject().getPrincipals().getPrimaryPrincipal();

		// 获取所有菜单
		Iterable<Menu> listMenu = menuService.getAllMenu();

		HashSet<String> perSet = null;
		boolean isAdmin = ShiroUtils.isAdmin();
		if (!isAdmin)
			perSet = menuService.getAllMenuIdByOperatorId(ShiroUtils.getCurrentUserId());
		// HashSet<String> perSet =Sets.newHashSet();
		Map<String, TreeVo> treeMap = new LinkedHashMap<String, TreeVo>();
		TreeVo root = new TreeVo();
		// root.setId("0");
		// 把菜单加到Map里
		for (Menu menu : listMenu) {
			if (Consts.BoolType.NO.isEq(menu.getBisleaf()) || isAdmin || perSet.contains(menu.getId())) {
				// if (perSet.contains(menu.getId())) {
				TreeVo tree = new TreeVo();
				tree.setBisroot(menu.getBisroot());
				tree.setId(menu.getId());
				tree.setText(menu.getSname());
				tree.setLeaf(menu.getBisleaf() == 1 ? true : false);
				tree.setSparentid(menu.getSparentid());
				if (tree.getBisroot() == 1) {
					tree.setExpanded(true);
				}
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
			// root.getChildren().get(0).setExpanded(true);
		}
		return root.getChildren();

	}
	/**
	 * 验证登录名是否有效
	 * @param oldLoginName
	 * @param susername
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "operator/checkLoginName")
	public String checkLoginName(String oldLoginName, String susername) {
		if (susername !=null && susername.equals(oldLoginName)) {
			return "true";
		} else if (susername !=null && staffService.findOperatorByUserName(susername) == null) {
			return "true";
		}
		return "false";
	}


	@RequestMapping(value="sys/operator/operatorSpassword.shtml")
	@RequiresAuthentication
	public String passwd(Model model) throws Exception {
		return "/operator/operatorSpassword";
	}
	/**
	 * 修改密码
	 *
	 * @return
	 */
	@RequestMapping(value="sys/operator/updatepassword.shtml")
	@RequiresAuthentication
	public String updatepassword(@RequestParam(value = "oldspassword", defaultValue = "") String oldspassword,
									@RequestParam(value = "newspassword", defaultValue = "") String newspassword,
								 RedirectAttributes redirectAttributes) {

		String username = ShiroUtils.getCurrentUserName();
		Operator op = operatorService.operatorLogin(username,oldspassword);
		if (op != null) {
			//op.setSpassword(MD5.encode(newspassword));
			operatorService.updatePassword(op ,newspassword);
			Msg.success(redirectAttributes, "修改密码成功",1);
		} else {
			Msg.success(redirectAttributes, "旧密码输入不正确！",1);
		}
		return S.redirect("/sys/operator/operatorSpassword.shtml");
	}
	@RequiresPermissions("purview:delete")
	@RequestMapping(value = "purview/delete.shtml")
	public String delete(Purview purview, RedirectAttributes redirectAttributes) {
		try {
			iPurviewService.deletePurview(new String[]{purview.getId()});
			Msg.success(redirectAttributes, "删除权限成功",1);
		} catch (Exception e) {
			Msg.error(redirectAttributes, e.getMessage());
		}
		return S.redirect("/dt/purview/list.shtml");
	}
}
