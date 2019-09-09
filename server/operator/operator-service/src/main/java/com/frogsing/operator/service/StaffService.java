package com.frogsing.operator.service;

import com.frogsing.heart.security.utils.MD5;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.T;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.operator.IStaffService;
import com.frogsing.operator.dao.OperatorDao;
import com.frogsing.operator.dao.RoleDao;
import com.frogsing.operator.dao.RolePurviewDao;
import com.frogsing.operator.po.Operator;
import com.frogsing.operator.po.Role;
import com.frogsing.operator.po.RolePurview;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.frogsing.exception.ServiceException;
import java.util.Collection;
import java.util.Date;
import java.util.List;

@Component
@Transactional
public class StaffService implements IStaffService {

	
	@Autowired
	private OperatorDao operatorDao; 
	@Autowired
	private RoleDao roleDao; 
	@Autowired
	private RolePurviewDao rolePurviewDao; 
	
	
	@Override
	public Operator findOperatorByUserName(String susername) {
		Operator op = operatorDao.findBySusername(susername);
		return op;
	}


	@Override
	public void modityUserPassword(String susername, String spassword) {
		Operator obj = this.operatorDao.findBySusername(susername);
		if(obj != null){
			obj.setSpassword(MD5.encode(spassword));
			obj.setDmodifydate(T.now());
			obj.setSmodifyoperator(susername);
		}
		this.operatorDao.save(obj);
	}


	/**
	 * 根据用户找出所权限
	 */
	@Override
	public Collection<String> getUserPurview(ILoginUser user) {
		Collection<String> db;
		Collection<String> rs=Sets.newHashSet();
		if(user.IsAdmin()){
			db= operatorDao.getAllPurview();
			
		}
		else{
			db= operatorDao.getAllPurview(user.getId());
		}
		for(String t:db){
			String[] as=t.split(",");
			for(String b:as){
				rs.add(b.trim());
			}
		}
		return rs;
	}

    @Override
    public void doLoginOk(String suserid, Date now) {
		operatorDao.updateLoginTime(suserid,T.now());
    }

	@Override
	public void doLoginFail(String susername, Date now) {

		operatorDao.updateErrorLoginTime(susername,T.now());


	}


	
	/**
	 * 根据角色找到操作员列表
	 */
	@Override
	public List<Operator> findByRoleId(String sroleid) {
		String sql = "select * from op_operator s where s.sguid in (select r.soperatorid from op_operatorrole r where r.sroleid=?)";
		return this.operatorDao.findBySql(Operator.class, sql, 100,
				new Object[] { sroleid });
	}
	
	
	@Override
	@Transactional(readOnly = true)
	public Role getRoleById(String id) {
		return roleDao.findOne(id);
	}


	@Override
	@Transactional(readOnly=true)
	public List<Role> findByColumn(String colName, Object colValue) {
		return roleDao.findByPropertyName(colName, colValue);
	}

	
	@Override
	public void saveRolePurview(String id, String[] checkboxId)
			throws ServiceException {
		try {
			// 先删除角色对应的权限
			List<RolePurview> rpList = rolePurviewDao
					.findBySroleid(id);
			for (RolePurview rolePurview : rpList) {
				rolePurviewDao.delete(rolePurview);
			}
			if (checkboxId != null) {
				// 再循环添加
				for (String purviewId : checkboxId) {
					if(!purviewId.contains("menu")){//不包含菜单节点，只保存权限节点
						RolePurview rp = new RolePurview();
						rp.setSroleid(id);
						rp.setSpurviewid(purviewId);
						rolePurviewDao.save(rp);
					}
				}
			}
		} catch (Exception ex) {
			
			ex.printStackTrace();
			throw new ServiceException("保存角色权限码失败");
		}
	}

/**
 * 根据角色id查询所有权限集合
 */
	@Override
	public List<String> findPurviewIdsBySroleid(String id) {
		return this.roleDao.findPurviewIdsBySroleid(id);
	}




	@Override
	public Role getRoleByName(String name) {
		return this.roleDao.findBySrolename(name);
	}

	@Override
	public List<Operator> findByPurviewPath(String rightpath) {
		List<String> rolids = (List<String>)roleDao.findBySql("select sroleid from op_rolepurview rp left join sys_purview p on rp.spurviewid=p.sguid where p.surlpath=?", rightpath);

		if (B.Y(rolids)) {
			return Lists.newArrayList();
		}
		List<Operator> sysOperatorList = Lists.newArrayList();
		for(String role:rolids){
			sysOperatorList.addAll(this.findByRoleId(role));
		}
		return sysOperatorList;
	}
}
