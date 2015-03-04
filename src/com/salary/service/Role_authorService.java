package com.salary.service;

import com.salary.dao.CRUDDao;
import com.salary.entity.Role_author;

public interface Role_authorService extends CRUDDao<Role_author> {

	/**
	 * 初始化角色权限
	 * 检测权限表中是否有新增加的权限，有的话就自动添加到角色权限表中
	 */
	public void initRoleauthor();
	
	
}
