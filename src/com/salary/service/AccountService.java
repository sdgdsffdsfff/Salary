package com.salary.service;

import com.salary.dao.AccountDaoImpl;
import com.salary.entity.Account;

/**
 * 奖金期间service
 * @author 陈捷
 *
 */
public class AccountService extends CRUDService<Account> {
	private AccountDaoImpl accountDaoimpl;

	public AccountDaoImpl getAccountDaoimpl() {
		return accountDaoimpl;
	}

	public void setAccountDaoimpl(AccountDaoImpl accountDaoimpl) {
		this.accountDaoimpl = accountDaoimpl;
	}
	
}
