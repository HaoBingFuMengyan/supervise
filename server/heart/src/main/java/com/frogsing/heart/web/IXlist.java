package com.frogsing.heart.web;

import javax.servlet.ServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.frogsing.heart.jpa.PageUtils;

/**
 * 控制器支持类
 * @author jeeplus
 * @version 2013-3-23
 */
public interface  IXlist {

	@RequestMapping(value = "/{obj}/list.shtml", method = RequestMethod.GET)
	String xlist(
            @RequestParam(value = "start", defaultValue = "0") int start,
            @RequestParam(value = "limit", defaultValue = PageUtils.Limit) int limit,
            @RequestParam(value = "sort", defaultValue = "") String sort, Model model,
            ServletRequest request);
	
}
