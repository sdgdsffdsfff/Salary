package com.salary.service.impl;

import com.salary.dao.CRUDDaoImpl;
import com.salary.entity.Role;
import com.salary.service.RoleService;

/**
 * 角色service
 * @author 陈捷
 *
 */
public class RoleServiceImpl extends CRUDDaoImpl<Role> implements RoleService {

	@Override
	public void add(Role t) {
		super.add(t);
	}

	@Override
	public void del(Role t) {
		super.del(t);
	}

	@Override
	public void edit(Role t) {
		super.edit(t);
	}
	
}
