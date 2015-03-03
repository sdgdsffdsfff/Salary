package com.salary.spring.aop;

import java.util.HashMap;
import java.util.Map;

import org.aspectj.lang.ProceedingJoinPoint;

import com.salary.entity.Salary_item_unit;
import com.salary.service.impl.Salary_item_unitServiceImpl;

@SuppressWarnings("unused")
public class AopSalaryitemunit {
	private Salary_item_unitServiceImpl salary_item_unitService;
	public Salary_item_unitServiceImpl getSalary_item_unitService() {
		return salary_item_unitService;
	}
	public void setSalary_item_unitService(
			Salary_item_unitServiceImpl salary_item_unitService) {
		this.salary_item_unitService = salary_item_unitService;
	}

	/**
	 * 添加奖金公式单元检测
	 * @throws Throwable
	 */
	private void addCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		Salary_item_unit salary_item_unit=(Salary_item_unit) proceedingJoinPoint.getArgs()[0];
		System.out.println("addCheck执行了奖金公式单元检测...");
		//先检测奖金项目公式模板是否有同名的
		String sql="select 1 from salary_item_unit where name=:name";
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("name", salary_item_unit.getName());
		int sal_count=salary_item_unitService.getRowCountBySql(sql, params);
		
		if(sal_count>0){
			throw new Throwable();
		}
		
		proceedingJoinPoint.proceed();
	}
	
	
	/**
	 * 添加奖金公式单元检测
	 * @throws Throwable
	 */
	private void editCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		Salary_item_unit salary_item_unit=(Salary_item_unit) proceedingJoinPoint.getArgs()[0];
		System.out.println("editCheck执行了奖金公式单元检测...");
		//先检测是否和原来的名称相同，不相同则要检测是否有同名
		Salary_item_unit tmpSal=salary_item_unitService.getEntityById(salary_item_unit.getId(), "Salary_item_unit");
		if(!tmpSal.getName().equals(salary_item_unit.getName())){
			//先检测奖金项目公式模板是否有同名的
			String sql="select count(1) as money from salary_item_unit where name=:name";
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("name", salary_item_unit.getName());
			int sal_count=salary_item_unitService.getRowCountBySql(sql, params);
			
			if(sal_count>0){
				throw new Throwable();
			}
		}
		
		proceedingJoinPoint.proceed();
	}
	
	
	/**
	 * 添加奖金公式单元检测
	 * @throws Throwable
	 */
	private void delCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		Salary_item_unit salary_item_unit=(Salary_item_unit) proceedingJoinPoint.getArgs()[0];
		System.out.println("delCheck执行了奖金公式单元检测...");
		//检测奖金公式单元模板是否有员工引用
		String sql="select 1 from employee where salary_item_unit_id="+salary_item_unit.getId();
		int sal_count=salary_item_unitService.getRowCountBySql(sql, null);
		
		if(sal_count>0){
			throw new Throwable();
		}
		
		proceedingJoinPoint.proceed();
	}
	
	
	
}
