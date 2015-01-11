package com.salary.entity;

/**
 * 操作员表
 * @author 陈捷
 *
 */
public class Operator {
	private int id;			//操作员id
	private String name;	//操作员姓名
	private String pass;	//操作员密码
	private int role_id;	//角色id
	private int isdel;		//是否删除,0未删除,1删除
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public int getIsdel() {
		return isdel;
	}
	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}
	
}
