package com.salary.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

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
	
	
	/**
	 * 执行SQL语句
	 * @param sql
	 */
	public void executeSQL(String sql);
	
	
	
	/**
	 * 根据账套id来初始化本月的工资项目明细
	 * @param account_id	奖金期间id
	 */
	public void callprInitsalarydetail(Integer account_id);
	
	
	
	/**
	 * 设置员工工资项目金额
	 * @param account_id 		奖金期间id
	 * @param emp_id			员工id
	 * @param salary_item_id	奖金项目
	 * @param money				奖金金额
	 */
	public void callprSetsalarydetail(int account_id,int emp_id,int salary_item_id,BigDecimal money);
	
	
	/**
	 * 根据员工CODE来设置该员工的奖金明细
	 * @param account_id		奖金期间id
	 * @param emp_code			员工code
	 * @param salary_item_id	奖金项目id
	 * @param money				奖金金额
	 */
	public void callprSetsalarydetailByEmpCode(int account_id,String emp_code,int salary_item_id,BigDecimal money);
	
	
	
	/**
	 * 根据员工A6CODE来设置该员工的奖金明细
	 * @param account_id		奖金期间id
	 * @param emp_codea6		A6员工code
	 * @param salary_item_id	奖金项目id
	 * @param money				奖金金额
	 */
	public void callprSetsalarydetailByEmpCodeA6(int account_id,String emp_codea6,int salary_item_id,BigDecimal money);
	
	
	/**
	 * 根据实体类的名称和id，来返回实体的信息
	 * 
	 * @param id 			实体ID
	 * @param EntityName 	实体类的名称
	 * @return 				实体的信息
	 */
	public T getEntityById(int id, String EntityName);
	
	
	/**
	 * 根据hql语句来返回所要查询的对象信息
	 * 
	 * @param hql 		hql语句
	 * @param params 	查询参数
	 * @return 			JSONObject的实体json列表数据
	 */
	public JSONObject getEntityJsonListBySql(String sql,Map<String, Object> params, Integer pageNum, Integer pageSize);
	
	
	/**
	 * 根据sql语句来获取总记录数
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public int getRowCountBySql(String sql, Map<String, Object> params);
	
	
	
	/**
	 * 根据hql语句来获取总记录数
	 * 
	 * @param hql
	 * @param params
	 * @return
	 */
	public int getRowCountByHql(String hql, Map<String, Object> params);
	
	
	
	
	
	
}
