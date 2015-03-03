package com.salary.spring.aop;

import java.util.HashMap;
import java.util.Map;

import org.aspectj.lang.ProceedingJoinPoint;

import com.salary.entity.Department;
import com.salary.service.DepartmentService;
import com.salary.service.impl.DepartmentServiceImpl;
import com.salary.util.NumberUtils;

@SuppressWarnings("unused")
public class AopDepartment {
	private DepartmentServiceImpl departmentService;
	public DepartmentServiceImpl getDepartmentService() {
		return departmentService;
	}
	public void setDepartmentService(DepartmentServiceImpl departmentService) {
		this.departmentService = departmentService;
	}

	/**
	 * 部门信息添加检测
	 * @param proceedingJoinPoint
	 * @throws Throwable 
	 */
	private void addCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		//先检测在表中是否有重名的部门信息
		String sql="select 1 from department where name=:name";
		Map<String,Object> params=new HashMap<String,Object>();
		
		Department department=(Department) proceedingJoinPoint.getArgs()[0];
		params.put("name", department.getName());
		int dept_count=departmentService.getRowCountBySql(sql, params);
		
		System.out.println("addCheck执行了部门信息添加检测...");
		
		if(dept_count>0){
			throw new Throwable();
		}
		
		proceedingJoinPoint.proceed();
	}
	
	/**
	 * 部门信息修改检测
	 * @param proceedingJoinPoint
	 * @throws Throwable 
	 */
	private void editCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		//先检测原部门名称和现在的部门名称是否相同，如果相同，则需要检测是否有同名的部门
		Department department=(Department) proceedingJoinPoint.getArgs()[0];
		Department tmpDepartment=departmentService.getEntityById(department.getId(),"Department");
		
		System.out.println("editCheck执行了部门信息修改检测...");
		
		if(!tmpDepartment.getName().equals(department.getName())){
			//先检测在表中是否有重名的部门信息
			String sql="select 1 from department where name=:name";
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("name", department.getName());
			int dept_count=departmentService.getRowCountBySql(sql, params);
			
			if(dept_count>0){
				throw new Throwable();
			}
		}
		
		proceedingJoinPoint.proceed();
	}
	
	/**
	 * 部门信息删除检测
	 * @param proceedingJoinPoint
	 */
	private void delCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		//先检测该部门是否有人员在引用
		Department department=(Department) proceedingJoinPoint.getArgs()[0];
		String sql="select 1 from employee where department_id="+department.getId();
		int dept_count=departmentService.getRowCountBySql(sql, null);
		
		System.out.println("delCheck执行了部门信息删除检测...");
		
		if(dept_count>0){
			throw new Throwable();
		}
		
		proceedingJoinPoint.proceed();
	}
}
