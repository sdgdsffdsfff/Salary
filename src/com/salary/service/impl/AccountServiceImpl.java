package com.salary.service.impl;

import com.salary.dao.CRUDDaoHibernate3Impl;
import com.salary.entity.Account;
import com.salary.service.AccountService;

/**
 * 奖金期间service
 * @author 陈捷
 *
 */
public class AccountServiceImpl extends CRUDDaoHibernate3Impl<Account> implements AccountService {

	@Override
	public void add(Account t) {
		super.add(t);
	}

	@Override
	public void del(Account t) {
		super.del(t);
	}

	@Override
	public void edit(Account t) {
		super.edit(t);
	}
	
}
