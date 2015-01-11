package com.salary.dao;


import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.salary.entity.Role_author;

/**
 * 角色权限Dao
 * @author 陈捷
 *
 */
public class Role_authorDaoImpl extends CRUDDaoImpl<Role_author> {
	
	/**
	 * 执行SQL语句
	 * @param sql
	 */
	public void executeSQL(String sql){
		try {
			Session session=sessionFactory.openSession();
			Transaction tr=session.beginTransaction();
			Query query=session.createSQLQuery(sql);
			query.executeUpdate();
			tr.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
	}
}
