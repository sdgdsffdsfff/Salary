package com.salary.sync.a6;

import java.util.List;
import java.util.Map;
import org.junit.Test;
import com.salary.dao.CRUDDaoImpl;
import com.salary.entity.Account;

public class A6DaoImpl extends CRUDDaoImpl<Account>{
	
	public A6DaoImpl(){
		this.setSessionFactory(A6Util.getSessionFactory());
	}
	
	
	@Test
	public void test1(){
		
	}
	
	/**
	 * 返回A6的所有员工信息
	 * @return
	 */
	public List<Map<String,Object>> getEmployeelist(){
		String sql="select cName as EMP_NAME,cCode as EMP_CODE from CM_EMPLOYEE";
		return this.queryNaviSql(sql, null);
	}
	
	
}
