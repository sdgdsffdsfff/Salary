package com.salary.sync.crm;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.salary.dao.CRUDDaoImpl;
import com.salary.entity.Account;
import com.salary.util.DateUtils;
import com.salary.util.NumberUtils;

public class CRMDaoImpl extends CRUDDaoImpl<Account>{
	
	public CRMDaoImpl(){
		super.sessionFactory=CRMUtil.getSessionFactory();
	}
	
	
	@Test
	public void test1(){
		
	}
	
	/**
	 * 工作量查询
	 * 根据奖金期间来查询该时间段
	 * @param account	奖金期间
	 * @return			List<Map<String,Object>> 工作量列表
	 */
	public List<Map<String,Object>> getGzl(Account account){
		StringBuffer sql_gzls=new StringBuffer(1500);
		
		sql_gzls.append(" select emp.engineers_no as EMP_CODE,sum(t.gzl) as MONEY from( ");
		sql_gzls.append(" select sm_m.engineer_sign as fwry, ");
		sql_gzls.append(" sm_m.user_define02 as gzl ");
		sql_gzls.append(" from sm_maintain sm_m ");
		sql_gzls.append(" where sm_m.user_define01 is not null ");
		sql_gzls.append(" and sm_m.FINISH_DATE>=:daystart ");
		sql_gzls.append(" and sm_m.FINISH_DATE<=:dayend ");
		sql_gzls.append(" union select pv_v.fee as fwry, ");
		sql_gzls.append(" pv_v.user_define02 as gzl ");
		sql_gzls.append(" from pv_visit_bill pv_v  ");
		sql_gzls.append(" where pv_v.user_define01 is not null ");
		sql_gzls.append(" and pv_v.VISIT_START_DATE>=:daystart ");
		sql_gzls.append(" and pv_v.VISIT_START_DATE<=:dayend ");
		sql_gzls.append(" ) t left join sys_employee emp on emp.employee_id=t.fwry ");
		sql_gzls.append(" where t.fwry in ");
		sql_gzls.append(" (select emp2.employee_id from sys_employee emp2 where emp2.engineers_no is not null) ");
		sql_gzls.append(" group by emp.engineers_no ");
		
		System.out.println("com.salary.sync.crm.CRMDaoImpl-->getGzl:"+sql_gzls);
		CRMDaoImpl crm=new CRMDaoImpl();
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("daystart", DateUtils.formatDate(account.getDaystart()));
		params.put("dayend", DateUtils.formatDate(account.getDayend()));
		
		return crm.queryNaviSql(sql_gzls.toString(), params);
	}
	
}
