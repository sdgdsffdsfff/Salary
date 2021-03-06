package com.salary.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.salary.action.base.BaseAction;
import com.salary.entity.Author;
import com.salary.entity.Employee;
import com.salary.entity.Menu;
import com.salary.entity.Operator;
import com.salary.entity.Role;
import com.salary.entity.Role_author;
import com.salary.service.AuthorService;
import com.salary.service.EmployeeService;
import com.salary.service.OperatorService;
import com.salary.service.Role_authorService;
import com.salary.service.Role_menuService;
import com.salary.util.MD5Util;
import com.salary.util.SalaryUtils;

/**
 * 操作员处理action
 * 
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class OperatorAction extends BaseAction {
	private OperatorService operatorService;
	private Role_authorService role_authorService;
	private AuthorService authorService;
	private Role_menuService role_menuService;
	private EmployeeService employeeService;
	private Operator operator; // 操作员
	private Integer id; // 奖金期间id
	private Role role; // 角色信息
	private String dataBaseName;// 数据库名称

	public String getDataBaseName() {
		return dataBaseName;
	}

	public void setDataBaseName(String dataBaseName) {
		this.dataBaseName = dataBaseName;
	}

	public OperatorService getOperatorService() {
		return operatorService;
	}

	public void setOperatorService(OperatorService operatorService) {
		this.operatorService = operatorService;
	}

	public Role_authorService getRole_authorService() {
		return role_authorService;
	}

	public void setRole_authorService(Role_authorService role_authorService) {
		this.role_authorService = role_authorService;
	}

	public AuthorService getAuthorService() {
		return authorService;
	}

	public void setAuthorService(AuthorService authorService) {
		this.authorService = authorService;
	}

	public Role_menuService getRole_menuService() {
		return role_menuService;
	}

	public void setRole_menuService(Role_menuService role_menuService) {
		this.role_menuService = role_menuService;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public Operator getOperator() {
		return operator;
	}

	public void setOperator(Operator operator) {
		this.operator = operator;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	/**
	 * 添加操作员页面
	 * 
	 * @return ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addOperatorPage() {
		return SUCCESS;
	}

	/**
	 * 修改操作员页面
	 * 
	 * @return ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editOperatorPage() {
		try {
			operator = operatorService.getEntityById(id, "Operator");
		} catch (Exception e) {
			return ERROR;
		}

		return SUCCESS;
	}

	/**
	 * 添加操作员
	 * 
	 * @return ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addOperator() {
		try {
			// MD5加密
			operator.setPass(MD5Util.MD5(operator.getPass()));
			operatorService.add(operator);
		} catch (Exception e) {
			errormessage = "添加操作员失败，已有相同名称的操作员信息...";
			return ERROR;
		}

		return SUCCESS;
	}

	/**
	 * 删除操作员
	 * 
	 * @return ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String delOperator() {
		try {
			operator = operatorService.getEntityById(id, "Operator");
			operatorService.del(operator);
		} catch (Exception e) {
			errormessage = "超级管理员不允许删除...";
			return ERROR;
		}

		return SUCCESS;
	}

	/**
	 * 修改操作员
	 * 
	 * @return ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editOperator() {
		try {
			// 如果是admin管理员，则不允许修改其角色。恢复默认为1管理员
			if (operator.getId() == 1) {
				operator.setRole_id(1);
				operator.setName("admin");
			}

			// MD5加密
			operator.setPass(MD5Util.MD5(operator.getPass()));
			operatorService.edit(operator);
		} catch (Exception e) {
			errormessage = "修改操作员失败，已有相同名称的操作员信息...";
			return ERROR;
		}

		return SUCCESS;
	}

	/**
	 * 显示操作员页面列表
	 * 
	 * @return ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String listOperatorPage() {
		return SUCCESS;
	}

	/**
	 * 获取操作员列表json数据
	 * 
	 * @return ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String getOperatorlist() {
		String sql = "select ope.id,ope.name,rol.name as role_id From operator ope left join role rol on ope.role_id=rol.id where ope.isdel=0";

		try {
			List<Map<String, Object>> listoperator = operatorService.queryNaviSqlByPage(sql, null, page, rows);
			Map<String, Object> jsonMap = new HashMap<String, Object>();

			jsonMap.put("rows", listoperator);
			jsonMap.put("total", operatorService.queryNaviSql(sql, null).size());

			jsonobj = new JSONObject();
			jsonobj = JSONObject.fromObject(jsonMap);
		} catch (Exception e) {
			errormessage = "读取操作员列表失败...";
			return ERROR;
		}

		return SUCCESS;
	}

	/**
	 * 用户登录检测
	 * 
	 * @return ACTION执行正常返回SUCCESS,浏览器版本不兼容、用户名密码不匹配则返回errormsg
	 */
	public String login() {
		String agent = ServletActionContext.getRequest().getHeader("user-agent");
		System.out.println("浏览器信息:" + agent);
		// 不兼容的浏览器版本号
		String[] unsupports = SalaryUtils.unSupportBrowser;
		jsonobj = new JSONObject();
		Map<String, String> resultMap = new HashMap<String, String>();

		for (String unsupport : unsupports) {
			if (agent.contains(unsupport)) {
				resultMap.put("status", "0");
				resultMap.put("errormsg", "浏览器版本太低,请升级...");

				jsonobj = JSONObject.fromObject(resultMap);
				return SUCCESS;
			}
		}

		// 先在操作员表中读取信息，如果找到该操作员，则返回success
		if (operator != null && operator.getName() != null && operator.getPass() != null) {
			// MD5加密
			operator.setPass(MD5Util.MD5(operator.getPass()));
			String hql = "From Operator where name=:name and pass=:pass";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("name", operator.getName());
			params.put("pass", operator.getPass());

			List<Operator> listoperator = operatorService.query(hql, params);
			if (listoperator != null && listoperator.size() > 0) {
				operator = listoperator.get(0);
				String hql_author = "From Role_author where role_id=" + operator.getRole_id();
				List<Role_author> listrole_author = role_authorService.query(hql_author, null);
				Map<String, Object> maprole_author = new HashMap<String, Object>();

				String hql_author_basic = "From Author";
				List<Author> listauthor = authorService.query(hql_author_basic, null);
				Map<String, String> mapauthor = new HashMap<String, String>();

				// 先将权限导入到mapauthor中待用
				for (Author author : listauthor) {
					mapauthor.put(Integer.toString(author.getId()), author.getCode());
				}

				for (Role_author role_author : listrole_author) {
					if (role_author.getIsallow() == 1) {
						maprole_author.put(mapauthor.get(Integer.toString(role_author.getAuthor_id())), 1);
					}
				}

				// session域操作员信息
				ActionContext.getContext().getSession().put("operatorinfo", operator);
				// session域权限信息
				ActionContext.getContext().getSession().put("maprole_author", maprole_author);

				/**
				 * 读取用户信息，如果不是超级管理员的权限，则需要关联用户信息，根据人员的等级来区分是否可查看全部人员的奖金信息，
				 * 部门人员的奖金信息，个人的奖金信息
				 */
				if (operator.getRole_id() > 1) {
					Map<String, Object> params_emp = new HashMap<String, Object>();
					params_emp.put("code", operator.getName());
					String hql_emp = "From Employee where code=:code";
					Employee employee = employeeService.get(hql_emp, params_emp);
					// session域人员信息
					ActionContext.getContext().getSession().put("employeeinfo", employee);
					System.out.println("login-->employee:" + employee.getName());
				}

				String menu_list = this.getMenulist(operator);
				ActionContext.getContext().getSession().put("menu_list", menu_list);

				resultMap.put("status", "1");
				resultMap.put("errormsg", "");

				jsonobj = JSONObject.fromObject(resultMap);
				return SUCCESS;
			}
		}

		// 用户名或密码错误
		resultMap.put("status", "0");
		resultMap.put("errormsg", "用户名或密码错误...");

		jsonobj = JSONObject.fromObject(resultMap);
		return SUCCESS;
	}

	/**
	 * 用来初始化操作员admin的密码为admin 注意:需要在请求信息加入id=96096才会执行初始化
	 * 用于忘记密码的情况，可以直接将超级管理员的密码恢复
	 * 
	 * @return ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String initOperator() {
		try {
			if (id != null && id == 96096) {
				operator = new Operator();
				operator.setId(1);
				operator.setName("admin");
				operator.setPass(MD5Util.MD5("admin"));
				operator.setIsdel(0);
				operator.setRole_id(1);

				operatorService.edit(operator);
			}
		} catch (Exception e) {
			e.printStackTrace();
			errormessage = e.getMessage();
			return ERROR;
		}

		return SUCCESS;
	}

	/**
	 * 获取菜单列表,用于显示左侧的菜单项
	 * 
	 * @param op 操作员信息
	 * @return Menulist
	 */
	public String getMenulist(Operator op) {
		StringBuffer menuBuffer = new StringBuffer(2000);

		List<Menu> listmenu_main = new ArrayList<Menu>();
		listmenu_main = role_menuService.getMenulistForMenu(op.getRole_id(), 1);
		for (Menu menu_main : listmenu_main) {
			menuBuffer.append("<div title=\"" + menu_main.getName() + "\" data-options=\"iconCls:'" + menu_main.getIconcls() + "'\"><ul>");
			List<Menu> listmenu_slave = role_menuService.getMenulistForMenu(op.getRole_id(), menu_main.getId());
			for (Menu menu_slave : listmenu_slave) {
				menuBuffer.append("<li><a class=\"easyui-linkbutton\" href=\"" + menu_slave.getUri() + "\" data-options=\"plain:true,width:100\" >" + menu_slave.getName() + "</a></li>");
			}

			menuBuffer.append("</ul></div>");
		}

		return menuBuffer.toString();
	}

	/**
	 * 修改自己的密码
	 * 
	 * @return ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editPassword() {
		try {
			Operator tmpOperator = (Operator) ActionContext.getContext().getSession().get("operatorinfo");
			tmpOperator.setPass(MD5Util.MD5(operator.getPass()));
			operatorService.edit(tmpOperator);
		} catch (Exception e) {
			e.printStackTrace();
			errormessage = "操作员密码修改失败,请检查是否登录...";
			return ERROR;
		}

		return SUCCESS;
	}

	/**
	 * 显示修改密码页面
	 * 
	 * @return ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editPasswordPage() {
		try {
			operator = (Operator) ActionContext.getContext().getSession().get("operatorinfo");
		} catch (Exception e) {
			e.printStackTrace();
			errormessage = "操作员密码修改失败,请检查是否登录...";
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 测试添加数据库
	 * 
	 * @return
	 */
	public String testAddDataBase() {
		operatorService.addDataBase(dataBaseName);
		return SUCCESS;
	}
}
