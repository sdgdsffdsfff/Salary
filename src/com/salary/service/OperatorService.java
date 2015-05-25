package com.salary.service;

import com.salary.dao.CRUDDao;
import com.salary.entity.Operator;

public interface OperatorService extends CRUDDao<Operator> {

	/**
	 * 测试添加数据库
	 * 
	 * @param dataBaseName 数据库名称
	 */
	public void addDataBase(String dataBaseName);

}
