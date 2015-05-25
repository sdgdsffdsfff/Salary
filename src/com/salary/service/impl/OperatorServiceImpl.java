package com.salary.service.impl;

import com.salary.dao.CRUDDaoHibernate3Impl;
import com.salary.entity.Operator;
import com.salary.service.OperatorService;

/**
 * 操作员service
 * @author 陈捷
 *
 */
public class OperatorServiceImpl extends CRUDDaoHibernate3Impl<Operator> implements OperatorService {

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

	@Override
	public void addDataBase(String dataBaseName) {
		String sql_add="Create Database "+dataBaseName+" character set utf8";
		this.executeSQL(sql_add);
	}
	
}
