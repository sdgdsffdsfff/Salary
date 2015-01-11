	package com.salary.service;

import com.salary.dao.Salary_item_unitDaoImpl;
import com.salary.entity.Salary_item_unit;

/**
 * 奖金项目公式单元service
 * @author 陈捷
 *
 */
public class Salary_item_unitService extends CRUDService<Salary_item_unit> {
	private Salary_item_unitDaoImpl salary_item_unitDaoimpl;

	public Salary_item_unitDaoImpl getSalary_item_unitDaoimpl() {
		return salary_item_unitDaoimpl;
	}

	public void setSalary_item_unitDaoimpl(
			Salary_item_unitDaoImpl salary_item_unitDaoimpl) {
		this.salary_item_unitDaoimpl = salary_item_unitDaoimpl;
	}
	
}
