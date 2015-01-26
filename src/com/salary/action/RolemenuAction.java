package com.salary.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import com.opensymphony.xwork2.ActionSupport;
import com.salary.entity.Menu;
import com.salary.entity.Role;
import com.salary.entity.Role_menu;
import com.salary.service.MenuService;
import com.salary.service.RoleService;
import com.salary.service.Role_menuService;
import com.salary.util.MenuJson;

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
	private JSONObject jsonobj;						//json对象，传递给Easyui表格
	
	
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
	public JSONObject getJsonobj() {
		return jsonobj;
	}
	public void setJsonobj(JSONObject jsonobj) {
		this.jsonobj = jsonobj;
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
			String hql="From Role_menu where id="+id;
			role_menu=role_menuService.get(hql, null);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 显示角色菜单权限列表页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String listRolemenuPage(){
		try {
			String hql="From Role where id="+id;
			role=roleService.get(hql, null);
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
			//检测菜单权限表中是否有新增加的权限，有的话就自动添加到角色菜单权限表中
			role_menuService.initRolemenu();
			
			String hql="From Role_menu where role_id="+id;
			List<Role_menu> listrole_menu=role_menuService.query(hql, null);
			List<MenuJson> list_jsonmenu=new ArrayList<MenuJson>();
			
			hql="From Menu";
			List<Menu> list_menu=menuService.query(hql, null);
			Map<String,Menu> menuMap=new HashMap<String,Menu>();
			
			for(Menu menu:list_menu){
				menuMap.put(Integer.toString(menu.getId()), menu);
			}
			
			for(Role_menu role_menu:listrole_menu){
				Menu menu=new Menu();
				MenuJson menujson=new MenuJson();
				menu=menuMap.get(Integer.toString(role_menu.getMenu_id()));
				menujson.setId(menu.getId());
				menujson.setText(menu.getName());
				menujson.setChecked(false);
				
				//除了根目录展开外，tree子目录全部关闭
				if(menu.getId()>1){
					menujson.setPid(menu.getPid());
					menujson.setState("closed");
				}
				
				//如果取到isallow的值为1，则tree勾选框选中
				if(role_menu.getIsallow()==1){
					menujson.setChecked(true);
				}
				
				list_jsonmenu.add(menujson);
			}
			
			Map<String,Object> jsonMap=new HashMap<String,Object>();
			jsonMap.put("data", list_jsonmenu);
			jsonobj=new JSONObject();
			jsonobj=JSONObject.fromObject(jsonMap);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
}
