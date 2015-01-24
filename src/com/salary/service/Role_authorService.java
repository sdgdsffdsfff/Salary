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
	
	/**
	 * 初始化角色权限
	 * 检测权限表中是否有新增加的权限，有的话就自动添加到角色权限表中
	 */
	public void initRoleauthor(){
		StringBuffer sqlBuffer=new StringBuffer(200);
		sqlBuffer.append("insert into role_author(role_id,author_id,isallow) ");
		sqlBuffer.append(" select role_id,author_id,isallow from( ");
		sqlBuffer.append(" select role.id AS role_id,author.id AS author_id,0 AS isallow ");
		sqlBuffer.append(" from role,author where role.id not in ");
		sqlBuffer.append(" (select role_id from role_author) ");
		sqlBuffer.append(" union ");
		sqlBuffer.append(" select role.id AS role_id,author.id AS author_id,0 AS isallow ");
		sqlBuffer.append(" from role,author where author.id not in ");
		sqlBuffer.append(" (select distinct author_id from role_author)) t ");
		sqlBuffer.append(" order by role_id,author_id ");
		this.executeSQL(sqlBuffer.toString());
	}
}
