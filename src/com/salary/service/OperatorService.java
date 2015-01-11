package com.salary.service;

import com.salary.dao.OperatorDaoImpl;
import com.salary.entity.Operator;

/**
 * 操作员service
 * @author 陈捷
 *
 */
public class OperatorService extends CRUDService<Operator> {
	private OperatorDaoImpl operatorDaoimpl;

	public OperatorDaoImpl getOperatorDaoimpl() {
		return operatorDaoimpl;
	}

	public void setOperatorDaoimpl(OperatorDaoImpl operatorDaoimpl) {
		this.operatorDaoimpl = operatorDaoimpl;
	}
	
	
}
