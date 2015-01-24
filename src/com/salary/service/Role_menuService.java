package com.salary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.salary.dao.Role_menuDaoImpl;
import com.salary.entity.Menu;
import com.salary.entity.Role_menu;

/**
 * 角色菜单权限service
 * @author 陈捷
 *
 */
public class Role_menuService extends CRUDService<Role_menu> {
	private Role_menuDaoImpl role_menuDaoimpl;

	public Role_menuDaoImpl getRole_menuDaoimpl() {
		return role_menuDaoimpl;
	}

	public void setRole_menuDaoimpl(Role_menuDaoImpl role_menuDaoimpl) {
		this.role_menuDaoimpl = role_menuDaoimpl;
	}
	
	/**
	 * 初始化角色菜单权限
	 * 检测菜单权限表中是否有新增加的权限，有的话就自动添加到角色菜单权限表中
	 */
	public void initRolemenu(){
		StringBuffer sqlBuffer=new StringBuffer(200);
		sqlBuffer.append(" insert into role_menu(role_id,menu_id,isallow) ");
		sqlBuffer.append(" select role.id as roleid,menu.id as menuid,0 from role,menu ");
		sqlBuffer.append(" where menu.id not in (select distinct menu_id from role_menu) ");
		sqlBuffer.append(" or role.id not in (select distinct role_id from role_menu) ");
		sqlBuffer.append(" order by roleid,menuid ");
		this.executeSQL(sqlBuffer.toString());
	}
	
	public List<Menu> getMenulist(int roleid,int pid){
		//循环读取菜单信息
		String sql="select menu.* from role_menu left join menu on " +
				"menu.id=role_menu.menu_id where isallow=1 " +
				"and role_id=:roleid and pid=:pid";
		
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("roleid", roleid);
		params.put("pid", pid);
		
		List<Map<String,Object>> listmapmenu=role_menuDaoimpl.queryNaviSql(sql, params);
		
		if(listmapmenu!=null && !listmapmenu.isEmpty()){
			for(Map<String,Object> mapMenu:listmapmenu){
				Menu menu=new Menu();
				menu.setId(Integer.parseInt(mapMenu.get("id").toString()));
				menu.setName(mapMenu.get("name").toString());
				menu.setPid(Integer.parseInt(mapMenu.get("pid").toString()));
				menu.setUri(mapMenu.get("uri").toString());
				menu.setIconcls(mapMenu.get("iconcls").toString());
				
				
				adf
			}
		}
	}
}
