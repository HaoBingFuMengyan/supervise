/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.frogsing.file.controller;

import com.frogsing.file.ISysFileService;
import com.frogsing.file.po.SysFile;
import com.frogsing.file.utils.FtpUtils;
import com.frogsing.heart.data.IQueryService;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.security.shiro.ShiroUtils;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.F;
import com.frogsing.heart.utils.T;
import com.frogsing.heart.web.Layer;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletRequest;

/**
 * 标签Controller
 * @author jeeplus
 * @version 2013-3-23
 */
@Controller
@RequestMapping(value = "/dt/sysfile")
public class SysFileController {

	@Autowired
	private IQueryService queryserice;
	
	@Autowired
	private ISysFileService sysFileService;
	
	@RequestMapping(value = "/dosave.shtml")
	public String dosave(SysFile obj,@RequestParam(value = "sfile",required=false) CommonsMultipartFile sfile,Model model,
			ServletRequest request ){
		try {
			String sname = sfile.getOriginalFilename();
			obj.setSfilename(sname);
			double size = (double) sfile.getSize() / 1024 / 1024;
			if (F.compareTo(size, 10) > 0)
				E.S("超过文件最大限制" + 10 + "M");
			String rs=FtpUtils.uploadToFtpServer(sfile,"sys/file");
			obj.setSurl(rs);
			obj.setDmoddate(T.now());
			obj.setSmodsuserid(ShiroUtils.getCurrentUser().getId());
			if(B.Y(obj.getId())){
				obj.setId(null);
				obj.setDadddate(T.now());
				
			}else{
				SysFile ss=queryserice.findOne(SysFile.class, obj.getId());
				BeanUtils.copyProperties(obj, ss);
			}
			sysFileService.dosave(obj);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		 return Layer.close();
	}
	
	
}
