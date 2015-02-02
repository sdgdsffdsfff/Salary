package com.salary.sync.crm;

import java.util.List;
import java.util.Map;
import com.salary.dao.CRUDDaoImpl;
import com.salary.entity.Account;

/**
 * CRM数据处理Dao
 * @author 陈捷
 *
 */
public class CRMDaoImpl extends CRUDDaoImpl<Account>{
	private static CRMDaoImpl crmDaoimpl;
	
	private CRMDaoImpl(){
		this.setSessionFactory(CRMUtil.getSessionFactory());
	}
	
	//单例模式
	public static CRMDaoImpl getInstance(){
		if(crmDaoimpl==null){
			crmDaoimpl=new CRMDaoImpl();
		}
		return crmDaoimpl;
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
