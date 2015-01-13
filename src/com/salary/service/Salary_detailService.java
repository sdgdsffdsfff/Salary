package com.salary.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.salary.dao.AccountDaoImpl;
import com.salary.dao.EmployeeDaoImpl;
import com.salary.dao.Salary_detailDaoImpl;
import com.salary.entity.Account;
import com.salary.entity.Employee;
import com.salary.entity.Salary_detail;
import com.salary.test.testCallable;

/**
 * 奖金明细service
 * @author 陈捷
 *
 */
public class Salary_detailService extends CRUDService<Salary_detail> {
	private Salary_detailDaoImpl salary_detailDaoimpl;
	private EmployeeDaoImpl employeeDaoimpl;
	private AccountDaoImpl accountDaoimpl;

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
	
	public AccountDaoImpl getAccountDaoimpl() {
		return accountDaoimpl;
	}

	public void setAccountDaoimpl(AccountDaoImpl accountDaoimpl) {
		this.accountDaoimpl = accountDaoimpl;
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
	public void initSalaryDetail(Account account){
		//注意:由于需要调用公司内部数据，因此以下代码是手工写死的
		
		
		//首先初始化本期间奖金信息
		salary_detailDaoimpl.callprInitsalarydetail(account.getId());
		
		//先读取出人员信息
		String hql_emp="From Employee where isdel=0";
		List<Employee> listemployee=employeeDaoimpl.query(hql_emp, null);
		//读取出账套的时间
		Date daystart=account.getDaystart();
		Date dayend=account.getDayend();
		
		
		if(listemployee!=null && !listemployee.isEmpty()){
			int listemployeesize=listemployee.size();
			int i=0;
			
			//设置分值
			for(i=0;i<listemployeesize;i++){
				Employee employee=listemployee.get(i);
				salary_detailDaoimpl.callprSetsalarydetail(
						account.getId(), 
						employee.getId(),
						2,
						BigDecimal.valueOf(Math.ceil(testCallable.randMoney(employee.getCode(),daystart,dayend)*10)));
			}
			
			
			//设置工作量
			for(i=0;i<listemployeesize;i++){
				Employee employee=listemployee.get(i);
				salary_detailDaoimpl.callprSetsalarydetail(
						account.getId(), 
						employee.getId(),
						4, 
						BigDecimal.valueOf(Math.ceil(testCallable.randMoney(employee.getCode(),daystart,dayend)*100)));
			}
			
			//设置服务费收费
			for(i=0;i<listemployeesize;i++){
				Employee employee=listemployee.get(i);
				salary_detailDaoimpl.callprSetsalarydetail(
						account.getId(), 
						employee.getId(),
						6, 
						BigDecimal.valueOf(Math.ceil(testCallable.randMoney(employee.getCode(),daystart,dayend)*1000)));
			}
			
			//设置二次销售
			for(i=0;i<listemployeesize;i++){
				Employee employee=listemployee.get(i);
				salary_detailDaoimpl.callprSetsalarydetail(
						account.getId(), 
						employee.getId(),
						8, 
						BigDecimal.valueOf(Math.ceil(testCallable.randMoney(employee.getCode(),daystart,dayend)*1000)));
			}
			
		}
		
	}
}
