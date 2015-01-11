package com.salary.service;

import com.salary.dao.RoleDaoImpl;
import com.salary.entity.Role;

/**
 * 角色service
 * @author 陈捷
 *
 */
public class RoleService extends CRUDService<Role> {
	private RoleDaoImpl roleDaoimpl;

	public RoleDaoImpl getRoleDaoimpl() {
		return roleDaoimpl;
	}

	public void setRoleDaoimpl(RoleDaoImpl roleDaoimpl) {
		this.roleDaoimpl = roleDaoimpl;
	}
	
}
