package com.frogsing.operator.tag;

import com.frogsing.heart.spring.SpringContextHolder;
import com.frogsing.operator.IMenuService;
import com.frogsing.parameter.vo.TreeVo;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.List;


/**
 * 菜单标签
 * @author wangjianglin
 *
 */
public class MenuTag extends TagSupport {
	private static final long serialVersionUID = 1L;
	private TreeVo menu;//菜单Map
	protected static  IMenuService menuService = SpringContextHolder.getBean(IMenuService.class);

	public TreeVo getMenu() {
		return menu;
	}

	public void setMenu(TreeVo menu) {
		this.menu = menu;
	}

	public int doStartTag() throws JspTagException {
		return EVAL_PAGE;
	}

	public int doEndTag() throws JspTagException {
		try {
			JspWriter out = this.pageContext.getOut();
			String menu = (String) this.pageContext.getSession().getAttribute("menu");
			if(menu!=null){
				out.print(menu);
			}else{
				menu=end().toString();
				out.print(menu);
				
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	private StringBuffer end() {
		StringBuffer sb = new StringBuffer();
		List<TreeVo> menuList = MenuUtils.getMenuList();
		sb.append(getChildOfTree(menu,0,menuList ));
		return sb;
		
	}
	
	private static String getChildOfTree(TreeVo parent, int level, List<TreeVo> menuList) {
		StringBuffer menuString = new StringBuffer();
		String href = "";
		if (level > 0) {//level 为0是功能菜单

			menuString.append("<li>");

			ServletContext context = SpringContextHolder
					.getBean(ServletContext.class);
			if (parent.getHref() != null && parent.getHref().length() > 0) {
				
				
				if (parent.getHref().startsWith("http://")) {// 如果是互联网资源
					href =  parent.getHref();
				} else if(parent.getHref().endsWith(".html")&&!parent.getHref().endsWith("ckfinder.html")){//如果是静态资源并且不是ckfinder.html，直接访问不加adminPath
					href = context.getContextPath() + parent.getHref();
				}else{
					href = context.getContextPath() + parent.getHref();
				}
			}
		}


		if ((parent.getHref() == null || parent.getHref().trim().equals("/")) ||parent.getHref().trim().equals("")) {//如果是父节点且显示
			if (level > 0) {
			menuString
					.append("<a href=\""
							+ href
							+ "\"><i class=\"fa "+parent.getIconCls()+"\"></i> <span class=\"nav-label\">"
							+ parent.getText()
							+ "</span><span class=\"fa arrow\"></span></a>");
			}
			if (level == 1) {
				menuString.append("<ul class=\"nav nav-second-level\">");
			} else if (level == 2) {
				menuString.append("<ul class=\"nav nav-third-level\">");
			} else if (level == 3) {
				menuString.append("<ul class=\"nav nav-forth-level\">");
			} else if (level == 4) {
				menuString.append("<ul class=\"nav nav-fifth-level\">");
			}
			for (TreeVo child : menuList) {
				if (child.getSparentid().equals(parent.getId())) {
					menuString.append(getChildOfTree(child, level + 1, menuList));
				}
			}
			if (level > 0) {
			menuString.append("</ul>");
			}
		} else {
			menuString.append("<a class=\"J_menuItem\"  href=\"" + href
					+ "\" ><i class=\"fa "+parent.getIconCls()+"\"></i> <span class=\"nav-label\">"+parent.getText()+"</span></a>");
		}
		if (level > 0) {
			menuString.append("</li>");
		}

		return menuString.toString();
	}
	
	

}
