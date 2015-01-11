package com.salary.service;

import com.salary.dao.Role_authorDaoImpl;
import com.salary.entity.Role_author;

/**
 * 角色权限service
 * @author 陈捷
 *
 */
public class Role_authorService extends CRUDService<Role_author> {
	private Role_authorDaoImpl role_authorDaoimpl;

	public Role_authorDaoImpl getRole_authorDaoimpl() {
		return role_authorDaoimpl;
	}

	public void setRole_authorDaoimpl(Role_authorDaoImpl role_authorDaoimpl) {
		this.role_authorDaoimpl = role_authorDaoimpl;
	}
	
	public void executeSQL(String sql){
		role_authorDaoimpl.executeSQL(sql);
	}
	
}
