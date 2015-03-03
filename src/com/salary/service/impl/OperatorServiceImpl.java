package com.salary.service.impl;

import com.salary.dao.CRUDDaoImpl;
import com.salary.entity.Operator;
import com.salary.service.OperatorService;

/**
 * 操作员service
 * @author 陈捷
 *
 */
public class OperatorServiceImpl extends CRUDDaoImpl<Operator> implements OperatorService {

	@Override
	public void add(Operator t) {
		super.add(t);
	}

	@Override
	public void del(Operator t) {
		super.del(t);
	}

	@Override
	public void edit(Operator t) {
		super.edit(t);
	}
	
}
