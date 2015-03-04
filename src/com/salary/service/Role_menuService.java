package com.salary.service;

import java.util.List;

import com.salary.dao.CRUDDao;
import com.salary.entity.Menu;
import com.salary.entity.Role_menu;

public interface Role_menuService extends CRUDDao<Role_menu> {
	/**
	 * 初始化角色菜单权限
	 * 检测菜单权限表中是否有新增加的权限，有的话就自动添加到角色菜单权限表中
	 */
	public void initRolemenu();
	
	
	/**
	 * 根据角色id和pid来获取菜单列表
	 * @param roleid		角色id
	 * @param pid			上级菜单id
	 * @return				List<Menu>
	 */
	public List<Menu> getMenulist(int roleid,int pid);
	
	
	/**
	 * 根据角色id和pid来获取菜单列表
	 * @param roleid		角色id
	 * @param pid			上级菜单id
	 * @return				List<Menu>
	 */
	public List<Menu> getMenulistForMenu(int roleid,int pid);
	
	
	
}
