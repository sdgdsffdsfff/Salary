package com.salary.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.salary.dao.CRUDDaoImpl;

/**
 * 通用增删改查service
 * @author 陈捷
 *
 */
public class CRUDService <T>{
	public CRUDDaoImpl<T> crudDaoimpl;

	public CRUDDaoImpl<T> getCrudDaoimpl() {
		return crudDaoimpl;
	}

	public void setCrudDaoimpl(CRUDDaoImpl<T> crudDaoimpl) {
		this.crudDaoimpl = crudDaoimpl;
	}
	
	
	/**
	 * 根据账套id来初始化本月的工资项目明细
	 * @param account_id	奖金期间id
	 */
	public void callprInitsalarydetail(Integer account_id){
		crudDaoimpl.callprInitsalarydetail(account_id);
	}
	
	
	/**
	 * 设置员工工资项目金额
	 * @param account_id 		奖金期间id
	 * @param emp_id			员工id
	 * @param salary_item_id	奖金项目
	 * @param money				奖金金额
	 */
	public void callprSetsalarydetail(int account_id,int emp_id,int salary_item_id,BigDecimal money){
		crudDaoimpl.callprSetsalarydetail(account_id, emp_id, salary_item_id, money);
	}
	
	
	/**
	 * 根据奖金期间来获取对应的奖金查询报表语句
	 * @param account_id	奖金id
	 * @return				奖金查询语句
	 */
	public String callfnGetsalarysql(int account_id){
		return crudDaoimpl.callfnGetsalarysql(account_id);
	}
	
	/**
	 * 增加
	 * @param t
	 */
	public void add(T t) {
		crudDaoimpl.add(t);
	}
	
	/**
	 * 删除
	 * @param t
	 */
	public void del(T t) {
		crudDaoimpl.del(t);
	}
	
	/**
	 * 修改
	 * @param t
	 */
	public void edit(T t) {
		crudDaoimpl.edit(t);
	}
	
	/**
	 * 根据hql语句获取实体类(单个)
	 * @param hql		Hibernate语句
	 * @param params	参数，字段名+值
	 * @return			实体类(单个)
	 */
	public T get(String hql,Map<String,Object> params) {
		return crudDaoimpl.query(hql, params).get(0);
	}
	
	
	/**
	 * 根据自定义SQL语句来查询信息
	 * @param sql		自定义SQL语句
	 * @param params	参数,字段名+值
	 * @return			List<Map<String, Object>>
	 */
	public List<Map<String, Object>> queryNaviSql(String sql,Map<String, Object> params) {
		return crudDaoimpl.queryNaviSql(sql, params);
	}
	
	
	/**
	 * 利用动态sql语句来获取工资项目明细表的金额
	 * @param dynmaicsql	动态sql语句
	 * @return				工资明细表的金额
	 */
	public BigDecimal getSalarydetailmoney(String dynmaicsql){
		return crudDaoimpl.getSalarydetailmoney(dynmaicsql);
	}
	
	
	/**
	 * 根据hql语句查询实体类列表
	 * @param hql		Hibernate语句
	 * @param params	参数，字段名+值
	 * @return			实体类列表
	 */
	public List<T> query(String hql, Map<String, Object> params) {
		return crudDaoimpl.query(hql, params);
	}
	
	
	/**
	 * 根据hql语句分页查询实体类列表
	 * @param hql			Hibernate语句
	 * @param params		参数，字段名+值
	 * @param pageNum		分页号
	 * @param pageSize		分页大小
	 * @return				实体类列表(分页)
	 */
	public List<T> queryByPage(String hql, Map<String, Object> params,int pageNum, int pageSize) {
		return crudDaoimpl.queryByPage(hql, params, pageNum, pageSize);
	}
	
	
	/**
	 * 根据自定义SQL语句来查询数据
	 * @param sql		自定义查询SQL
	 * @param params	参数，字段名+值
	 * @param pageNum	分页号
	 * @param pageSize	分页大小
	 * @return			List<Map<String,Object>>
	 */
	public List<Map<String, Object>> queryNaviSqlByPage(String sql,Map<String, Object> params, int pageNum, int pageSize) {
		return crudDaoimpl.queryNaviSqlByPage(sql, params, pageNum, pageSize);
	}
	
	/**
	 * 执行SQL语句
	 * @param sql	需要执行的SQL语句
	 */
	public void executeSQL(String sql){
		crudDaoimpl.executeSQL(sql);
	}
}
