package com.salary.sync.crm;

import java.util.Calendar;
import java.util.List;
import java.util.Map;
import org.junit.Test;
import com.salary.dao.CRUDDaoImpl;
import com.salary.entity.Account;
import com.salary.util.DateUtils;

public class CRMDaoImpl extends CRUDDaoImpl<Account>{
	
	public CRMDaoImpl(){
		this.setSessionFactory(CRMUtil.getSessionFactory());
	}
	
	
	@Test
	public void test1(){
		CRMDaoImpl crmDaoimpl=new CRMDaoImpl();
		
		Calendar cal=Calendar.getInstance();
		cal.set(2014, 11, 1);
		
		Account account=new Account();
		account.setDaystart(cal.getTime());
		
		cal.set(2014, 11,31);
		account.setDayend(cal.getTime());
		List<Map<String,Object>> listgzl=crmDaoimpl.getGzl(account);
		
		for(Map<String,Object> gzl:listgzl){
			System.out.println(gzl.get("EMP_CODE")+"  :  "+gzl.get("MONEY"));
		}
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
	 * 工作量统计
	 * 根据奖金期间来查询该时间段
	 * @param account	奖金期间
	 * @return			List<Map<String,Object>> 工作量列表
	 */
	public List<Map<String,Object>> getGzl(Account account){
		StringBuffer sql_gzls=new StringBuffer(1500);
		String daystart=DateUtils.formatDate(account.getDaystart());
		String dayend=DateUtils.formatDate(account.getDayend());
		
		sql_gzls.append(" select emp.engineers_no as EMP_CODE,sum(t.gzl) as MONEY from( ");
		sql_gzls.append(" select sm_m.engineer_sign as fwry, ");
		sql_gzls.append(" sm_m.user_define02 as gzl ");
		sql_gzls.append(" from sm_maintain sm_m ");
		sql_gzls.append(" where sm_m.user_define01 is not null ");
		sql_gzls.append(" and to_char(sm_m.FINISH_DATE,'yyyy-mm-dd')>='"+daystart+"' ");
		sql_gzls.append(" and to_char(sm_m.FINISH_DATE,'yyyy-mm-dd')<='"+dayend+"' ");
		sql_gzls.append(" union all select pv_v.fee as fwry, ");
		sql_gzls.append(" pv_v.user_define02 as gzl ");
		sql_gzls.append(" from pv_visit_bill pv_v  ");
		sql_gzls.append(" where pv_v.user_define01 is not null ");
		sql_gzls.append(" and to_char(pv_v.VISIT_START_DATE,'yyyy-mm-dd')>='"+daystart+"' ");
		sql_gzls.append(" and to_char(pv_v.VISIT_START_DATE,'yyyy-mm-dd')<='"+dayend+"' ");
		sql_gzls.append(" ) t left join sys_employee emp on emp.employee_id=t.fwry ");
		sql_gzls.append(" where t.fwry in ");
		sql_gzls.append(" (select emp2.employee_id from sys_employee emp2 where emp2.engineers_no is not null) ");
		sql_gzls.append(" group by emp.engineers_no ");
		
		return this.queryNaviSql(sql_gzls.toString(), null);
	}
	
	
	/**
	 * 服务费收取户数统计
	 * @param account	奖金期间
	 * @return			List<Map<String,Object>> 工作量列表
	 */
	public List<Map<String,Object>> getFwfhs(Account account){
		StringBuffer sql_fwfhs=new StringBuffer(1500);
		String daystart=DateUtils.formatDate(account.getDaystart());
		String dayend=DateUtils.formatDate(account.getDayend());
		
		sql_fwfhs.append(" select se.engineers_no as EMP_CODE,count(1) as MONEY ");
		sql_fwfhs.append(" from chg_customer_charge_master cm ");
		sql_fwfhs.append(" left join sys_employee se ");
		sql_fwfhs.append(" on cm.charge_oper_id=se.employee_id ");
		sql_fwfhs.append(" where to_char(cm.charge_date,'yyyy-mm-dd')>='"+daystart+"'  ");
		sql_fwfhs.append(" and to_char(cm.charge_date,'yyyy-mm-dd')<='"+dayend+"' ");
		sql_fwfhs.append(" group by se.engineers_no ");
		
		return this.queryNaviSql(sql_fwfhs.toString(), null);
	}
	
	
	/**
	 * 返回CRM的所有员工信息
	 * @return
	 */
	public List<Map<String,Object>> getEmployeelist(){
		String sql="select NAME as EMP_NAME,ENGINEERS_NO as EMP_CODE from SYS_EMPLOYEE";
		return this.queryNaviSql(sql, null);
	}
}
