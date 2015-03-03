package com.salary.spring.aop;

import java.util.HashMap;
import java.util.Map;

import org.aspectj.lang.ProceedingJoinPoint;

import com.salary.entity.Employee;
import com.salary.service.impl.EmployeeServiceImpl;
import com.salary.util.NumberUtils;

@SuppressWarnings("unused")
public class AopEmployee {
	private EmployeeServiceImpl employeeService;
	public EmployeeServiceImpl getEmployeeService() {
		return employeeService;
	}
	public void setEmployeeService(EmployeeServiceImpl employeeService) {
		this.employeeService = employeeService;
	}
	
	/**
	 * 添加职员检测
	 * @throws Throwable
	 */
	private void addCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		Employee employee=(Employee) proceedingJoinPoint.getArgs()[0];
		System.out.println("addCheck执行了员工检测...");
		//先检测员工表中是否有相同的code，如果有则抛出错误信息
		String sql="select 1 from employee where code=:code";
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("code", employee.getCode());
		int emp_count=employeeService.getRowCountBySql(sql, params);
		
		if(emp_count>0){
			throw new Throwable();
		}
		
		proceedingJoinPoint.proceed();
	}
	
	/**
	 * 添加职员检测
	 * @throws Throwable
	 */
	private void editCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		Employee employee=(Employee) proceedingJoinPoint.getArgs()[0];
		System.out.println("editCheck执行了员工检测...");
		//先检测原员工表中的code是否和现在一样，不一样则需要检测
		Employee tmpEmployee=employeeService.getEntityById(employee.getId(), "Employee");
		if(!tmpEmployee.getCode().equals(employee.getCode())){
			//先检测员工表中是否有相同的code，如果有则抛出错误信息
			String sql="select 1 from employee where code=:code";
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("code", employee.getCode());
			int emp_count=employeeService.getRowCountBySql(sql, params);
			
			if(emp_count>0){
				throw new Throwable();
			}
		}
		
		proceedingJoinPoint.proceed();
	}
	
	/**
	 * 添加职员检测
	 * @throws Throwable
	 */
	private void delCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		Employee employee=(Employee) proceedingJoinPoint.getArgs()[0];
		System.out.println("delCheck执行了员工删除检测...");
		//先检测该人员是否在奖金明细表中
		String sql="select 1 from salary_detail where emp_id="+employee.getId();
		int emp_count=employeeService.getRowCountBySql(sql, null);
		
		if(emp_count>0){
			throw new Throwable();
		}
		
		proceedingJoinPoint.proceed();
	}
	
	
	
	
}
