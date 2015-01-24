package com.salary.entity;

/**
 * 菜单权限
 * @author 陈捷
 *
 */
public class Role_menu {
	
	private int id;
	private int role_id;	//角色id
	private int menu_id;	//菜单id
	private int isallow;	//是否允许,0不允许,1允许
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
	public int getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}
	public int getIsallow() {
		return isallow;
	}
	public void setIsallow(int isallow) {
		this.isallow = isallow;
	}
	
	
}
