package com.salary.service;

import com.salary.dao.Salary_item_expressionDaoImpl;
import com.salary.entity.Salary_item_expression;

/**
 * 奖金项目公式service
 * @author 陈捷
 *
 */
public class Salary_item_expressionService extends CRUDService<Salary_item_expression> {
	private Salary_item_expressionDaoImpl salary_item_expressionDaoimpl;

	public Salary_item_expressionDaoImpl getSalary_item_expressionDaoimpl() {
		return salary_item_expressionDaoimpl;
	}

	public void setSalary_item_expressionDaoimpl(
			Salary_item_expressionDaoImpl salary_item_expressionDaoimpl) {
		this.salary_item_expressionDaoimpl = salary_item_expressionDaoimpl;
	}
	
}
