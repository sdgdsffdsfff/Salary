package com.salary.service;

import com.salary.dao.Salary_itemDaoImpl;
import com.salary.entity.Salary_item;

/**
 * 奖金项目service
 * @author 陈捷
 *
 */
public class Salary_itemService extends CRUDService<Salary_item> {
	private Salary_itemDaoImpl salary_itemDaoimpl;

	public Salary_itemDaoImpl getSalary_itemDaoimpl() {
		return salary_itemDaoimpl;
	}

	public void setSalary_itemDaoimpl(Salary_itemDaoImpl salary_itemDaoimpl) {
		this.salary_itemDaoimpl = salary_itemDaoimpl;
	}
	
}
