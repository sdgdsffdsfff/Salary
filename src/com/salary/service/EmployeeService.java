package com.salary.service;

import com.salary.dao.CRUDDao;
import com.salary.entity.Employee;

public interface EmployeeService extends CRUDDao<Employee> {

	/**
	 * 同步奖金系统对应A6员工的的用户CODE
	 */
	public void editSyncEmployeeFromA6();

}
