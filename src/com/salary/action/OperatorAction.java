package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.salary.entity.Account;
import com.salary.entity.Author;
import com.salary.entity.Operator;
import com.salary.entity.Role;
import com.salary.entity.Role_author;
import com.salary.entity.Salary_item;
import com.salary.service.AuthorService;
import com.salary.service.OperatorService;
import com.salary.service.RoleService;
import com.salary.service.Role_authorService;
import com.salary.util.MD5Util;
import com.salary.util.SalaryUtils;

/**
 * 操作员处理action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class OperatorAction extends ActionSupport {
	private OperatorService operatorService;
	private RoleService roleService;
	private Role_authorService role_authorService;
	private AuthorService authorService;
	private Operator operator;						//操作员
	private Integer account_id;						//奖金期间id
	private Integer id;								//奖金期间id
	private Account account;						//账户期间
	private Integer emp_id;							//员工id
	private Salary_item salary_item;				//奖金项目
	private JSONObject jsonobj;						//json对象，传递给Easyui表格
	private Integer page;							//Easyui分页号
	private Integer rows;							//Easyui分页大小
	private List<Role> listrole;					//角色信息列表
	private Role role;								//角色信息
	
	
	/**
	 * 初始化分页
	 */
	public void init(){
		page=(page==null || page==0)?new Integer(1):page;
		rows=(rows==null || rows==0)?new Integer(10):rows;
	}
	
	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public Operator getOperator() {
		return operator;
	}

	public void setOperator(Operator operator) {
		this.operator = operator;
	}
	
	public AuthorService getAuthorService() {
		return authorService;
	}

	public void setAuthorService(AuthorService authorService) {
		this.authorService = authorService;
	}

	public OperatorService getOperatorService() {
		return operatorService;
	}
	public void setOperatorService(OperatorService operatorService) {
		this.operatorService = operatorService;
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
	
	public List<Role> getListrole() {
		return listrole;
	}

	public void setListrole(List<Role> listrole) {
		this.listrole = listrole;
	}
	
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	
	public Role_authorService getRole_authorService() {
		return role_authorService;
	}

	public void setRole_authorService(Role_authorService role_authorService) {
		this.role_authorService = role_authorService;
	}
	
	
	/**
	 * 添加操作员页面
	 * @return
	 */
	public String addOperatorPage(){
		String hql="From Role where isdel=0";
		listrole=roleService.query(hql, null);
		
		return SUCCESS;
	}
	
	/**
	 * 修改操作员页面
	 * @return
	 */
	public String editOperatorPage(){
		String hql_oper="From Operator where id="+id;
		operator=operatorService.get(hql_oper, null);
		
		String hql_role="From Role where isdel=0";
		listrole=roleService.query(hql_role, null);
		
		return SUCCESS;
	}
	
	/**
	 * 添加操作员
	 * @return
	 */
	public String addOperator(){
		//MD5加密
		operator.setPass(MD5Util.MD5(operator.getPass()));
		operatorService.add(operator);
		return SUCCESS;
	}
	
	/**
	 * 删除操作员
	 * @return
	 */
	public String delOperator(){
		String hql="From Operator where id="+id;
		operator=operatorService.get(hql, null);
		operatorService.del(operator);
		
		return SUCCESS;
	}
	
	/**
	 * 修改操作员
	 * @return
	 */
	public String editOperator(){
		//MD5加密
		operator.setPass(MD5Util.MD5(operator.getPass()));
		operatorService.edit(operator);
		
		return SUCCESS;
	}
	
	/**
	 * 显示操作员页面列表
	 * @return
	 */
	public String listOperatorPage(){
		return SUCCESS;
	}
	
	/**
	 * 获取操作员列表json数据
	 * @return
	 */
	public String getOperatorlist(){
		String hql="From Operator where isdel=0";
		List<Operator> listoperator=operatorService.queryByPage(hql, null, page, rows);
		Map<String,Object> jsonMap=new HashMap<String,Object>();
		
		jsonMap.put("rows", listoperator);
		jsonMap.put("total", operatorService.query(hql, null).size());
		
		jsonobj=new JSONObject();
		jsonobj=JSONObject.fromObject(jsonMap);
		
		return SUCCESS;
	}
	
	
	public String login(){
		String agent=ServletActionContext.getRequest().getHeader("user-agent");
		System.out.println("浏览器信息:"+agent);
		//不兼容的浏览器版本号
		String[] unsupports=SalaryUtils.unSupportBrowser;
		
		for(String unsupport:unsupports){
			if(agent.contains(unsupport)){
				ServletActionContext.getContext().getSession().put("errormsg", "浏览器版本太低，请升级!");
				return INPUT;
			}
		}
		
		if(operator!=null && operator.getName()!=null && operator.getPass()!=null){
			//MD5加密
			operator.setPass(MD5Util.MD5(operator.getPass()));
			String hql="From Operator where name=:name and pass=:pass";
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("name", operator.getName());
			params.put("pass", operator.getPass());
			
			List<Operator> listoperator=operatorService.query(hql, params);
			if(listoperator!=null && listoperator.size()>0){
				operator=listoperator.get(0);
				String hql_author="From Role_author where role_id="+operator.getRole_id();
				List<Role_author> listrole_author=role_authorService.query(hql_author, null);
				Map<String,Object> maprole_author=new HashMap<String,Object>();
				
				String hql_author_basic="From Author";
				List<Author> listauthor=authorService.query(hql_author_basic, null);
				Map<String,String> mapauthor=new HashMap<String,String>();
				
				//先将权限导入到mapauthor中待用
				for(Author author:listauthor){
					mapauthor.put(Integer.toString(author.getId()), author.getCode());
				}
				
				for(Role_author role_author:listrole_author){
					if(role_author.getIsallow()==1){
						maprole_author.put(
								mapauthor.get(Integer.toString(role_author.getAuthor_id())), 1);
					}
				}
				
				//session域操作员信息
				ActionContext.getContext().getSession().put("operatorinfo", operator);
				//session域权限信息
				ActionContext.getContext().getSession().put("maprole_author", maprole_author);
				
				return SUCCESS;
			}
		}
		
		//session域登录错误信息
		ServletActionContext.getContext().getSession().put("errormsg", "用户名或密码错误!");
		return INPUT;
	}
	
}
