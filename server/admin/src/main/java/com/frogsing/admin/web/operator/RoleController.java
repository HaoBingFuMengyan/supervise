package com.frogsing.admin.web.operator;

import com.frogsing.heart.jpa.PageUtils;
import com.frogsing.heart.web.BaseController;
import com.frogsing.heart.web.Servlets;
import com.frogsing.operator.po.Role;
import com.frogsing.parameter.service.QueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletRequest;
import java.util.Map;

@Controller
@RequestMapping(value = "/dt/role")
public class RoleController extends BaseController<Role, Role> {

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
		model.addAttribute("list",queryService.listPage(Role.class,page,searchParams));
		return "/operator/role-list";
	}

}
