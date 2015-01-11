package com.salary.dao;

import java.util.List;
import java.util.Map;

/**
 * 数据增删改查接口
 * @author 陈捷
 *
 */
public interface CRUDDao<T> {
	/**
	 * 添加数据
	 * @param t	实体类
	 */
	public void add(T t);
	
	/**
	 * 删除数据
	 * @param t	实体类
	 */
	public void del(T t);
	
	/**
	 * 修改数据
	 * @param t	实体类
	 */
	public void edit(T t);
	
	
	/**
	 * 自定义查询语句获取对象列表
	 * @param sql		sql语句
	 * @param params	参数，字段名+值
	 * @return			sql语句查询的对象列表
	 */
	public List<Map<String,Object>> queryNaviSql(String sql,Map<String,Object> params);
	
	/**
	 * 根据hql语句来查询实体对象
	 * @param hql		Hibernate语句
	 * @param params	查询参数，字段名+值
	 * @return			实体对象
	 */
	public List<T> query(String hql,Map<String,Object> params);
	
	/**
	 * 根据hql语句分页查询实体对象
	 * @param hql		Hibetnate查询语句
	 * @param params	查询参数，字段名+值
	 * @param pageNum	分页号
	 * @param pageSize	分页大小
	 * @return			实体对象(分页)
	 */
	public List<T> queryByPage(String hql,Map<String,Object> params,int pageNum,int pageSize);
	
	/**
	 * 根据hql语句查询实体对象
	 * @param hql		Hibernate查询语句
	 * @param params	查询参数，字段名+值
	 * @return			实体对象(单一)
	 */
	public T get(String hql,Map<String,Object> params);
	
	/**
	 * 根据自定义SQL语句来查询数据
	 * @param sql		自定义查询SQL
	 * @param params	参数，字段名+值
	 * @param pageNum	分页号
	 * @param pageSize	分页大小
	 * @return			List<Map<String,Object>>
	 */
	public List<Map<String,Object>> queryNaviSqlByPage(String sql,Map<String,Object> params,int pageNum,int pageSize);
	
}
