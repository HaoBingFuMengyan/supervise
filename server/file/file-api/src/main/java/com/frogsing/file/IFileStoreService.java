package com.frogsing.file;

import com.frogsing.file.po.FileDirection;
import com.frogsing.file.po.FileStore;

import java.util.List;

public interface IFileStoreService  {

	/**
	 * 上传文件到ftp服务器上，并且此文件只能通过FTP下载访问，不能通过图片服务器访问
	 * 上传成功后返回文件ID，文件路径，文件名称 的数组
	 * 单据ID可以为空，如果当前单据还未保存成功，拿不到单据ID时，
	 * 需要在单据保存成功后调用 根据文件单据ID的接口进行更新，否则一段时间内会
	 * @param bisdefault   是否默认值
	 * @param billId  单据ID
	 * @param serverPath   上传成功服务器返回的路径
	 * @param filename    原始文件名
	 * @return 文件ID，文件路径，文件名称 如：{'/images/20171010/xxxx-xxxx-xxxx.gif','upload.gif'}
	 */
	String[] uploadPriFile(boolean bisdefault, String billId, String sremark,String serverPath,String filename);

	/**
	 * 上传文件到ftp服务器上，此文件会发布到图片服务器，可通过图片服务器访问
	 * 上传成功后返回文件ID，文件路径，文件名称 的数组
	 * 如果当前单据还未保存成功，拿不到单据ID时，需要在单据保存成功后调用 根据文件单据ID的接口进行更新
	 * @param bisdefault   是否默认值
	 * @param billId  单据ID
	 * @param serverPath   上传成功服务器返回的路径
	 * @param filename    原始文件名
	 * @return 文件ID，文件路径，文件名称 如：{'/images/20171010/xxxx-xxxx-xxxx.gif','upload.gif'}
	 */
	String[] uploadFile(boolean bisdefault,String billId,String sremark,String serverPath,String filename);

	/**
	 * 更新文件的单据ID，并将此文件设置为启用
	 * @param fileId 文件ID
	 * @param billId 单据ID
	 */
	void updateFileBillId(String fileId,String billId);

	/**
	 *根据单据ID删除所有的文件
	 * @param billId
	 */
	void delFileByBillId(String billId);

	/**
	 * 根据文件ID删除文件
	 * @param id
	 */
	void delFileById(String id);

	/**
	 * 根据单据ID和排序号找相应的文件
	 * @param sbillid
	 * @param isort
     * @return
     */
	FileDirection findBysbillidAndisort(String sbillid,int isort);

	List<FileDirection> findBySbillid(String sbillid);

}