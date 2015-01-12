package com.salary.service;

import java.math.BigDecimal;

import com.salary.dao.EmployeeDaoImpl;
import com.salary.dao.Salary_detailDaoImpl;
import com.salary.entity.Salary_detail;

/**
 * 奖金明细service
 * @author 陈捷
 *
 */
public class Salary_detailService extends CRUDService<Salary_detail> {
	private Salary_detailDaoImpl salary_detailDaoimpl;
	private EmployeeDaoImpl employeeDaoimpl;

	public Salary_detailDaoImpl getSalary_detailDaoimpl() {
		return salary_detailDaoimpl;
	}

	public void setSalary_detailDaoimpl(Salary_detailDaoImpl salary_detailDaoimpl) {
		this.salary_detailDaoimpl = salary_detailDaoimpl;
	}
	
	public EmployeeDaoImpl getEmployeeDaoimpl() {
		return employeeDaoimpl;
	}

	public void setEmployeeDaoimpl(EmployeeDaoImpl employeeDaoimpl) {
		this.employeeDaoimpl = employeeDaoimpl;
	}

	/**
	 * 设置奖金明细金额
	 * @param account_id		奖金期间
	 * @param emp_id			员工id
	 * @param salary_item_id	奖金项目id
	 * @param money				金额
	 */
	public void setSalaryDetail(int account_id, int emp_id, int salary_item_id, BigDecimal money){
		salary_detailDaoimpl.callprSetsalarydetail(account_id, emp_id, salary_item_id, money);
	}
	
	/**
	 * 初始化奖金明细，读取接口来设置得到的金额
	 * 
	 * @param account_id 		奖金期间id
	 */
	public void initSalaryDetail(int account_id){
		//注意:由于需要调用公司内部数据，因此以下代码是手工写死的
		
	}
}
