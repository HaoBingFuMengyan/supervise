package com.frogsing.operator.service;

import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.StringHelper;
import com.frogsing.heart.utils.T;
import com.frogsing.operator.IPurviewService;
import com.frogsing.operator.dao.MenuDao;
import com.frogsing.operator.dao.PurviewDao;
import com.frogsing.operator.po.Menu;
import com.frogsing.operator.po.Purview;
import com.frogsing.operator.utils.OPERATORCol;
import com.frogsing.parameter.utils.ParaUtils;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.frogsing.exception.ServiceException;
import javax.persistence.criteria.*;
import java.util.List;
/**
 * Component关键字表示Spring Bean的标识.
 * Transactional关键字默认将类中的所有函数纳入事务管理，所有方法将默认有事物控制
 * 如果某个方法不需要事物控制需在方法头上加上@Transactional(readOnly = true)
 * @author <a href="mailto:service@frogsing.com">frogsing</a>
 * @since version1.0
 */
@Component
@Transactional
public class PurviewService implements IPurviewService{
	
	@Autowired
	private MenuDao menuDao;
	
	//用户权限Dao
	private PurviewDao purviewDao;
	
	
	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IPurviewService#setPurviewDao(com.frogsing.dao.sys.PurviewDao)
	 */
	@Autowired
	public void setPurviewDao(PurviewDao purviewDao) {
		this.purviewDao = purviewDao;
	}
	
	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IPurviewService#getPagePurviewList(org.springframework.data.domain.Pageable, com.frogsing.po.entity.sys.Purview)
	 */
	@Override
	@Transactional(readOnly = true)
	public Page<Purview> getPagePurviewList(Pageable page,
			final Purview purview){
	
		
		Specification<Purview> spec=new Specification<Purview> (){  
			 
			  @Override
			   public Predicate toPredicate(Root<Purview> root,  CriteriaQuery<?> query, CriteriaBuilder cb) {  
				    Path<String> spurname = root.get("spurname");  
				    Path<String> spurcode = root.get("spurcode"); 
				    Path<String> sparentid = root.get("sparentid"); 
				    List<Predicate> predicates = Lists.newArrayList();
				    try{
						if (B.N(purview.getSpurname())) {
							predicates.add(cb.like(spurname,  "%" + purview.getSpurname() + "%"));
						}
						if (B.N(purview.getSpurcode())) {
							predicates.add(cb.like(spurcode,  "%" + purview.getSpurcode() + "%"));
						} 

						if (B.N(purview.getSparentid())) {
							//predicates.add(cb.equal(sparentid, purview.getSparentid()));
							//System.out.printf(purview.getSparentid());
							return cb.equal(sparentid, purview.getSparentid());
						} 
					}catch(Exception ex){
						ex.printStackTrace();
					}
				 // 将所有条件用 and 联合起来
					if (predicates.size() > 0) {
						return cb.and(predicates.toArray(new Predicate[predicates.size()]));
					}
					
					return cb.conjunction();
				  
			   }  
		     
		};
		
	
	
		
		
		return purviewDao.findAll(spec, page);
	//	return purviewDao.getPurviewList(page,conjunction);
	}
	
	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IPurviewService#getAllPurview()
	 */
	@Override
	@Transactional(readOnly = true)
	public List<Purview> getAllPurview(){
		return purviewDao.findAll(new Sort(new Order(Direction.ASC,OPERATORCol.op_purview.dadddate)));
	}
	
	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IPurviewService#isNameSame(java.lang.String, java.lang.String, java.lang.String)
	 */

