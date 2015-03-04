package com.salary.service.impl;

import com.salary.dao.CRUDDaoHibernate3Impl;
import com.salary.entity.Salary_item_expression;
import com.salary.service.Salary_item_expressionService;

/**
 * 奖金项目公式service
 * @author 陈捷
 *
 */
public class Salary_item_expressionServiceImpl extends CRUDDaoHibernate3Impl<Salary_item_expression> implements Salary_item_expressionService {

	@Override
	public void add(Salary_item_expression t) {
		super.add(t);
	}

	@Override
	public void del(Salary_item_expression t) {
		super.del(t);
	}

	@Override
	public void edit(Salary_item_expression t) {
		super.edit(t);
	}
	
}
