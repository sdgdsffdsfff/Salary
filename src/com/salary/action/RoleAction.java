package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import net.sf.json.JSONObject;
import com.salary.entity.Account;
import com.salary.entity.Role;
import com.salary.entity.Salary_item;
import com.salary.service.RoleService;
import com.salary.util.NumberUtils;

/**
 * 角色处理action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class RoleAction extends CRUDAction {
	private Logger logger=Logger.getLogger(RoleAction.class);
	
	private RoleService roleService;
	private Role role;								//角色
	private Integer account_id;						//奖金期间id
	private Integer id;								//奖金期间id
	private Account account;						//账户期间
	private Integer emp_id;							//员工id
	private Salary_item salary_item;				//奖金项目
	
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

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

	public Integer getAccount_id() {
		return account_id;
	}

	public void setAccount_id(Integer account_id) {
		this.account_id = account_id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Integer getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}

	public Salary_item getSalary_item() {
		return salary_item;
	}

	public void setSalary_item(Salary_item salary_item) {
		this.salary_item = salary_item;
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
	 *  添加角色
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addRole(){
		try {
			//先检测是否存在相同名称的角色
			String sql="select count(1) as money from role where name=:name";
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("name", role.getName());
			Integer rol_count=NumberUtils.BigIntegerToInteger(roleService.queryNaviSql(sql, params).get(0).get("money"));
			
			if(rol_count>0){
				errormessage="添加角色信息失败，已有相同的角色名称...";
				return ERROR;
			}
			
			roleService.add(role);
			
			//要在角色权限表中批量添加该角色的角色权限信息
			sql="insert into role_author(role_id,author_id,isallow) select "+role.getId()+",id,0 from author";
			roleService.executeSQL(sql);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
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
			//先检测在操作员表中是否有引用该角色
			String sql="select count(1) as money from Operator where role_id="+id;
			Integer rol_count=0;
			rol_count=NumberUtils.BigIntegerToInteger(roleService.queryNaviSql(sql, null).get(0).get("money"));
			
			if(rol_count>0){
				errormessage="删除角色信息失败，该角色已经在使用中...";
				return ERROR;
			}
			
			//删除角色前先删除角色权限表下与此角色关联的信息
			String sql_del_role_author="delete from role_author where role_id="+id;
			String sql_del_role_menu="delete from role_menu where role_id="+id;
			roleService.executeSQL(sql_del_role_author);
			roleService.executeSQL(sql_del_role_menu);
			
			String hql="From Role where id="+id;
			role=roleService.get(hql, null);
			roleService.del(role);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
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
			//先检测角色名称和原来的是否一样，如果不一样，则要检测角色名称在表中是否重复
			String hql="From Role where id="+role.getId();
			Role tmpRole=roleService.get(hql, null);
			
			if(!tmpRole.getName().equals(role.getName())){
				//先检测是否存在相同名称的角色
				String sql="select count(1) as money from role where name=:name";
				Map<String,Object> params=new HashMap<String,Object>();
				params.put("name", role.getName());
				Integer rol_count=NumberUtils.BigIntegerToInteger(roleService.queryNaviSql(sql, params).get(0).get("money"));
				
				if(rol_count>0){
					errormessage="修改角色信息失败，已有相同的角色名称...";
					return ERROR;
				}
			}
			
			roleService.edit(role);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
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
		List<Role> listrole=roleService.queryByPage(hql, null, page, rows);
		
		Map<String,Object> jsonMap=new HashMap<String,Object>();
		jsonMap.put("rows", listrole);
		jsonMap.put("total", roleService.query(hql, null).size());
		
		jsonobj=new JSONObject();
		jsonobj=JSONObject.fromObject(jsonMap);
		
		return SUCCESS;
	}
	
	
	
}
