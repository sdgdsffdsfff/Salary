package com.salary.service.impl;

import com.salary.dao.CRUDDaoHibernate3Impl;
import com.salary.entity.Department;
import com.salary.service.DepartmentService;

/**
 * 部门service
 * @author 陈捷
 *
 */
public class DepartmentServiceImpl extends CRUDDaoHibernate3Impl<Department> implements DepartmentService {

	@Override
	public void add(Department t) {
		super.add(t);
	}

	@Override
	public void del(Department t) {
		super.del(t);
	}

	@Override
	public void edit(Department t) {
		super.edit(t);
	}
	
}
