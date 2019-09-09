package com.frogsing.operator.fetch;


import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.data.BaseFetch;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.security.utils.MD5;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.StringHelper;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.operator.dao.DepartmentDao;
import com.frogsing.operator.dao.OperatorDao;
import com.frogsing.operator.dao.OperatorRoleDao;
import com.frogsing.operator.dao.RoleDao;
import com.frogsing.operator.po.Operator;
import com.frogsing.operator.po.OperatorRole;
import com.frogsing.operator.po.Role;
import com.frogsing.operator.utils.OPERATORCol.op_operator;
import com.frogsing.parameter.utils.ParaUtils;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Component
public class FetchOperator extends BaseFetch<Operator> {

	@Autowired
	OperatorDao operatorDao;
	
	@Autowired
	OperatorRoleDao operatorRoleDao;

	@Autowired
	DepartmentDao departmentDao;

	@Autowired
	RoleDao roleDao;
	
	@Override
	public void fetchDetailData(Operator obj,Map<String, Object>  map) {
		List<Role> rs = roleDao.findAll();
		map.put("roleList", rs);
		List<String> r=Lists.newArrayList();
		for(Role t:obj.getRoleList()){
			r.add(t.getId());
		}
		obj.setRole(r.toArray(new String[r.size()]));

		map.put("department", departmentDao.findOne(obj.getSdepartmentid()));

	}
	
	@Override
	public void beforeAdd(Operator obj, ILoginUser u) {
		
		if(operatorDao.count(op_operator.susername, obj.getSusername())>0)
			E.S("保存用户'" + obj.getSusername() + "'失败，登录名已存在");
		if(B.N(obj.getSemail())&&operatorDao.count(op_operator.semail, obj.getSemail())>0)
			E.S("保存用户'" + obj.getSusername() + "'失败，邮箱已存在");
		obj.setBisadmin(Consts.BoolType.NO.val());
		obj.setBisdelete(Consts.BoolType.NO.val());
		obj.setDadddate(new Date());
		obj.setSaddoperator(u.getLoginName());
		obj.setSoperatorno(ParaUtils.seqno(op_operator.tablename));
		obj.setSpassword(MD5.encode(obj.getSpassword().trim()));
		
	}
	@Override
	public void commonCheck(Operator obj, ILoginUser u) {
		obj.setDmodifydate(new Date());
		if (StringHelper.hasCn(obj.getSrealname())) {// 不是中文
			obj.setSpyname(StringHelper.getFullSpell(obj
					.getSrealname()));
			obj.setSjpname(StringHelper.getFirstSpell(obj
					.getSrealname()));
		} else {
			obj.setSpyname(obj.getSrealname().toUpperCase());
			obj.setSjpname(obj.getSrealname().toUpperCase());
		}
	}
	@Override
	public void beforeUpdate(Operator obj,Operator po, ILoginUser u) {
		//obj.setRoleList(null);
		if(operatorDao.count(op_operator.susername, obj.getSusername())>1)
			E.S("保存用户'" + obj.getSusername() + "'失败，登录名已存在");
		if(B.N(obj.getSemail())&&operatorDao.count(op_operator.semail, obj.getSemail())>1)
			E.S("保存用户'" + obj.getSusername() + "'失败，邮箱已存在");
		
		
		obj.setSmodifyoperator(u.getLoginName());
		if(B.N(obj.getSpassword())){
			obj.setSpassword(MD5.encode(obj.getSpassword().trim()));
		}
		else
			obj.setSpassword(operatorDao.getUserPassword(obj.getId()));
		//obj.setRoleList(null);
	}
	@Override
	public void afterSave(Operator vo,Operator po, ILoginUser u) {
		List<OperatorRole> operatorRole = operatorRoleDao.findBySoperatorid(vo.getId());
		if(operatorRole.size()>0){
			for(OperatorRole role : operatorRole){
				operatorRoleDao.delete(role); 
			}
		}
		operatorRoleDao.flush();
		String[] roleList = vo.getRole();
		if(roleList.length > 0){
//			List<Role> roles = roleDao.findAll(Lists.newArrayList(roleList));
//			obj.setRoleList(roles);
			for(String r:roleList){
				OperatorRole o=new OperatorRole();
				o.setSoperatorid(vo.getId());
				o.setSroleid(r);
				this.operatorRoleDao.save(o);
			}
		}else
			E.S("保存用户'" + vo.getSusername() + "'失败，用户角色不能为空");
		
		
	}
	
	
}
