package com.frogsing.file.controller;

import com.frogsing.file.IFileStoreService;
import com.frogsing.file.utils.FtpUtils;
import com.frogsing.file.vo.UploadResult;
import com.frogsing.heart.utils.DateUtils;
import com.frogsing.heart.utils.T;
import com.frogsing.parameter.utils.PARAMETER;
import com.frogsing.parameter.utils.ParaUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.frogsing.exception.ServiceException;
import javax.servlet.http.HttpServletResponse;

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
@Controller
@RequestMapping(value = "/file")
public class UploadController {

	@Autowired
	private IFileStoreService fileStoreService;

	@RequestMapping(value = "upload.json")
	@ResponseBody
	public UploadResult uploadFile(
			@RequestParam(value="upfile",required = false) CommonsMultipartFile orginalFile,
			@RequestParam(value="action",defaultValue = "uploadimage") String action,
			Model model, HttpServletResponse response) {
		try {
			//根据action类型判断上传的文件类型
			String path="/article/"+action+"/"+ DateUtils.dateToString(T.now(), "yyyyMMdd");
			path=FtpUtils.getPublicDir(path);
			String rs="";
			if("uploadimage".equals(action)){
				rs = FtpUtils.uploadToFtpServerImg(orginalFile,path,20);
			}else
				rs = FtpUtils.uploadToFtpServer(orginalFile,path);
			UploadResult result = UploadResult.success(ParaUtils.sys(PARAMETER.SysParaType.ImgUrl.val())+rs,orginalFile.getName(),orginalFile.getOriginalFilename());
			return result;
		} catch (ServiceException e) {
			return UploadResult.failure(e.getMessage());
		} catch (Exception e) {
			return UploadResult.failure("上传失败");
		}
	}

	@RequestMapping(value = "image.json")
	@ResponseBody
	public UploadResult uploadImage(
			@RequestParam(value="imgfile",required = false) CommonsMultipartFile file,
			@RequestParam(value="path",defaultValue = "/images") String path,
			@RequestParam(value="sbillid",defaultValue = "") String sbillid,
			@RequestParam(value="remark",defaultValue = "公共图片") String remark,
			@RequestParam(value="private",defaultValue = "false") boolean priorpub,
			Model model, HttpServletResponse response) {
		try {
			UploadResult result = UploadResult.success("",file.getName(),file.getOriginalFilename());
			String serverPath= FtpUtils.uploadToFtpServer(file,FtpUtils.getPrivateDir(path));
			if (priorpub) {
				String[] rs = this.fileStoreService.uploadPriFile(false,sbillid,remark,serverPath,file.getName());
				result.setFileid(rs[0]);
				result.setUrl(rs[1]);
				result.setIspublic(false);
			} else {
				String[] rs = this.fileStoreService.uploadFile(false,sbillid,remark,serverPath,file.getName());
				result.setFileid(rs[0]);
				result.setUrl(rs[1]);
				result.setIspublic(true);
			}

			return result;
		} catch (ServiceException e) {
			return UploadResult.failure(e.getMessage());
		} catch (Exception e) {
			return UploadResult.failure("上传失败");
		}
	}


	@RequestMapping(value = "pubimg.json")
	@ResponseBody
	public UploadResult pubimg(
			@RequestParam("imgfile") CommonsMultipartFile file,
			@RequestParam(value="path",defaultValue = "/images") String path,
			Model model, HttpServletResponse response) {
		try {
			UploadResult result = UploadResult.success("",file.getName(),file.getOriginalFilename());
			String serverPath= FtpUtils.uploadToFtpServerImg(file,FtpUtils.getPrivateDir(path));
			result.setUrl(serverPath);
			return result;
		} catch (ServiceException e) {
			return UploadResult.failure(e.getMessage());
		} catch (Exception e) {
			return UploadResult.failure("上传失败");
		}
	}
}
