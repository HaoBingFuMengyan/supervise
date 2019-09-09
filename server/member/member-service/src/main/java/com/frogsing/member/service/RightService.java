package com.frogsing.member.service;

import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.jpa.PageSort;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.ObjectUtils;
import com.frogsing.heart.utils.T;
import com.frogsing.member.IRightService;
import com.frogsing.member.dao.RightDao;
import com.frogsing.member.po.Right;
import com.frogsing.member.utils.MEMBER;
import com.frogsing.member.utils.MEMBERCol;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.Collection;
import java.util.List;

@Component
@Transactional
public class RightService  implements IRightService {

	@Autowired
	private RightDao rightDao;




	
	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IRightService#copyRight(java.lang.String, java.lang.String)
	 */
	@Override
	public boolean copyRight(String nodeId,String targetId){
		Right right=this.rightDao.findOne(nodeId);
		if(B.Y(targetId))
			return true;
		
		Right parent=this.rightDao.findOne(targetId);
		if(parent == null){
			try {
				MEMBER.MemberType type= MEMBER.MemberType.get(Integer.parseInt(targetId));
				parent=new Right();
				parent.setId(targetId);
				parent.setIpurtype(type.getVal());
			} catch (NumberFormatException e) {
				E.S("复制失败");
			}
		}
		if(right.getIpurtype() == parent.getIpurtype()){
			right.setSparentid(parent.getId());
			this.rightDao.save(right);
			return false;
		}else{
			this.buildSonNode(right,parent);
			return true;
		}
	}
	
	private List<Right> buildSonNode(Right right,Right parent){
		List<Right> all=Lists.newArrayList();
		Right r1=new Right();
		ObjectUtils.copyObjValue(right, r1);
		r1.setId(null);
		r1.setSparentid(parent.getId());
		r1.setDadddate(T.now());
		r1.setIpurtype(parent.getIpurtype());
		
		long i = rightDao.rightCount(r1.getSurlpath(), r1.getIpurtype());
		if (i > 0)
			E.S("权限定义重复");
		this.rightDao.save(r1);
		all.add(r1);
		if(right == null || Consts.BoolType.YES.isEq(right.getBisleaf()))
			return all;
		List<Right> list=this.rightDao.findBySparentid(right.getId());
		if(!list.isEmpty()){
			for(Right r:list){
				all.addAll(this.buildSonNode(r, r1));
			}
		}
		return all;
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IRightService#findByIpurtype(int)
	 */
	@Override
	public List<Right> findByIpurtype(int iroletype) {

		return rightDao.findByIpurtype(iroletype);
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IRightService#findRoleRight(java.lang.String)
	 */
	@Override
	public Collection<String> findRoleRight(String sroleid) {
		return rightDao.findRoleRight(sroleid);
	}

	@Override
	public void sortUp(String id) {
		Right r=rightDao.findOne(id);
		if(r==null)
			return;
		List<Right> list = rightDao.findAll(new Specification<Right>() {
			@Override
			public Predicate toPredicate(Root<Right> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				return cb.and(
						cb.equal(
						MEMBERCol.hy_right.sparentid(root),r.getSparentid()));
			}
		},PageSort.Asc(MEMBERCol.hy_right.spurno).ToSort());
		Right last=null;
		for(Right n:list){

			if(n.getId().equals(r.getId()))
				break;;
			last=n;
		}
		if(last==null)
			return;
		long w=0;
		if(last.getSpurno().equals(r.getSpurno()))
		{
			 w=Long.parseLong(r.getSpurno())+1;
			if(w<1000)
				w=w+1000;
			last.setSpurno(String.valueOf(w));
			boolean flag=false;
			for(Right n:list){

				if(flag==true){
					w++;
					n.setSpurno(String.valueOf(w));
					rightDao.save(n);
				}
				if(n==last){
					flag=true;
				}

			}
		}
		else{
			String temp=last.getSpurno();
			last.setSpurno(r.getSpurno());
			r.setSpurno(temp);
		}


	}

}
