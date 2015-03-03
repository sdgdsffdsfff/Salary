package com.salary.spring.aop;

import java.util.HashMap;
import java.util.Map;

import org.aspectj.lang.ProceedingJoinPoint;
import com.salary.entity.Salary_item;
import com.salary.service.Salary_itemService;
import com.salary.service.impl.Salary_itemServiceImpl;

@SuppressWarnings("unused")
public class AopSalaryitem {
	private Salary_itemServiceImpl salary_itemService;
	public Salary_itemServiceImpl getSalary_itemService() {
		return salary_itemService;
	}
	public void setSalary_itemService(Salary_itemServiceImpl salary_itemService) {
		this.salary_itemService = salary_itemService;
	}


	/**
	 * 添加奖金项目检测
	 * @throws Throwable
	 */
	private void addCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		Salary_item salary_item=(Salary_item) proceedingJoinPoint.getArgs()[0];
		System.out.println("addCheck执行了奖金项目检测...");
		//先检测奖金项目名称是否有重复
		String sql="select 1 from salary_item where name=:name";
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("name", salary_item.getName());
		int sal_count=salary_itemService.getRowCountBySql(sql, params);
		
		if(sal_count>0){
			throw new Throwable();
		}
		
		proceedingJoinPoint.proceed();
	}
	
	
	/**
	 * 添加奖金项目检测
	 * @throws Throwable
	 */
	private void editCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		Salary_item salary_item=(Salary_item) proceedingJoinPoint.getArgs()[0];
		System.out.println("editCheck执行了奖金项目检测...");
		//先读取原奖金项目的名称，查看是否和现在一致，如果不一致，则需要检测在奖金项目表中是否有重名
		Salary_item tmpSalary_item=salary_itemService.getEntityById(salary_item.getId(), "Salary_item");
		
		if(!tmpSalary_item.getName().equals(salary_item.getName())){
			//先检测奖金项目名称是否有重复
			String sql="select 1 from salary_item where name=:name";
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("name", salary_item.getName());
			int sal_count=salary_itemService.getRowCountBySql(sql, params);
			
			if(sal_count>0){
				throw new Throwable();
			}
		}
		
		proceedingJoinPoint.proceed();
	}
	
	
	/**
	 * 添加奖金项目检测
	 * @throws Throwable
	 */
	private void delCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		Salary_item salary_item=(Salary_item) proceedingJoinPoint.getArgs()[0];
		System.out.println("delCheck执行了奖金项目检测...");
		//删除奖金项目之前，需要检测奖金项目公式是否有引用此奖金项目id
		//统计出包含奖金项目id的数量
		String sql="select 1 from salary_item_expression ";
		sql+=" where 0<INSTR(dynmaicsql,':account_id,:emp_id,"+salary_item.getId()+"')";
		int sal_count=salary_itemService.getRowCountBySql(sql, null);
		
		if(sal_count>0){
			throw new Throwable();
		}
		
		sql="select 1 from salary_item_expression where salary_item_id="+salary_item.getId();
		sal_count=salary_itemService.getRowCountBySql(sql, null);
		
		if(sal_count>0){
			throw new Throwable();
		}
		
		sql="select 1 from salary_detail where salary_item_id="+salary_item.getId();
		sal_count=salary_itemService.getRowCountBySql(sql, null);
		
		if(sal_count>0){
			throw new Throwable();
		}
		
		proceedingJoinPoint.proceed();
	}
	
	
	
}
