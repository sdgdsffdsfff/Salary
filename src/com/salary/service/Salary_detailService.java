package com.salary.service;

import java.util.List;
import java.util.Map;

import com.salary.dao.CRUDDao;
import com.salary.entity.Account;
import com.salary.entity.Employee;
import com.salary.entity.Salary_detail;

public interface Salary_detailService extends CRUDDao<Salary_detail> {
	/**
	 * 初始化奖金明细，读取接口来设置得到的金额
	 * 
	 * @param account 		奖金期间
	 */
	public void initSalaryDetail(Account account);
	
	
	/**
	 * 获取动态的奖金项目明细表sql语句
	 * @param account_id	奖金期间id
	 * @return				奖金项目明细表sql语句
	 */
	public String GetfnGetsalarysql(int account_id,Employee employee);
	
	
	
	/**
	 * 根据CRM数据库查询出来的信息来写入到账期数据中  
	 * @param salary_detail			需要传入account_id,salary_item_id
	 * @param listSalarydetail		List<Map<EMP_CODE:员工编号,MONEY:金额>>
	 */
	public void setSalarydetailFromCRMMap(Salary_detail salary_detail,List<Map<String,Object>> listSalarydetail);
	
	
	/**
	 * 根据A6数据库查询出来的信息来写入到账期数据中
	 * @param salary_detail			需要传入account_id,salary_item_id
	 * @param listSalarydetail		List<Map<EMP_CODE:员工编号,MONEY:金额>>
	 */
	public void setSalarydetailFromA6Map(Salary_detail salary_detail,List<Map<String,Object>> listSalarydetail);
	
	
	
	
}
