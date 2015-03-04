package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.salary.action.base.BaseAction;
import com.salary.entity.Role;
import com.salary.service.RoleService;

/**
 * 角色处理action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class RoleAction extends BaseAction {
	private RoleService roleService;
	private Role role;								//角色
	private Integer id;								//奖金期间id
	
	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * 添加角色页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addRolePage(){
		return SUCCESS;
	}
	
	/**
	 * 修改角色页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editRolePage(){
		try {
			role=roleService.getEntityById(id, "Role");
		} catch (Exception e) {
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 *  添加角色
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addRole(){
		try {
			roleService.add(role);
			
			//要在角色权限表中批量添加该角色的角色权限信息
			String sql_ins_role_author="insert into role_author(role_id,author_id,isallow) select "+role.getId()+",id,0 from author";
			roleService.executeSQL(sql_ins_role_author);
		} catch (Exception e) {
			errormessage="添加角色信息失败，已有相同的角色名称...";
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 删除角色
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String delRole(){
		try {
			role=roleService.getEntityById(id, "Role");
			roleService.del(role);
		} catch (Exception e) {
			errormessage="删除角色信息失败，该角色已经在使用中...";
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 修改角色
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editRole(){
		try {
			roleService.edit(role);
		} catch (Exception e) {
			errormessage="修改角色信息失败，已有相同的角色名称...";
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 显示角色列表页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String listRolePage(){
		return SUCCESS;
	}
	
	/**
	 * 获取角色列表json数据
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String getRolelist(){
		this.init();
		String hql="From Role where isdel=0";
		try {
			List<Role> listrole=roleService.queryByPage(hql, null, page, rows);
			Map<String,Object> jsonMap=new HashMap<String,Object>();
			jsonMap.put("rows", listrole);
			jsonMap.put("total", roleService.getRowCountByHql(hql, null));
			
			jsonobj=new JSONObject();
			jsonobj=JSONObject.fromObject(jsonMap);
		} catch (Exception e) {
			errormessage="获取角色信息列表失败...";
			e.printStackTrace();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	
}
