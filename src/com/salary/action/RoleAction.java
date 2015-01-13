package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.salary.entity.Account;
import com.salary.entity.Role;
import com.salary.entity.Salary_item;
import com.salary.service.RoleService;

/**
 * 角色处理action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class RoleAction extends ActionSupport {
	private RoleService roleService;
	private Role role;								//角色
	private Integer account_id;						//奖金期间id
	private Integer id;								//奖金期间id
	private Account account;						//账户期间
	private Integer emp_id;							//员工id
	private Salary_item salary_item;				//奖金项目
	private JSONObject jsonobj;						//json对象，传递给Easyui表格
	private Integer page;							//Easyui分页号
	private Integer rows;							//Easyui分页大小
	
	/**
	 * 初始化分页
	 */
	public void init(){
		page=(page==null || page==0)?new Integer(1):page;
		rows=(rows==null || rows==0)?new Integer(10):rows;
	}
	
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public RoleService getRoleService() {
		return roleService;
	}
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
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
	public JSONObject getJsonobj() {
		return jsonobj;
	}
	public void setJsonobj(JSONObject jsonobj) {
		this.jsonobj = jsonobj;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	
	
	/**
	 * 添加角色页面
	 * @return
	 */
	public String addRolePage(){
		return SUCCESS;
	}
	
	/**
	 * 修改角色页面
	 * @return
	 */
	public String editRolePage(){
		String hql="From Role where id="+id;
		role=roleService.get(hql, null);
		
		return SUCCESS;
	}
	
	/**
	 *  添加角色
	 * @return
	 */
	public String addRole(){
		roleService.add(role);
		
		return SUCCESS;
	}
	
	/**
	 * 删除角色
	 * @return
	 */
	public String delRole(){
		String hql="From Role where id="+id;
		role=roleService.get(hql, null);
		roleService.del(role);
		
		return SUCCESS;
	}
	
	/**
	 * 修改角色
	 * @return
	 */
	public String editRole(){
		roleService.edit(role);
		return SUCCESS;
	}
	
	/**
	 * 显示角色列表页面
	 * @return
	 */
	public String listRolePage(){
		return SUCCESS;
	}
	
	/**
	 * 获取角色列表json数据
	 * @return
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
