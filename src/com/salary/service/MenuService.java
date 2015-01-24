package com.salary.service;

import com.salary.dao.MenuDaoImpl;
import com.salary.entity.Menu;

/**
 * 菜单service
 * @author 陈捷
 *
 */
public class MenuService extends CRUDService<Menu> {
	private MenuDaoImpl menuDaoimpl;

	public MenuDaoImpl getMenuDaoimpl() {
		return menuDaoimpl;
	}

	public void setMenuDaoimpl(MenuDaoImpl menuDaoimpl) {
		this.menuDaoimpl = menuDaoimpl;
	}
	
}
