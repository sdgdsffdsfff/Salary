package com.salary.dao;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.hibernate.transform.Transformers;

/**
 * 通用增删改查类
 * @author 陈捷
 *
 */
public class CRUDDaoImpl<T> implements CRUDDao<T> {
	private Logger logger=Logger.getLogger(CRUDDaoImpl.class);
	
	public SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	@Override
	public void add(T t) {
		Session session=sessionFactory.openSession();
		try {
			Transaction tr=session.beginTransaction();
			session.save(t);
			tr.commit();
			
		} catch (HibernateException e) {
			logger.error(e.getMessage());
		}finally{
			session.clear();
			session.close();
		}
	}
	
	@Override
	public void del(T t) {
		Session session=sessionFactory.openSession();
		try {
			Transaction tr=session.beginTransaction();
			session.delete(t);
			tr.commit();
			
		} catch (HibernateException e) {
			logger.error(e.getMessage());
		}finally{
			session.clear();
			session.close();
		}
	}
	
	@Override
	public void edit(T t) {
		Session session=sessionFactory.openSession();
		try {
			Transaction tr=session.beginTransaction();
			session.update(t);
			tr.commit();
			
		} catch (HibernateException e) {
			logger.error(e.getMessage());
		}finally{
			session.clear();
			session.close();
		}
	}
	
	
	@Override
	public T get(String hql,Map<String,Object> params) {
		return this.query(hql, params).get(0);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryNaviSql(String sql,Map<String, Object> params) {
		Session session=sessionFactory.openSession();
		try {
			Query query=session.createSQLQuery(sql);
			if(params!=null && !params.isEmpty()){
				for(String key:params.keySet()){
					query.setParameter(key, params.get(key));
				}
			}
			query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
			
			return query.list();
		} catch (HibernateException e) {
			logger.error(e.getMessage());
		}finally{
			session.clear();
			session.close();
		}
		
		return null;
	}
	
	
	/**
	 * 利用动态sql语句来获取工资项目明细表的金额
	 * @param dynmaicsql	动态sql语句
	 * @return				工资明细表的金额
	 */
	public BigDecimal getSalarydetailmoney(String dynmaicsql){
		try {
			return (BigDecimal) queryNaviSql(dynmaicsql, null).get(0).get("money");
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return null;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> query(String hql, Map<String, Object> params) {
		Session session = sessionFactory.openSession();
		try {
			Query query=session.createQuery(hql);
			if(params!=null && !params.isEmpty()){
				for(String key:params.keySet())
				query.setParameter(key, params.get(key));
			}
			
			return (List<T>) query.list();
		} catch (HibernateException e) {
			logger.error(e.getMessage());
		}finally{
			session.clear();
			session.close();
		}
		
		return null;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> queryByPage(String hql, Map<String, Object> params,int pageNum, int pageSize) {
		Session session = sessionFactory.openSession();
		try {
			Query query=session.createQuery(hql);
			if(params!=null && !params.isEmpty()){
				for(String key:params.keySet())
				query.setParameter(key, params.get(key));
			}
			int firstResultNum=(pageNum-1)*pageSize;
			query.setFirstResult(firstResultNum);
			query.setMaxResults(pageSize);
			
			return (List<T>) query.list();
		} catch (HibernateException e) {
			logger.error(e.getMessage());
		}finally{
			session.clear();
			session.close();
		}
		
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> queryNaviSqlByPage(String sql,Map<String, Object> params, int pageNum, int pageSize) {
		Session session=sessionFactory.openSession();
		try {
			Query query=session.createSQLQuery(sql);
			if(params!=null && !params.isEmpty()){
				for(String key:params.keySet()){
					query.setParameter(key, params.get(key));
				}
			}
			
			int firstResultNum=(pageNum-1)*pageSize;
			query.setFirstResult(firstResultNum);
			query.setMaxResults(pageSize);
			query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
			
			return query.list();
		} catch (HibernateException e) {
			logger.error(e.getMessage());
		}finally{
			session.clear();
			session.close();
		}
		
		return null;
	}
	
	
	
	/**
	 * 执行SQL语句
	 * @param sql
	 */
	public void executeSQL(String sql){
		Session session=sessionFactory.openSession();
		try {
			Transaction tr=session.beginTransaction();
			Query query=session.createSQLQuery(sql);
			query.executeUpdate();
			tr.commit();
			
		} catch (HibernateException e) {
			e.printStackTrace();
		}finally{
			session.clear();
			session.close();
		}
	}
	
	/**
	 * 根据账套id来初始化本月的工资项目明细
	 * @param account_id	奖金期间id
	 */
	@SuppressWarnings("deprecation")
	public void callprInitsalarydetail(Integer account_id){
		Session session=sessionFactory.openSession();
		Connection conn=null;
		CallableStatement stmt=null;
		try {
			Transaction tr=session.beginTransaction();
			conn=session.connection();
			String procudure="{call prInitsalarydetail(?)}";
			stmt=conn.prepareCall(procudure);
			stmt.setInt(1, account_id);
			stmt.executeUpdate();
			conn.commit();
			tr.commit();
		} catch (SQLException e) {
			logger.error(e.getMessage());
		}finally{
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			session.clear();
			session.close();
		}
	}
	
	
	/**
	 * 设置员工工资项目金额
	 * @param account_id 		奖金期间id
	 * @param emp_id			员工id
	 * @param salary_item_id	奖金项目
	 * @param money				奖金金额
	 */
	@SuppressWarnings("deprecation")
	public void callprSetsalarydetail(int account_id,int emp_id,int salary_item_id,BigDecimal money){
		Session session = sessionFactory.openSession();
		Connection conn=null;
		CallableStatement stmt=null;
		try {
			
			Transaction tr = session.beginTransaction();
			conn=session.connection();
			String procedure="{call prSetsalarydetail(?,?,?,?)}";
			stmt=conn.prepareCall(procedure);
			stmt.setInt(1, account_id);
			stmt.setInt(2, emp_id);
			stmt.setInt(3, salary_item_id);
			stmt.setBigDecimal(4, money);
			stmt.execute();
			tr.commit();
			
		} catch (SQLException e) {
			logger.error(e.getMessage());
		}finally{
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			session.clear();
			session.close();
		}
	}
	
	
	/**
	 * 根据员工CODE来设置该员工的奖金明细
	 * @param account_id		奖金期间id
	 * @param emp_code			员工code
	 * @param salary_item_id	奖金项目id
	 * @param money				奖金金额
	 */
	@SuppressWarnings("deprecation")
	public void callprSetsalarydetailByEmpCode(int account_id,String emp_code,int salary_item_id,BigDecimal money){
		Session session = sessionFactory.openSession();
		Connection conn=null;
		CallableStatement stmt=null;
		try {
			
			Transaction tr = session.beginTransaction();
			conn=session.connection();
			String procedure="{call prSetSalaryDetailByEmpCode(?,?,?,?)}";
			stmt=conn.prepareCall(procedure);
			stmt.setInt(1, account_id);
			stmt.setString(2, emp_code);
			stmt.setInt(3, salary_item_id);
			stmt.setBigDecimal(4, money);
			stmt.execute();
			tr.commit();
			
		} catch (SQLException e) {
			logger.error(e.getMessage());
		}finally{
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			session.clear();
			session.close();
		}
	}
	
}
