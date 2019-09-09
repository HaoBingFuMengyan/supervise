package com.frogsing.operator.fetch;


import com.frogsing.heart.data.BaseFetch;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.utils.StringHelper;
import com.frogsing.heart.utils.T;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.operator.dao.MenuDao;
import com.frogsing.operator.dao.PurviewDao;
import com.frogsing.operator.po.Menu;
import com.frogsing.operator.po.Purview;
import com.frogsing.operator.utils.OPERATORCol;
import com.frogsing.parameter.utils.ParaUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.frogsing.exception.ServiceException;
import java.util.Map;

@Component
@Transactional(propagation=Propagation.MANDATORY)
public class FetchPurview extends BaseFetch<Purview> {

	@Autowired
	PurviewDao purviewDao;

	@Autowired
	MenuDao menuDao;


	@Override
	public void fetchDetailData(Purview obj, Map<String, Object> map) {
		Menu m = menuDao.findOne(obj.getSparentid());
		obj.setSparentname(m.getSname());
	}

	public boolean isNameSame(String sname, String sparentid, String id)
			throws ServiceException {
		try {
			if(id!=null){
				return purviewDao.count(sname, sparentid, id)>1;

			}else{
				return purviewDao.count(sname, sparentid)==0;
			}

		} catch (Exception ex) {
			//	LogUtils.log(ex.getMessage());
			ex.printStackTrace();
			throw new ServiceException("名称已存在！" + ex.getMessage());
		}
	}
	@Override
	public void commonCheck(Purview purview, ILoginUser u) {
		if(StringUtils.isBlank(purview.getSparentid())){
			E.S("请先选择左边的菜单再增加权限码！");
		}
		if (!StringUtils.isBlank(purview.getId())&&isNameSame(purview.getSpurname(),
				purview.getSparentid(), purview.getId())) {
			E.S("名称已存在！");
		}
		if(!org.apache.commons.lang3.StringUtils.isNotBlank(purview.getId())){//如果是添加的话执行下面
			if(StringHelper.hasCn(purview.getSpurname())){//不是中文
				purview.setSjpname(StringHelper.getFirstSpell(purview.getSpurname()));
				purview.setSpyname(StringHelper.getFullSpell(purview.getSpurname()));
			}else{
				purview.setSjpname(purview.getSpurname().toUpperCase());
				purview.setSpyname(purview.getSpurname().toUpperCase());
			}
			String scode = ParaUtils.seqno(OPERATORCol.op_purview.tablename);
			//暂定为权限
			purview.setSpurno(scode);
			purview.setSpurcode(scode);
			purview.setDadddate(T.now());

			Menu menu = menuDao.findOne(purview.getSparentid());

			if(menu!=null){
				if(menu.getBisleaf()!=1)
					E.S("请选择叶子菜单!");
				purview.setSparentid(menu.getId());
				purview.setSparentname(menu.getSname());
			}

		}else{
			Purview updatePurview = purviewDao.findOne(purview.getId());
			updatePurview.setSpurname(purview.getSpurname());
			updatePurview.setSurlpath(purview.getSurlpath());
			updatePurview.setSdescription(purview.getSdescription());
		}
	}
}
