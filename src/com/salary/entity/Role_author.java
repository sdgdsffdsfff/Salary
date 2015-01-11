package com.salary.entity;

/**
 * 角色权限表
 * @author 陈捷
 *
 */
public class Role_author {
	private int id;			//角色权限id
	private int role_id;	//角色id
	private int author_id;	//权限id
	private int isallow;	//是否允许,1允许,0不允许
	
	private Author author;	//权限信息
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public int getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(int author_id) {
		this.author_id = author_id;
	}
	public int getIsallow() {
		return isallow;
	}
	public void setIsallow(int isallow) {
		this.isallow = isallow;
	}
	public Author getAuthor() {
		return author;
	}
	public void setAuthor(Author author) {
		this.author = author;
	}
	
}
