package com.salary.service;

import com.salary.dao.EmployeeDaoImpl;
import com.salary.entity.Employee;

/**
 * 职员service
 * @author 陈捷
 *
 */
public class EmployeeService extends CRUDService<Employee> {
	private EmployeeDaoImpl employeeDaoimpl;

	public EmployeeDaoImpl getEmployeeDaoimpl() {
		return employeeDaoimpl;
	}

	public void setEmployeeDaoimpl(EmployeeDaoImpl employeeDaoimpl) {
		this.employeeDaoimpl = employeeDaoimpl;
	}
	
}
