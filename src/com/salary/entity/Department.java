package com.salary.entity;

/**
 * 部门表
 * @author 陈捷
 *
 */
public class Department {
	private int id;
	private String name;	//部门名称
	private int isdel;		//是否删除,0为未删除，1为删除
	
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
