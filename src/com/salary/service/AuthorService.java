package com.salary.service;

import com.salary.dao.AuthorDaoImpl;
import com.salary.entity.Author;

/**
 * 权限表service
 * @author 陈捷
 *
 */
public class AuthorService extends CRUDService<Author> {
	private AuthorDaoImpl authorDaoimpl;

	public AuthorDaoImpl getAuthorDaoimpl() {
		return authorDaoimpl;
	}

	public void setAuthorDaoimpl(AuthorDaoImpl authorDaoimpl) {
		this.authorDaoimpl = authorDaoimpl;
	}
	
	
}
