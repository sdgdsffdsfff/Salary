package com.salary.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;
import com.salary.entity.Author;
import com.salary.entity.Menu;
import com.salary.entity.Role;
import com.salary.entity.Role_author;
import com.salary.entity.Role_menu;
import com.salary.service.MenuService;
import com.salary.service.RoleService;
import com.salary.service.Role_menuService;
import com.salary.util.AuthorJson;

@SuppressWarnings("serial")
public class RolemenuAction extends ActionSupport {
	private Logger logger=Logger.getLogger(RolemenuAction.class);
	
	private Role_menuService role_menuService;		//角色菜单服务
	private MenuService menuService;				//菜单表服务
	private RoleService roleService;				//角色服务
	private Integer id;								//主键
	private String errormessage;					//错误消息
	private Role role;								//角色信息
	private Role_menu role_menu;					//菜单权限表
	private String menuids;							//允许的菜单id列表
	private Integer roleid;							//角色id
	private Integer pid;							//上级id
	private List<Menu> listmenu;					//菜单列表
	
	
	public Role_menuService getRole_menuService() {
		return role_menuService;
	}
	public void setRole_menuService(Role_menuService role_menuService) {
		this.role_menuService = role_menuService;
	}
	public MenuService getMenuService() {
		return menuService;
	}
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	public RoleService getRoleService() {
		return roleService;
	}
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getErrormessage() {
		return errormessage;
	}
	public void setErrormessage(String errormessage) {
		this.errormessage = errormessage;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public Role_menu getRole_menu() {
		return role_menu;
	}
	public void setRole_menu(Role_menu role_menu) {
		this.role_menu = role_menu;
	}
	public Logger getLogger() {
		return logger;
	}
	public void setLogger(Logger logger) {
		this.logger = logger;
	}
	public String getMenuids() {
		return menuids;
	}
	public void setMenuids(String menuids) {
		this.menuids = menuids;
	}
	public Integer getRoleid() {
		return roleid;
	}
	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public List<Menu> getListmenu() {
		return listmenu;
	}
	public void setListmenu(List<Menu> listmenu) {
		this.listmenu = listmenu;
	}
	
	
	/**
	 * 显示添加菜单权限页面
	 * @return
	 */
	public String addRolemenuPage(){
		return SUCCESS;
	}
	
	/**
	 * 显示修改菜单权限页面
	 * @return
	 */
	public String editRolemenuPage(){
		try {
			String sql="update role_menu set isallow=0 where role_id="+role.getId();
			//如果是超级管理员，则直接将所有菜单权限更新为1
			if(role.getId()==1){
				sql="update role_menu set isallow=1 where role_id=1";
				role_menuService.executeSQL(sql);
				return SUCCESS;
			}
			
			role_menuService.executeSQL(sql);
			if(menuids!=null && !menuids.trim().isEmpty()){
				String sql2="update role_menu set isallow=1 where role_id="+role.getId()
						+" and menu_id in ("+menuids.substring(0,menuids.length()-1)+")";
				
				role_menuService.executeSQL(sql2);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
	
		return SUCCESS;
	}
	
	/**
	 * 添加菜单权限
	 * @return
	 */
	public String addRolemenu(){
		return SUCCESS;
	}
	
	/**
	 * 修改菜单权限
	 * @return
	 */
	public String editRolemenu(){
		return SUCCESS;
	}
	
	/**
	 * 删除菜单权限
	 * @return
	 */
	public String delRolemenu(){
		return SUCCESS;
	}
	
	/**
	 * 获取菜单权限列表
	 * @return
	 */
	public String getRolemenulist(){
		try {
			String sql="select menu.* from role_menu left join menu on " +
					"menu.id=role_menu.menu_id where isallow=1 " +
					"and role_id=:roleid and pid=:pid";
			
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("roleid", roleid);
			params.put("pid", pid);
			
			List<Map<String,Object>> listmapmenu=menuService.queryNaviSql(sql, params);
			
			if(listmapmenu!=null && !listmapmenu.isEmpty()){
				for(Map<String,Object> mapMenu:listmapmenu){

				}
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
}
