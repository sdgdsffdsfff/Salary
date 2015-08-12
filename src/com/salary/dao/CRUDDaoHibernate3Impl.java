package com.salary.dao;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.hibernate.transform.Transformers;
import com.salary.util.NumberUtils;

/**
 * 通用增删改查类
 * @author 陈捷
 *
 */
@SuppressWarnings("unchecked")
public class CRUDDaoHibernate3Impl<T> implements CRUDDao<T> {
	private Logger logger=Logger.getLogger(CRUDDaoHibernate3Impl.class);
	
	public SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	@Override
	public void add(T t) {
		Session session=sessionFactory.getCurrentSession();
		session.save(t);
	}
	
	@Override
	public void del(T t) {
		Session session=sessionFactory.getCurrentSession();
		session.delete(t);
	}
	
	@Override
	public void edit(T t) {
		Session session=sessionFactory.getCurrentSession();
		session.update(t);
	}
	
	
	@Override
	public T get(String hql,Map<String,Object> params) {
		return this.query(hql, params).get(0);
	}
	
	
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
			logger.error("CRUDDaoImpl-->queryNaviSql Error:"+e.getMessage());
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
			logger.error("CRUDDaoImpl-->getSalarydetailmoney Error:"+e.getMessage());
		}
		
		return null;
	}
	
	
	@Override
	public List<T> query(String hql, Map<String, Object> params) {
		Session session = sessionFactory.openSession();
		try {
			Query query=session.createQuery(hql);
			if(params!=null && !params.isEmpty()){
				for(String key:params.keySet()){
					query.setParameter(key, params.get(key));
				}
			}
			
			return (List<T>) query.list();
		} catch (HibernateException e) {
			logger.error("CRUDDaoImpl-->query Error:"+e.getMessage());
		}finally{
			session.clear();
			session.close();
		}
		
		return null;
	}
	
	
	@Override
	public List<T> queryByPage(String hql, Map<String, Object> params,int pageNum, int pageSize) {
		Session session = sessionFactory.openSession();
		try {
			Query query=session.createQuery(hql);
			if(params!=null && !params.isEmpty()){
				for(String key:params.keySet()){
					query.setParameter(key, params.get(key));
				}
			}
			
			int firstResultNum=(pageNum-1)*pageSize;
			query.setFirstResult(firstResultNum);
			query.setMaxResults(pageSize);
			
			return (List<T>) query.list();
		} catch (HibernateException e) {
			logger.error("CRUDDaoImpl-->queryByPage Error:"+e.getMessage());
		}finally{
			session.clear();
			session.close();
		}
		
		return null;
	}
	
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
			logger.error("CRUDDaoImpl-->queryNaviSqlByPage Error:"+e.getMessage());
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
		Session session=null;
		try {
			session=sessionFactory.openSession();
			Transaction tr=session.beginTransaction();
			Query query=session.createSQLQuery(sql);
			query.executeUpdate();
			tr.commit();
		} catch (HibernateException e) {
			logger.error("CRUDDaoImpl-->executeSQL Error:"+e.getMessage());
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
	public synchronized void callprInitsalarydetail(Integer account_id){
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
			logger.error("CRUDDaoImpl-->callprInitsalarydetail Error:"+e.getMessage());
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
			logger.error("CRUDDaoImpl-->callprSetsalarydetail Error:"+e.getMessage());
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
			logger.error("CRUDDaoImpl-->callprSetsalarydetailByEmpCode Error:"+e.getMessage());
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
	 * 根据员工A6CODE来设置该员工的奖金明细
	 * @param account_id		奖金期间id
	 * @param emp_codea6		A6员工code
	 * @param salary_item_id	奖金项目id
	 * @param money				奖金金额
	 */
	@SuppressWarnings("deprecation")
	public void callprSetsalarydetailByEmpCodeA6(int account_id,String emp_codea6,int salary_item_id,BigDecimal money){
		Session session = sessionFactory.openSession();
		Connection conn=null;
		CallableStatement stmt=null;
		try {
			Transaction tr = session.beginTransaction();
			conn=session.connection();
			String procedure="{call prSetSalaryDetailByEmpCodeA6(?,?,?,?)}";
			stmt=conn.prepareCall(procedure);
			stmt.setInt(1, account_id);
			stmt.setString(2, emp_codea6);
			stmt.setInt(3, salary_item_id);
			stmt.setBigDecimal(4, money);
			stmt.execute();
			tr.commit();
		} catch (SQLException e) {
			logger.error("CRUDDaoImpl-->callprSetsalarydetailByEmpCodeA6 Error:"+e.getMessage());
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
	 * 根据实体类的名称和id，来返回实体的信息
	 * 
	 * @param id 			实体ID
	 * @param EntityName 	实体类的名称
	 * @return 				实体的信息
	 */
	public T getEntityById(int id, String EntityName) {
		String hql = "From " + EntityName + " where id=:id";
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		
		return this.get(hql, params);
	}

	/**
	 * 根据hql语句来返回所要查询的对象信息
	 * 
	 * @param hql 		hql语句
	 * @param params 	查询参数
	 * @return 			JSONObject的实体json列表数据
	 */
	@SuppressWarnings("rawtypes")
	public JSONObject getEntityJsonListBySql(String sql,Map<String, Object> params, Integer pageNum, Integer pageSize) {
		ArrayList list_t = (ArrayList) this.queryNaviSqlByPage(sql, params, pageNum, pageSize);
		Map<String, Object> map_json = new HashMap<String, Object>();
		int total = this.getRowCountBySql(sql, params);
		
		map_json.put("rows", list_t);
		map_json.put("total", total);//总体记录数
		JSONObject jsonobj = JSONObject.fromObject(map_json);

		return jsonobj;
	}

	/**
	 * 根据sql语句来获取总记录数
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public int getRowCountBySql(String sql, Map<String, Object> params) {
		StringBuffer sqlBuffer = new StringBuffer(1000);
		sqlBuffer.append("select count(1) as rowcount from ( ");
		sqlBuffer.append(sql);
		sqlBuffer.append(" ) as tb_temp");

		return NumberUtils.ObjectToInteger(
				this.queryNaviSql(sqlBuffer.toString(), params).get(0).get("rowcount"));
	}

	/**
	 * 根据hql语句来获取总记录数
	 * 
	 * @param hql
	 * @param params
	 * @return
	 */
	public int getRowCountByHql(String hql, Map<String, Object> params) {
		hql = "select count(*) " + hql;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			Query query = session.createQuery(hql);
			if (params != null && !params.isEmpty()) {
				for (String key : params.keySet()){
					query.setParameter(key, params.get(key));
				}
			}

			return NumberUtils.ObjectToInteger(query.uniqueResult());
		} catch (HibernateException e) {
			logger.error("CRUDDaoImpl-->getRowCountByHql Error:"+e.getMessage());
		}finally{
			if (session != null) {
				session.clear();
				session.close();
			}
		}

		return 0;
	}
}
