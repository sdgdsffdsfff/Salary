package com.salary.service;

import com.salary.dao.DepartmentDaoImpl;
import com.salary.entity.Department;

/**
 * 部门service
 * @author 陈捷
 *
 */
public class DepartmentService extends CRUDService<Department> {
	private DepartmentDaoImpl departmentDaoimpl;

	public DepartmentDaoImpl getDepartmentDaoimpl() {
		return departmentDaoimpl;
	}

	public void setDepartmentDaoimpl(DepartmentDaoImpl departmentDaoimpl) {
		this.departmentDaoimpl = departmentDaoimpl;
	}
	
}
