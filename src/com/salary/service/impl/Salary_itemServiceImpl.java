package com.salary.service.impl;

import com.salary.dao.CRUDDaoImpl;
import com.salary.entity.Salary_item;
import com.salary.service.Salary_itemService;

/**
 * 奖金项目service
 * @author 陈捷
 *
 */
public class Salary_itemServiceImpl extends CRUDDaoImpl<Salary_item> implements Salary_itemService {

	@Override
	public void add(Salary_item t) {
		super.add(t);
	}

	@Override
	public void del(Salary_item t) {
		super.del(t);
	}

	@Override
	public void edit(Salary_item t) {
		super.edit(t);
	}
	
}
