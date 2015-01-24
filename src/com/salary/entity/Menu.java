package com.salary.entity;

/**
 * 菜单表
 * @author 陈捷
 *
 */
public class Menu {
	private int id;				
	private int pid;			//上级菜单id
	private String name;		//菜单名称
	private String uri;			//访问地址
	private String iconcls;		//Easyui的iconCls属性
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUri() {
		return uri;
	}
	public void setUri(String uri) {
		this.uri = uri;
	}
	public String getIconcls() {
		return iconcls;
	}
	public void setIconcls(String iconcls) {
		this.iconcls = iconcls;
	}
}
