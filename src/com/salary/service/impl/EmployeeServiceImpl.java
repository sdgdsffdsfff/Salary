package com.salary.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.salary.dao.CRUDDaoHibernate3Impl;
import com.salary.entity.Employee;
import com.salary.service.EmployeeService;
import com.salary.sync.a6.A6Service;

/**
 * 职员service
 * @author 陈捷
 *
 */
public class EmployeeServiceImpl extends CRUDDaoHibernate3Impl<Employee> implements EmployeeService {
	private A6Service a6Service;
	public A6Service getA6Service() {
		return a6Service;
	}
	public void setA6Service(A6Service a6Service) {
		this.a6Service = a6Service;
	}

	/**
	 * 同步奖金系统对应A6员工的的用户CODE
	 */
	public void editSyncEmployeeFromA6(){
		//读取出A6的用户信息列表
		List<Map<String,Object>> a6Employeelist=a6Service.getEmployeelist();
		
		//读取出奖金系统的员工信息列表
		String hql="From Employee";
		List<Employee> salaryEmployeelist=this.query(hql, null);
		
		if(a6Employeelist!=null && !a6Employeelist.isEmpty()){
			Map<String,String> a6Employeemap=new HashMap<String,String>();
			for(Map<String,Object> a6tmpMap:a6Employeelist){
				if(a6tmpMap.get("EMP_NAME")!=null){
					a6Employeemap.put(
							a6tmpMap.get("EMP_NAME").toString(), 
							a6tmpMap.get("EMP_CODE").toString());
				}
			}
			
			//遍历奖金系统的员工表，找到对应的员工信息则将A6的员工编号同步
			for(Employee employee:salaryEmployeelist){
				if(a6Employeemap.containsKey(employee.getName())){
					employee.setA6code(a6Employeemap.get(employee.getName()));
					this.edit(employee);
				}
			}
			
		}
		
	}
	
	
	
	@Override
	public void add(Employee t) {
		super.add(t);
	}
	@Override
	public void del(Employee t) {
		super.del(t);
	}
	@Override
	public void edit(Employee t) {
		super.edit(t);
	}
	
	
}
