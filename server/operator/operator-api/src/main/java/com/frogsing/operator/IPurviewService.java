package com.frogsing.operator;

import java.util.List;

import javax.frogsing.exception.ServiceException;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.frogsing.operator.po.Purview;

public interface IPurviewService  {


	/**
	 * 查询所有用户权限
	 * @return 用户权限List
	 */
	Page<Purview> getPagePurviewList(Pageable page, Purview purview);

	/**
	 * 查询所有权限码
	 */
	List<Purview> getAllPurview();

	/**
	 * 判断名称是否重复
	 * @param susername
	 * @return
	 */

	boolean isNameSame(String sname, String sparentid, String id) throws ServiceException;

	/**
	 * 根据Id删除权限
	 * @param id
	 */
	void deletePurview(String[] checkboxId) throws ServiceException;

	/**
	 * 根据id查询权限对象
	 * @param id
	 * @return
	 */
	Purview getPurviewById(String id);

	/**
	 * 更新权限
	 * @param purview
	 */
	void savePriview(Purview purview) throws ServiceException;

	void dfsave(Purview def);

	void dfsaveone(Purview def, String name, String path);

}