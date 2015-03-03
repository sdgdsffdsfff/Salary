package com.salary.spring.aop;

import java.util.HashMap;
import java.util.Map;

import org.aspectj.lang.ProceedingJoinPoint;

import com.salary.entity.Account;
import com.salary.service.AccountService;
import com.salary.service.Salary_detailService;
import com.salary.service.impl.AccountServiceImpl;
import com.salary.service.impl.Salary_detailServiceImpl;
import com.salary.util.NumberUtils;

@SuppressWarnings("unused")
public class AopAccount {
	private AccountServiceImpl accountService;
	private Salary_detailServiceImpl salary_detailService;
	public AccountServiceImpl getAccountService() {
		return accountService;
	}
	public void setAccountService(AccountServiceImpl accountService) {
		this.accountService = accountService;
	}
	public Salary_detailServiceImpl getSalary_detailService() {
		return salary_detailService;
	}
	public void setSalary_detailService(Salary_detailServiceImpl salary_detailService) {
		this.salary_detailService = salary_detailService;
	}

	//添加奖金期间前的检测
	private void addCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		//先检测奖金期间表中是否有相同的奖金期间名称
		String sql="select 1 from account where name=:name";
		Map<String,Object> params=new HashMap<String,Object>();
		Account account=(Account) proceedingJoinPoint.getArgs()[0];
		params.put("name", account.getName());
		
		System.out.println("addCheck执行了奖金期间添加检测...");
		
		int acc_count=accountService.getRowCountBySql(sql, params);
		if(acc_count>0){
			throw new Throwable();
		}
		
		proceedingJoinPoint.proceed();
	}
	
	//修改奖金期间前的检测
	private void editCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		//先读取原奖金期间的名称，如果与现在的名称不一致，则需要检测是否有重名的奖金期间
		Account account = (Account) proceedingJoinPoint.getArgs()[0];
		Account tmpAccount=accountService.getEntityById(account.getId(), "Account");
		if(!tmpAccount.getName().equals(account.getName())){
			//先检测奖金期间表中是否有相同的奖金期间名称
			String sql="select 1 from account where name=:name";
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("name", account.getName());
			int acc_count=accountService.getRowCountBySql(sql, params);
			
			System.out.println("editCheck执行了奖金期间修改检测...");
			
			if(acc_count>0){
				throw new Throwable();
			}
			
			proceedingJoinPoint.proceed();
		}
	}
	
	//删除奖金期间检测
	private void delCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		//检测在奖金明细表中该奖金期间的金额合计是否为0(为0则视为没有任何数据)
		Account account=(Account) proceedingJoinPoint.getArgs()[0];
		String sql="select ifnull(sum(money),0) as money from salary_detail where account_id="+account.getId();
		float acc_money=0;
		acc_money=NumberUtils.BigDecimalToFloat(accountService.queryNaviSql(sql, null).get(0).get("money"));
		
		System.out.println("delCheck执行了奖金期间删除检测...");
		
		if(acc_money>0){
			throw new Throwable(); 
		}
		
		//删除奖金明细表数据
		String sql_del_salary_detail="delete from salary_detail where account_id="+account.getId();
		accountService.executeSQL(sql_del_salary_detail);
		proceedingJoinPoint.proceed();
	}
}
