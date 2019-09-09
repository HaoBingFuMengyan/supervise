package com.frogsing.operator;

import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.operator.po.Operator;
import com.frogsing.operator.po.Role;

import javax.frogsing.exception.ServiceException;
import java.util.Collection;
import java.util.Date;
import java.util.List;

public interface IStaffService {
	
	/**
	 * 根据用户查询管理员表
	 * 
	 * @param susername
	 *            用户名
	 * @return
	 */
	Operator findOperatorByUserName(String susername);
	
	/**
	 * 根据用户名修改密码
	 * @param susername
	 * @param spassword
	 */
	void modityUserPassword(String susername, String spassword);
	
	
	/**
	 * 获取用户所有权限
	 * @param user
	 * @return
	 */
	Collection<String> getUserPurview(ILoginUser user);
	
	/**
	 * 登录成功业务处理,记录日志
	 * @param suserid
	 * @param now
	 */
	void doLoginOk(String suserid, Date now);

	/**
	 * 根据角色查找所有拥有该角色的操作员
	 * @param id
	 * @return
	 */
	List<Operator> findByRoleId(String id);

	/**
	 * 根据权限码查找所有拥有这个权限码的操作员
	 * @param rightpath
	 * @return
	 */
	List<Operator> findByPurviewPath(String rightpath);
	
	
	/**
	 * 根据角色id查询角色对象
	 * 
	 * @param id
	 * @return
	 */
	Role getRoleById(String id);
	
	Role getRoleByName(String name);
	
	List<Role> findByColumn(String colName, Object colValue);
	
	/**
	 * 保存角色权限码
	 * 
	 * @param id
	 * @param checkboxId
	 */
	void saveRolePurview(String id, String[] checkboxId) throws ServiceException;
/**
 * 根据角色查询出所有权限id
 * @param id
 * @return
 */
	List<String> findPurviewIdsBySroleid(String id);

	/**
	 * 登录失败处理
	 * @param s
	 * @param now
	 */
	void doLoginFail(String s, Date now);
}
