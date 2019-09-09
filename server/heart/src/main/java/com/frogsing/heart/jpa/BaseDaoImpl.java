package com.frogsing.heart.jpa;

import com.frogsing.heart.exception.E;
import com.frogsing.heart.persistence.DynamicSpecifications;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.security.utils.AnnotationUtils;
import com.frogsing.heart.utils.DateTimeConverter;
import com.frogsing.heart.utils.R;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.internal.SessionImpl;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.query.QueryUtils;
import org.springframework.data.repository.NoRepositoryBean;

import javax.persistence.*;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

@NoRepositoryBean
public class BaseDaoImpl<T, ID extends Serializable> extends
		SimpleJpaRepositoryEx<T, ID> implements BaseDao<T, ID> {
	
	// There are two constructors to choose from, either can be used.
	public BaseDaoImpl(Class<T> domainClass, EntityManager entityManager) {
		super(domainClass, entityManager);

	}

	@Override
	public List<Map<String,Object>> procedure(String sql, Object[] paras) {
		try {
			ResultSet res = null;
			Connection conn = ((SessionImpl) em.getDelegate()).connection();
			CallableStatement proc = conn
					.prepareCall(sql);
			//int out=1;
			if (paras != null){
				for (int i = 0; i < paras.length; i++)
					proc.setObject(i+1 , paras[i]);
				//out=paras.length+1;
			}

			//proc.registerOutParameter(1, Types.REF_CURSOR);

			boolean bool=proc.execute();
			res = proc.getResultSet();

			List<Map<String,Object>> list=Lists.newArrayList();
			while (res.next()) {
				ResultSetMetaData rmd = res.getMetaData();
				Map<String,Object> map= Maps.newHashMap();
				int num = rmd.getColumnCount();
				for (int i = 1; i <= num; i++) {

					if (res.getObject(rmd.getColumnName(i)) != null)
						map.put(rmd.getColumnName(i),  res
								.getObject(rmd.getColumnName(i)));
//						BeanUtils.setProperty(object, rmd.getColumnName(i)
//								.toLowerCase().equals("sguid") ? "id" : rmd
//								.getColumnName(i).toLowerCase(), res
//								.getObject(rmd.getColumnName(i)));
				}
				list.add(map);
				//break;
			}
			proc.close();



			return list;

		} catch (Exception e) {

			e.printStackTrace();
			System.gc();
			E.S("执行存储过程出错");
			return null;
		}

		/*Query query = em.createNativeQuery(sql);

		if (paras != null)
			for (int i = 0; i < paras.length; i++)
				query.setParameter(i + 1, paras[i]);

		Object result = query.getSingleResult();
		if (result == null)
			return "";
		return result.toString();*/
	}
//	@Override
//	public void setLockMetadataProvider(
//			LockMetadataProvider lockMetadataProvider) {
//		super.setLockMetadataProvider(lockMetadataProvider);
//		this.lockMetadataProvider = lockMetadataProvider;
//		
//	}
	@Override
	public void detach(T obj){
		em.detach(obj);
	}
	public String getSeqNo(String name) {
	
		try {
			String temp = null;
			Connection conn = ((SessionImpl) em.getDelegate()).connection();
			CallableStatement proc = conn
					.prepareCall("{call pd_GetSeqNo(?,?)}");

			proc.setString(1, name);
			proc.registerOutParameter(2, Types.VARCHAR);
			proc.execute();
			temp = proc.getString(2);
			proc.close();

			return temp;

		} catch (Exception e) {

			e.printStackTrace();
			System.gc();
			E.S("编号生成故障:" + name);
			return null;
		}

	}

	@Override
	public long count(String nameCol, Object nameVal, String id) {

		boolean hasid = StringUtils.isNotBlank(id);
		String sql = "select count(*)  FROM "
				+ getDomainClass().getSimpleName() + " t WHERE t." + nameCol
				+ "= :" + nameCol;
		if (hasid)
			sql += " and t.id<> :id";
		Query query = em.createQuery(sql);
		query.setParameter(nameCol, nameVal);
		if (hasid)
			query.setParameter("id", id);
		long i = (Long) query.getSingleResult();

		return i;

	}

	@Override
	public long count(String nameCol, Object nameVal) {

		String sql = "select count(*)  FROM "
				+ getDomainClass().getSimpleName() + " t WHERE t." + nameCol
				+ "= :" + nameCol;
		Query query = em.createQuery(sql);
		query.setParameter(nameCol, nameVal);
		long i = (Long) query.getSingleResult();
		return i;
	}

	@Override
	public long countIgnoreCase(String nameCol, String nameVal, String id) {
		boolean hasid = StringUtils.isNotBlank(id);
		String sql = "select count(*)  FROM "
				+ getDomainClass().getSimpleName() + " t WHERE lower(t."
				+ nameCol + ") = :" + nameCol;
		if (hasid)
			sql += " and t.id<> :id";
		Query query = em.createQuery(sql);
		query.setParameter(nameCol, nameVal.toLowerCase());
		if (hasid)
			query.setParameter("id", id);
		long i = (Long) query.getSingleResult();

		return i;
	}

	@Override
	public long countIgnoreCase(String nameCol, String nameVal) {
		String sql = "select count(*)  FROM "
				+ getDomainClass().getSimpleName() + " t WHERE lower(t."
				+ nameCol + ") = :" + nameCol;
		Query query = em.createQuery(sql);
		query.setParameter(nameCol, nameVal.toLowerCase());
		long i = (Long) query.getSingleResult();
		return i;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> findByPropertyName(String nameCol, Object nameVal) {
		String sql = "FROM " + getDomainClass().getSimpleName() + " t WHERE t."
				+ nameCol + "= :" + nameCol;

		Query query = em.createQuery(sql);
		query.setParameter(nameCol, nameVal);

		return query.getResultList();
	}

	@Override
	public T findOneByPropertyName(final String nameCol,final Object nameVal) {
		return findOne(new Specification<T>() {

			@Override
			public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query,
					CriteriaBuilder cb) {
				return cb.equal(root.get(nameCol), nameVal);
			}
		});
	}

	
	@Override
	public List<T> findAllLimit(Class<T> objClass, Specification<T> spec,
								Sort sort, int limit) {
		if (objClass == null)
			objClass = getDomainClass();
		CriteriaBuilder builder = em.getCriteriaBuilder();
		CriteriaQuery<T> query = builder.createQuery(objClass);

		Root<T> root = query.from(objClass);

		if (spec != null) {
			Predicate predicate = spec.toPredicate(root, query, builder);
			if (predicate != null) {
				query.where(predicate);
			}
		}

		if (sort != null) {
			query.orderBy(QueryUtils.toOrders(sort, root, builder));
		}
		query.select(root);
		TypedQuery<T> typeQuery = em.createQuery(query);
		typeQuery.setMaxResults(limit);
		return typeQuery.getResultList();
	}



	@Override
	public List<?> findBySql(String sql, Object... paras) {
		Query query = em.createNativeQuery(sql);
		if (paras != null && paras.length > 0)
			for (int i = 0; i < paras.length; i++)
				if (paras[i] instanceof Date)
					query.setParameter(i + 1, (Date) paras[i],
							TemporalType.DATE);
				else
					query.setParameter(i + 1, paras[i]);

		return query.getResultList();
	}

	@Override
	public List<?> findByJql(String sql, Object... paras) {
		//

		Query query = em.createQuery(sql);
		if (paras != null)
			for (int i = 0; i < paras.length; i++)
				query.setParameter(i + 1, paras[i]);

		return query.getResultList();
	}

	@Override
	public List<T> findAllLimit(Specification<T> spec, Sort sort, int limit) {
		return this.findAllLimit(getDomainClass(), spec, sort, limit);
	}

	@Override
	public String executeProcedure(String sql, Object[] paras) {
		try {
			String temp = null;
			Connection conn = ((SessionImpl) em.getDelegate()).connection();
			CallableStatement proc = conn.prepareCall(sql);
			int out = 1;
			if (paras != null) {
				for (int i = 0; i < paras.length; i++)
					proc.setObject(i + 1, paras[i]);
				out = paras.length + 1;
			}

			proc.registerOutParameter(out, Types.VARCHAR);
			proc.execute();
			temp = proc.getString(out);
			proc.close();

			return temp;

		} catch (Exception e) {

			e.printStackTrace();
			System.gc();
			E.S("执行存储过程出错");
			return null;
		}

		/*
		 * Query query = em.createNativeQuery(sql);
		 * 
		 * if (paras != null) for (int i = 0; i < paras.length; i++)
		 * query.setParameter(i + 1, paras[i]);
		 * 
		 * Object result = query.getSingleResult(); if (result == null) return
		 * ""; return result.toString();
		 */
	}

	@Override
	public Object getFieldValue(String sql, Object... paras) {
		Query query = em.createNativeQuery(sql);
		if (paras != null && paras.length > 0)
			for (int i = 0; i < paras.length; i++)
				if (paras[i] instanceof Date)
					query.setParameter(i + 1, (Date) paras[i],
							TemporalType.DATE);
				else
					query.setParameter(i + 1, paras[i]);
		return query.getSingleResult();

	}

	@Override
	public int executeNativeSql(String sql, Object... paras) {
		Query query = em.createNativeQuery(sql);
		if (paras != null && paras.length > 0)
			for (int i = 0; i < paras.length; i++)
				if (paras[i] instanceof Date)
					query.setParameter(i + 1, (Date) paras[i],
							TemporalType.DATE);
				else
					query.setParameter(i + 1, paras[i]);
		return query.executeUpdate();

	}

	@Override
	public <V> List<V> findBySql(Class<V> objClass, String sql, Object... paras) {
		List<V> list = new ArrayList<V>();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		try {
			pstmt = ((SessionImpl) em.getDelegate()).connection()
					.prepareStatement(sql);
			if (paras != null)
				for (int i = 0; i < paras.length; i++) {
					pstmt.setObject(i + 1, paras[i]);
				}
			res = pstmt.executeQuery();
			while (res.next()) {
				@SuppressWarnings("unchecked")
				V vo = (V) Class.forName(objClass.getName()).newInstance();
				ResultSetMetaData rmd = res.getMetaData();
				int num = rmd.getColumnCount();
				for (int i = 1; i <= num; i++) {
					if (res.getObject(rmd.getColumnName(i)) != null)
						BeanUtils.setProperty(vo, rmd.getColumnName(i)
								.toLowerCase().equals("sguid") ? "id" : rmd
								.getColumnName(i).toLowerCase(), res
								.getObject(rmd.getColumnName(i)));
				}
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.gc();
		} finally {
			try {
				if (res != null)
					res.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public <V> List<V> findBySql(Class<V> objClass, String sql, int limit,
			Object... paras) {
		List<V> list = new ArrayList<V>();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		try {
			pstmt = ((SessionImpl) em.getDelegate()).connection()
					.prepareStatement(sql);
			if (paras != null)
				for (int i = 0; i < paras.length; i++) {
					pstmt.setObject(i + 1, paras[i]);
				}
			pstmt.setMaxRows(limit);
			res = pstmt.executeQuery();
			while (res.next()) {
				@SuppressWarnings("unchecked")
				V vo = (V) Class.forName(objClass.getName()).newInstance();
				ResultSetMetaData rmd = res.getMetaData();
				int num = rmd.getColumnCount();
				for (int i = 1; i <= num; i++) {
					if (res.getObject(rmd.getColumnName(i)) != null)
						BeanUtils.setProperty(vo, rmd.getColumnName(i)
								.toLowerCase().equals("sguid") ? "id" : rmd
								.getColumnName(i).toLowerCase(), res
								.getObject(rmd.getColumnName(i)));
				}
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.gc();
		} finally {
			try {
				if (res != null)
					res.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public <V> Page<V> findPageBySql(Class<V> objClass, String sql,
			Pageable pageable, Object... paras) {
		PreparedStatement stmt = null;
		ResultSet res = null;
		List<V> vos = Lists.newArrayList();
		long totalCount = 0;
		try {
			ConvertUtils
					.register(new DateTimeConverter(), Date.class);
			// 取总记录数
			totalCount = this.getCountQuery(sql, paras);

			stmt = ((SessionImpl) em.getDelegate()).connection()
					.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE,
							ResultSet.CONCUR_UPDATABLE);
			if (paras != null)
				for (int i = 0; i < paras.length; i++) {
					stmt.setObject(i + 1, paras[i]);
				}

			int maxNum = pageable.getOffset() + pageable.getPageSize();
			stmt.setMaxRows((maxNum > totalCount) ? (int) totalCount : maxNum);
			res = stmt.executeQuery();
			res.absolute(pageable.getOffset() + 1);
			res.previous();

			ResultSetMetaData rmd = res.getMetaData();
			int num = rmd.getColumnCount();

			V vo = null;
			while (res.next()) {
				vo = (V) Class.forName(objClass.getName()).newInstance();
				for (int i = 1; i <= num; i++) {
					if (res.getObject(rmd.getColumnName(i)) != null)
						BeanUtils.setProperty(vo, rmd.getColumnName(i)
								.toLowerCase().equals("sguid") ? "id" : rmd
								.getColumnName(i).toLowerCase(), res
								.getObject(rmd.getColumnName(i)));
				}
				vos.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.gc();
		} finally {
			try {
				if (res != null)
					res.close();
				if (stmt != null)
					stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return new PageImpl<V>(vos, pageable, totalCount);
	}

	@SuppressWarnings("unchecked")
	@Override
	public <V> V  findObjectBySql(Class<V> objClass, String sql,
			Object... paras) { 
		PreparedStatement pstmt = null;
		ResultSet res = null;
		try {
			V object = (V) Class.forName(objClass.getName()).newInstance();
			pstmt = ((SessionImpl) em.getDelegate()).connection()
					.prepareStatement(sql);
			if (paras != null)
				for (int i = 0; i < paras.length; i++) {
					pstmt.setObject(i + 1, paras[i]);
				}
			res = pstmt.executeQuery();
			while (res.next()) {
				ResultSetMetaData rmd = res.getMetaData();
				int num = rmd.getColumnCount();
				for (int i = 1; i <= num; i++) {
					if (res.getObject(rmd.getColumnName(i)) != null)
						BeanUtils.setProperty(object, rmd.getColumnName(i)
								.toLowerCase().equals("sguid") ? "id" : rmd
								.getColumnName(i).toLowerCase(), res
								.getObject(rmd.getColumnName(i)));
				}
				break;
			}
			return object;
		} catch (Exception e) {
			e.printStackTrace();
			System.gc();
		} finally {
			try {
				if (res != null)
					res.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	/**
	 * 统计当前查询语句的总记录数
	 * 
	 * @param sql
	 * @param paras
	 * @return
	 */
	private long getCountQuery(String sql, Object... paras) {
		return ((BigInteger) this.getFieldValue("select count(1) from(" + sql
				+ ") as temptable ", paras)).longValue();
	}

	@Override
	public T lock(String id, LockModeType... lockmodetype) {
		T entity = em.find(getDomainClass(), id);
		if(entity == null)
			return null;
		this.lock(entity, lockmodetype);
		return entity;
	}

	@Override
	public void lock(T entity, LockModeType... lockmodetype) {
		if(entity == null)
			return;
		if (lockmodetype.length == 0)
			em.refresh(entity, LockModeType.PESSIMISTIC_WRITE);
		else
			em.refresh(entity, lockmodetype[0]);
	}

	@Override
	public long countIgnoreCaseMember(String nameCol, String nameVal) {
		String sql = "select count(*)  FROM "
				+ getDomainClass().getSimpleName() + " t WHERE iauthtype > 0  and lower(t."
				+ nameCol + ") = :" + nameCol;
		Query query = em.createQuery(sql);
		query.setParameter(nameCol, nameVal.toLowerCase());
		long i = (Long) query.getSingleResult();
		return i;
	}

	@Override
	public T fetchOne(ID id) {
		T obj=this.findOne(id);
		if(obj!=null) {
			AnnotationUtils.fetchAll(obj,false);

		}
		//Hibernate.initialize(obj);
		return obj;
	}
	@Override
	public List<T> findAll(Specification<T> spec, PageSort sort){
		return  findAll(spec,sort.ToSort());
	}

	@Override
	public Page<T> findPage(Pageable page, Map<String, Object> searchParams, SearchFilter... searchFilters) {
		Specification<T> spec;
		Map<String, SearchFilter> ss;
		if (searchParams != null)
			ss = SearchFilter.parse(searchParams);
		else
			ss = Maps.newHashMap();

		for (SearchFilter sf : searchFilters) {
			ss.put(sf.fieldName, sf);
		}
		spec = DynamicSpecifications.bySearchFilter(ss.values(), getDomainClass());

		return this.findAll(spec, page);
	}

	@Override
	public List<T> findAll(Map<String, Object> searchParams, PageSort sort,SearchFilter... searchFilters) {
		Specification<T> spec;
		Map<String, SearchFilter> ss;
		if (searchParams != null)
			ss = SearchFilter.parse(searchParams);
		else
			ss = Maps.newHashMap();

		for (SearchFilter sf : searchFilters) {
			if (sf.value == null)
				continue;
			ss.put(sf.fieldName, sf);
		}

		spec = DynamicSpecifications.bySearchFilter(ss.values(),getDomainClass());
		return findAll(spec, sort.ToSort());
	}

	@Override
	public List<T> findAll(Map<String, Object> searchParams,SearchFilter... searchFilters) {
		Specification<T> spec;
		Map<String, SearchFilter> ss;
		if (searchParams != null)
			ss = SearchFilter.parse(searchParams);
		else
			ss = Maps.newHashMap();

		for (SearchFilter sf : searchFilters) {
			if (sf.value == null)
				continue;
			ss.put(sf.fieldName, sf);
		}

		spec = DynamicSpecifications.bySearchFilter(ss.values(),getDomainClass());
		return findAll(spec);
	}

	@Override
	public Page<T> findPage(Pageable page, Map<String, Object> searchParams, Specification<T> diySpec) {
		final Specification<T> spec;
		Map<String, SearchFilter> ss;
		if (searchParams != null)
			ss = SearchFilter.parse(searchParams);
		else
			ss = Maps.newHashMap();

		spec = DynamicSpecifications.bySearchFilter(ss.values(), getDomainClass());

		Specification<T> last = new Specification<T>() {

			public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query,
										 CriteriaBuilder cb) {
				if(diySpec == null)
					return spec.toPredicate(root, query, cb);
				else
					return cb.and(spec.toPredicate(root, query, cb),
							diySpec.toPredicate(root, query, cb));
			}
		};
		return findAll(last, page);
	}

	@Override
	public Page<T> findPage(Pageable page, Specification<T> spec) {
		return findAll(spec, page);
	}
}