	@Override
	@Transactional(readOnly = true)
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
	
	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IPurviewService#deletePurview(java.lang.String[])
	 */
	@Override
	public void deletePurview(String[] checkboxId)throws ServiceException{
		try{
			for (String id : checkboxId) {
				if(getPurviewById(id)!=null){
					purviewDao.delete(id);
				}
			}
		}catch (Exception ex){
			
			ex.printStackTrace();
			throw new ServiceException("删除权限失败");
		}
	}
	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IPurviewService#getPurviewById(java.lang.String)
	 */
	@Override
	@Transactional(readOnly = true)
	public Purview getPurviewById(String id){
		return purviewDao.findOne(id);
	}
	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IPurviewService#savePriview(com.frogsing.po.entity.sys.Purview)
	 */
	@Override
	public void savePriview(Purview purview)throws ServiceException {
		try{
	//		System.out.println(ParaUtils.seqno("qz0007","")+"------------");
			if(!B.N(purview.getId())){//如果是添加的话执行下面
				if(StringHelper.hasCn(purview.getSpurname())){//不是中文
					purview.setSjpname(StringHelper.getFirstSpell(purview.getSpurname()));
					purview.setSpyname(StringHelper.getFullSpell(purview.getSpurname()));
				}else{
					purview.setSjpname(purview.getSpurname().toUpperCase());
					purview.setSpyname(purview.getSpurname().toUpperCase());
				}
				String scode =ParaUtils.seqno(OPERATORCol.op_purview.tablename);
				//暂定为权限
				purview.setSpurno(scode); 
				purview.setSpurcode(scode);
				purview.setDadddate(T.now());
				
				Menu menu = menuDao.findOne(purview.getSparentid());
				if(menu!=null){
					purview.setSparentid(menu.getId());
					purview.setSparentname(menu.getSname());
				}
				
				purviewDao.save(purview);
			}else{
				Purview updatePurview = purviewDao.findOne(purview.getId());
				updatePurview.setSpurname(purview.getSpurname());
				updatePurview.setSurlpath(purview.getSurlpath());
				updatePurview.setSdescription(purview.getSdescription());
				purviewDao.save(updatePurview);
			}
			
		}catch (Exception ex){
			
			ex.printStackTrace();
			throw new ServiceException("更新权限失败");
		}
	}
	

	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IPurviewService#dfsave(com.frogsing.po.entity.sys.Purview)
	 */
	@Override
	public void dfsave(Purview def) {
		
		if(B.Y(def.getSparentid()))
			throw new ServiceException("请选择父节点"); 
		if(B.Y(def.getSparentname()))
			throw new ServiceException("请选择父节点名"); 
		if(B.Y(def.getSurlpath()))
			throw new ServiceException("请输入路径"); 
		if(B.Y(def.getSpurname()))
			throw new ServiceException("请输入权限名"); 
		
		
		
		dfsaveone(def,"查询","query");
		dfsaveone(def,"添加","add");
		dfsaveone(def,"修改","edit");
		dfsaveone(def,"删除","delete");
			
	}
	/* (non-Javadoc)
	 * @see com.frogsing.service.sys.IPurviewService#dfsaveone(com.frogsing.po.entity.sys.Purview, java.lang.String, java.lang.String)
	 */
	@Override
	public void dfsaveone(Purview def,String name,String path) {		
		Purview purview=new Purview();
		String scode =ParaUtils.seqno(OPERATORCol.op_purview.tablename);
		if(B.Y(scode))
			throw new ServiceException("编号生成器故障!"); 
		purview.setSpurno(scode); 
		purview.setSpurcode(scode);
		purview.setSparentid(def.getSparentid());
		purview.setSparentname(def.getSparentname());
		purview.setSurlpath(def.getSurlpath()+":"+path);
		if(0<purviewDao.count(OPERATORCol.op_purview.surlpath, purview.getSurlpath(), null))
			throw new ServiceException("权限路径已经存在"); 
		if(0<purviewDao.count(OPERATORCol.op_purview.spurname, purview.getSpurname(), null))
			throw new ServiceException("权限名已经存在"); 
		purview.setSpurname(def.getSpurname()+name);
		purview.setSdescription(purview.getSpurname());
		purview.setDadddate(T.now());
		purviewDao.save(purview);
	}


}
	
