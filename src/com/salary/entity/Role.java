package com.salary.entity;

/**
 * 角色表
 * @author 陈捷
 *
 */
public class Role {
	private int id;			//角色id
	private String name;	//角色名称
	private int isdel;		//是否删除,1删除,0未删除
	
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
	public int getIsdel() {
		return isdel;
	}
	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}
}
