package com.frogsing.member.service;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.web.login.ILoginUser;
import com.frogsing.member.IActorService;
import com.frogsing.member.dao.ActorDao;
import com.frogsing.member.dao.ActorRightDao;
import com.frogsing.member.po.Actor;
import com.frogsing.member.po.ActorRight;
import com.frogsing.member.po.Right;
import com.frogsing.member.utils.MEMBERCol.hy_right;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.frogsing.exception.ServiceException;
import javax.persistence.criteria.*;
import java.util.List;

@Component
@Transactional
public class ActorService  implements IActorService {

	@Autowired
	private ActorDao actorDao;
	@Autowired
	private ActorRightDao actorRightDao;

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IActorService#rolerightsave(java.lang.String[], java.lang.String)
	 */
	@Override
	public void rolerightsave(String[] checkPurviewId, String roleId) {

		
		if (!actorDao.exists(roleId))
			E.S("角色不存在!");

		actorRightDao.deleteByRoleId(roleId);
		if(checkPurviewId!=null)
			for (String rightid : checkPurviewId) {
					ActorRight right = new ActorRight();
					right.setSpurviewid(rightid);
					right.setSroleid(roleId);
					actorRightDao.save(right);
			}

	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IActorService#BaseDelete(java.lang.String[])
	 */
	@Override
	public void BaseDelete(String[] checkboxId) throws ServiceException {

		// 普通角色
		long i = actorDao.countBeUsedActor(Lists.newArrayList(checkboxId));
		if (i > 0) {
			E.S("角色已经被使用,不能删除!");
		}
		// 特殊角色
		long j = actorDao.countBeUsedSpecialActor(Lists
				.newArrayList(checkboxId));
		if (j > 0) {
			E.S("角色已经被使用,不能删除!");
		}

		for (String id : checkboxId) {
			if (B.N(id)) {
				if (actorDao.findOne(id) != null) {
					actorDao.delete(id);
					actorRightDao.deleteByRoleId(id);
				}
			}
		}
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IActorService#findSpecialCheckedActor(java.lang.String)
	 */
	@Override
	public List<Actor> findSpecialCheckedActor(String memberId)
			throws ServiceException {
		return actorDao.findCheckedActor(memberId);
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IActorService#findSpecialNoCheckedActor(java.lang.String)
	 */
	@Override
	public List<Actor> findSpecialNoCheckedActor(String memberId)
			throws ServiceException {
		return actorDao.findNotCheckedActor(memberId);
	}

	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IActorService#memberActorSave(com.frogsing.po.entity.hy.Actor, java.lang.String)
	 */
	@Override
	public void memberActorSave(Actor actor, String smemberid,ILoginUser u)
			throws ServiceException {
		this.actorDao.save(actor);
		if(countBySrolename(actor.getSrolename(),smemberid)>1){
			E.S("角色名重复，保存失败！");
		}
	}
	
	/* (non-Javadoc)
	 * @see com.frogsing.service.hy.IActorService#countBySrolename(java.lang.String, java.lang.String)
	 */
	@Override
	public long countBySrolename(String srolename,String smemberid){
		return actorDao.countBySrolename(srolename,smemberid);
	}

	@Override
	public Actor findOne(String id) {
		return actorDao.findOne(id);
	}

	public List<Actor> findActorsByRight(final String right){
		return this.actorDao.findAll(new Specification<Actor>() {
			@Override
			public Predicate toPredicate(Root<Actor> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				ListJoin<Actor,Right> join= root.join(root.getModel().getList("rightList",Right.class),JoinType.LEFT);
				return cb.equal(join.get(hy_right.spurcode),right);
			}
		});
	}
}
