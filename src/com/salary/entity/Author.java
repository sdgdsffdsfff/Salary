package com.salary.entity;

/**
 * 权限表
 * @author 陈捷
 *
 */
public class Author {
	private int id;			//权限id
	private int pid;		//上级权限id
	private String name;	//权限名称
	private String code;	//权限action名称
	
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	
}
