package com.salary.sync.crm;

import java.util.Calendar;
import java.util.List;
import java.util.Map;
import org.junit.Test;
import com.salary.dao.CRUDDaoImpl;
import com.salary.entity.Account;

public class CRMDaoImpl extends CRUDDaoImpl<Account>{
	
	public CRMDaoImpl(){
		this.setSessionFactory(CRMUtil.getSessionFactory());
	}
	
	
	@SuppressWarnings("unused")
	@Test
	public void test1(){
		CRMDaoImpl crmDaoimpl=new CRMDaoImpl();
		Calendar cal=Calendar.getInstance();
		cal.set(2014, 11, 1);
		Account account=new Account();
		account.setDaystart(cal.getTime());
		cal.set(2014, 11,31);
		account.setDayend(cal.getTime());
		
	}
	
	@Test
	public void test2(){
		//测试返回CRM的员工信息
		CRMDaoImpl crmDaoimpl=new CRMDaoImpl();
		
		List<Map<String,Object>> crmemployeelist=crmDaoimpl.getEmployeelist();
		for(Map<String,Object> mapEmployee:crmemployeelist){
			System.out.println(mapEmployee.get("EMP_CODE")+"  :  "+mapEmployee.get("EMP_NAME"));
		}
	}
	
	
	/**
	 * 返回CRM的所有员工信息
	 * @return		List<Map<String,Object>> EMP_NAME,ENGINEERS_NO,EMP_CODE
	 */
	public List<Map<String,Object>> getEmployeelist(){
		String sql="select NAME as EMP_NAME,ENGINEERS_NO as EMP_CODE from SYS_EMPLOYEE";
		return this.queryNaviSql(sql, null);
	}
}
