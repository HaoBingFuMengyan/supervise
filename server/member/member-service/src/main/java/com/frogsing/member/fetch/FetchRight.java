package com.frogsing.member.fetch;

import com.frogsing.heart.consts.Consts;
import com.frogsing.heart.data.BaseFetch;
import com.frogsing.heart.exception.E;
import com.frogsing.heart.jpa.PageSort;
import com.frogsing.heart.utils.B;
import com.frogsing.heart.utils.T;
import com.frogsing.member.dao.RightDao;
import com.frogsing.member.po.Right;
import com.frogsing.member.utils.MEMBER;
import com.frogsing.member.utils.MEMBERCol;
import com.google.common.collect.Lists;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Map;

@Component
public class FetchRight extends BaseFetch<Right>{

	@Autowired
	private RightDao rightDao;

	@Override
	public void commonCheck(Right obj,com.frogsing.heart.web.login.ILoginUser u) {
		obj.setBisroot(0);
		if (B.Y(obj.getSparentid()))
			E.S("父节点不能为空!");

        if(StringUtils.isNumeric(obj.getSparentid())){
            MEMBER.MemberType itype;
            itype=MEMBER.MemberType.get(Integer.parseInt(obj.getSparentid()));
            obj.setIpurtype(itype.val());
        }
        else {
            Right right = rightDao.findOne(obj.getSparentid());
            if (right != null) {
                right.setBisleaf(Consts.BoolType.NO.val());
                rightDao.save(right);
                obj.setIpurtype(right.getIpurtype());
                rightDao.flush();
            }
            else
                E.S("父节点不能为空");
        }

		if (B.Y(obj.getId())) {
			long i = rightDao.rightCount(obj.getSpurname(), obj.getIpurtype());
			if (i > 0)
				E.S("权限名定义重复");
			obj.setSpurcode("0000");
			long x=rightDao.count(MEMBERCol.hy_right.sparentid,obj.getSparentid());
			obj.setSpurno(String.valueOf(1000+x));
			obj.setDadddate(T.now());
			obj.setBisleaf(Consts.BoolType.YES.val());
		} else {
			long i = rightDao.rightCount(obj.getSpurname(), obj.getIpurtype(),
					obj.getId());
			if (i > 0)
				E.S("权限定义重复");
		}
	}

	@Override
	public void fetchDetailData(Right obj, Map<String, Object> map) {
         Right parent = rightDao.findOne(obj.getSparentid());
		List<Right> list;
		if(parent==null){
			list= Lists.newArrayList();
			parent=new Right();
			MEMBER.MemberType type = MEMBER.MemberType.get(Integer.parseInt(obj.getSparentid()));
			parent.setId(String.valueOf(type.val()));
			parent.setSpurname(type.label());

			MEMBER.MemberType[] rs = MEMBER.MemberType.values();
			for (MEMBER.MemberType m : rs) {
				if (m.val() == 0)
					continue;
				Right t=new Right();
				t.setId(String.valueOf(m.val()));
				t.setSpurname(m.label());
				list.add(t);
			}
		}
		else {
			final  int purtype=parent.getIpurtype();
			list= rightDao.findAll(new Specification<Right>() {
				@Override
				public Predicate toPredicate(Root<Right> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					return cb.and(
							cb.equal(
									MEMBERCol.hy_right.ipurtype(root),purtype ),
							cb.equal(
									MEMBERCol.hy_right.bisleaf(root),0 )
							);
				}
			}, PageSort.Asc(MEMBERCol.hy_right.spurno).ToSort());
		}
        map.put("parent",parent);
		map.put("parents",list);

	}
}
