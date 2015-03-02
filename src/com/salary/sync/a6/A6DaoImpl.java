package com.salary.sync.a6;

import java.util.List;
import java.util.Map;
import org.junit.Test;
import com.salary.dao.CRUDDaoImpl;
import com.salary.entity.Account;

/**
 * A6系统数据处理Dao
 * @author 陈捷
 *
 */
public class A6DaoImpl extends CRUDDaoImpl<Account>{
	
	@Test
	public void test1(){
		A6DaoImpl a6Daoimpl=new A6DaoImpl();
		List<Map<String,Object>> listemp=a6Daoimpl.getEmployeelist();
		for(Map<String,Object> mapEmployee:listemp){
			System.out.println(
					"EMP_NAME:"+mapEmployee.get("EMP_NAME")+
					"\t MONEY:"+mapEmployee.get("EMP_CODE"));
		}
	}
	
	/**
	 * 返回A6的所有员工信息
	 * @return	List<Map<String,Object>>返回A6的所有员工信息
	 */
	public List<Map<String,Object>> getEmployeelist(){
		String sql="select cName as EMP_NAME,cCode as EMP_CODE from CM_EMPLOYEE";
		return this.queryNaviSql(sql, null);
	}
	
	
}
