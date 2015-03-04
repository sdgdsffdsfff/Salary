package com.salary.sync.a6;

import java.util.List;
import java.util.Map;
import com.salary.dao.CRUDDaoHibernate3Impl;
import com.salary.entity.Author;

/**
 * A6系统数据处理Dao
 * @author 陈捷
 *
 */
public class A6ServiceImpl extends CRUDDaoHibernate3Impl<Author> implements A6Service{
	
	/**
	 * 返回A6的所有员工信息
	 * @return	List<Map<String,Object>>返回A6的所有员工信息
	 */
	public List<Map<String,Object>> getEmployeelist(){
		String sql="select cName as EMP_NAME,cCode as EMP_CODE from CM_EMPLOYEE";
		return this.queryNaviSql(sql, null);
	}
	
	
}
