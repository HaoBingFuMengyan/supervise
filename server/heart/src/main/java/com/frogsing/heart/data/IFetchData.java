package com.frogsing.heart.data;

import com.frogsing.heart.entity.BaseEntity;
import com.frogsing.heart.persistence.SearchFilter;
import com.frogsing.heart.web.login.ILoginUser;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface IFetchData<T> {


	/**打开新增 修改 查看 页面时调用该方法,获取额外的数据到Model
	 * @param obj 新增时:obj设置了链接的参数,修改时obj是从数据库加载的对象.
	 * @param map 需要额外的数据请放到map里,规则同 Model
	 */
	void fetchDetailData(T obj, Map<String, Object> map);

	void fetchDetailData(T obj, Map<String, Object> map,ILoginUser u);


	/**打开列表页调用该方法,获取额外的数据到Model,对列表数据做处理
	 * @param map 需要额外的数据请放到map里,规则同 Model
	 * @param page 分页对象信息
	 * @param searchParams 查询自动过滤器
	 * @param searchFilters 手动过滤器
	 */
	boolean fetchListData(Map<String, Object> map, Pageable page, Map<String, Object> searchParams, SearchFilter[] searchFilters);

	boolean fetchListData(Map<String, Object> map, Pageable page, Map<String, Object> searchParams, SearchFilter[] searchFilters,ILoginUser u);

	/**保存对象时,如果新增,在保存之前调用该方法做特殊处理
	 * @param vo 要保存的对象
	 * @param u  操作员信息
	 */
	void beforeAdd(T vo, ILoginUser u);


    /**保存对象时,如果新增,在保存之后调用该方法做特殊处理
     * @param vo 要保存的对象
     * @param u  操作员信息
     */
    void afterAdd(T vo, ILoginUser u);

    /**保存对象时,如果修改,在保存之前调用该方法做特殊处理
     * @param vo 要保存的对象
     * @param u  操作员信息
     */
	void beforeUpdate(T vo, T po, ILoginUser u);

    /**保存对象时,如果修改,在保存之后调用该方法做特殊处理
     * @param vo 要保存的对象
     * @param u  操作员信息
     */
	void afterUpdte(T vo, T po, ILoginUser u);

    /**保存对象时 ,新增或修改 在保存之前调用该方法做特殊处理,及验证
     * @param vo 要保存的对象
     * @param u  操作员信息
     */
	void commonCheck(T vo, ILoginUser u);

    /**删除对象时,在删除之前调用该方法做特殊处理
     * @param list 要删除的对象
     */
	void beforeDelete(List<T> list);
    /**删除对象时,在删除之后调用该方法做特殊处理
     * @param list 要删除的对象
     */
	void afterDelete(List<T> list);

    /**保存对象时 ,新增或修改 在保存之后调用该方法做特殊处理,及验证
     * @param vo 要保存的对象信息
     * @param po 保存后的对象
     * @param u  操作员信息
     *
     */
	void afterSave(T vo, T po, ILoginUser u);

	/**保存对象时 ,新增或修改 在保存之前调用该方法做特殊处理
	 * @param vo 要保存的对象信息
	 * @param po 保存后的对象
	 * @param u  操作员信息
	 *
	 */
	void beforeSave(T vo, T po, ILoginUser u);

	/**
	 * 返回false,没有删除,让系统框架删除
	 * @param list
	 * @return
	 */
	boolean doDelete(List<T> list);

	boolean doDelete(List<T> list,ILoginUser u);


    boolean doSave(BaseEntity vo, ILoginUser u);
}