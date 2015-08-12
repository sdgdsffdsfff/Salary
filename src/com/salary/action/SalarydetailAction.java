package com.salary.action;

import java.io.InputStream;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.salary.action.base.BaseAction;
import com.salary.entity.Account;
import com.salary.entity.Department;
import com.salary.entity.Employee;
import com.salary.entity.Salary_detail;
import com.salary.entity.Salary_item;
import com.salary.entity.Salary_item_expression;
import com.salary.entity.Salary_item_unit;
import com.salary.service.AccountService;
import com.salary.service.DepartmentService;
import com.salary.service.EmployeeService;
import com.salary.service.Salary_detailService;
import com.salary.service.Salary_itemService;
import com.salary.service.Salary_item_expressionService;
import com.salary.service.Salary_item_unitService;
import com.salary.util.ExcelUtils;
import com.salary.util.JsonUtils;
import com.salary.util.NumberUtils;
import com.salary.util.SalaryUtils;

/**
 * 工资明细action
 * 
 * @author 陈捷
 * 
 */
@SuppressWarnings("serial")
public class SalarydetailAction extends BaseAction {
	private Salary_detailService salary_detailService;
	private Salary_itemService salary_itemService;
	private AccountService accountService;
	private EmployeeService employeeService;
	private Salary_item_unitService salary_item_unitService;
	private Salary_item_expressionService salary_item_expressionService;
	private DepartmentService departmentService;
	private Integer account_id; // 奖金期间id
	private Integer id; // 奖金期间id
	private Integer emp_id; // 员工id
	private Salary_item salary_item; // 奖金项目
	private String dynmaiccolumn; // Easyui动态的数据列
	private Account account; // 奖金期间
	private String json_str; // 获取Easyui表格修改后保存的json数据
	private List<Salary_item> listsalary_item; // 奖金项目列表
	private List<Department> listdepartment; // 部门列表
	private Salary_detail salary_detail; // 奖金明细项目
	private Integer salary_item_id; // 奖金项目id
	private Integer departmentid; // 部门id
	private float money; // 金额
	private InputStream inputStream; // Excel输入流

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public Salary_detailService getSalary_detailService() {
		return salary_detailService;
	}

	public void setSalary_detailService(Salary_detailService salary_detailService) {
		this.salary_detailService = salary_detailService;
	}

	public Salary_itemService getSalary_itemService() {
		return salary_itemService;
	}

	public void setSalary_itemService(Salary_itemService salary_itemService) {
		this.salary_itemService = salary_itemService;
	}

	public AccountService getAccountService() {
		return accountService;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public Salary_item_unitService getSalary_item_unitService() {
		return salary_item_unitService;
	}

	public void setSalary_item_unitService(Salary_item_unitService salary_item_unitService) {
		this.salary_item_unitService = salary_item_unitService;
	}

	public Salary_item_expressionService getSalary_item_expressionService() {
		return salary_item_expressionService;
	}

	public void setSalary_item_expressionService(Salary_item_expressionService salary_item_expressionService) {
		this.salary_item_expressionService = salary_item_expressionService;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
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

	public String getDynmaiccolumn() {
		return dynmaiccolumn;
	}

	public void setDynmaiccolumn(String dynmaiccolumn) {
		this.dynmaiccolumn = dynmaiccolumn;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public String getJson_str() {
		return json_str;
	}

	public void setJson_str(String json_str) {
		this.json_str = json_str;
	}

	public List<Salary_item> getListsalary_item() {
		return listsalary_item;
	}

	public void setListsalary_item(List<Salary_item> listsalary_item) {
		this.listsalary_item = listsalary_item;
	}

	public List<Department> getListdepartment() {
		return listdepartment;
	}

	public void setListdepartment(List<Department> listdepartment) {
		this.listdepartment = listdepartment;
	}

	public Salary_detail getSalary_detail() {
		return salary_detail;
	}

	public void setSalary_detail(Salary_detail salary_detail) {
		this.salary_detail = salary_detail;
	}

	public Integer getSalary_item_id() {
		return salary_item_id;
	}

	public void setSalary_item_id(Integer salary_item_id) {
		this.salary_item_id = salary_item_id;
	}

	public Integer getDepartmentid() {
		return departmentid;
	}

	public void setDepartmentid(Integer departmentid) {
		this.departmentid = departmentid;
	}

	public float getMoney() {
		return money;
	}

	public void setMoney(float money) {
		this.money = money;
	}

	/**
	 * 初始化奖金项目明细页面数据
	 */
	public void initlistSalarydetailPage() {
		try {
			account = accountService.getEntityById(account_id, "Account");
			// 到quick_sql表中查找相应的sql语句，status为0 则可以使用
			String sql = "select dynmaicsql,status from quick_sql where name='initlistSalarydetailPage'";
			List<Map<String, Object>> listquick_sql = salary_detailService.queryNaviSql(sql, null);
			if (listquick_sql != null && listquick_sql.size() > 0) {
				// 如果状态为0，则可以直接读取出来
				if (listquick_sql.get(0).get("status").toString().equals("0")) {
					System.out.println("initlistSalarydetailPage 调用了快速sql...");
					dynmaiccolumn = listquick_sql.get(0).get("dynmaicsql").toString().replaceAll("\"", "\'");
					return;
				}
			}

			String hql = "From Salary_item where isdel=:isdel and isshow=:isshow";
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("isdel", 0);
			params.put("isshow", 1);

			List<Salary_item> listsalaryitem = salary_itemService.query(hql, params);

			StringBuffer dynmaicBuffer = new StringBuffer(5000);
			dynmaicBuffer.append("[[");

			if (listsalaryitem != null) {
				for (Salary_item salaryitem : listsalaryitem) {
					if (salaryitem.getIsedit() == 1) {
						dynmaicBuffer.append("{field:\'" + salaryitem.getName() + "\',title:\'" + salaryitem.getName() + "\',editor:{type:\'numberbox\',options:{precision:1}}},");
					} else {
						dynmaicBuffer.append("{field:\'" + salaryitem.getName() + "\',title:\'" + salaryitem.getName() + "\',},");
					}
				}
			}

			dynmaicBuffer.append("]]");
			dynmaiccolumn = dynmaicBuffer.toString();
			String dynmaicsql = dynmaiccolumn.replaceAll("'", "\"");
			System.out.println("Salarydetail dynmaicsql:" + dynmaicsql);
			String update_quick_sql = "update quick_sql set status=0,dynmaicsql='" + dynmaicsql + "' where name='initlistSalarydetailPage'";
			salary_itemService.executeSQL(update_quick_sql);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 显示奖金明细页
	 * 
	 * @return ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String listSalarydetailPage() {
		initlistSalarydetailPage();

		return SUCCESS;
	}

	/**
	 * 获取奖金明细json数据
	 * 
	 * @return ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String getSalarydetaillist() {
		try {
			// 先初始化本期奖金明细表
			salary_detailService.callprInitsalarydetail(account_id);

			Employee employee = (Employee) ActionContext.getContext().getSession().get("employeeinfo");
			// 返回动态sql语句
			String sql = salary_detailService.GetfnGetsalarysql(account_id, employee);
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("account_id", account_id);
			List<Map<String, Object>> listsalarydetail = salary_detailService.queryNaviSql(sql, params);

			Map<String, Object> jsonMap = new HashMap<String, Object>();

			jsonMap.put("rows", listsalarydetail);
			jsonMap.put("total", listsalarydetail.size());
			jsonobj = JSONObject.fromObject(jsonMap);

			// 读取需要合计的奖金项目
			String hql_salary_item_issum = "From Salary_item where issum=1";
			List<Salary_item> listsalary_item = salary_itemService.query(hql_salary_item_issum, null);

			if (listsalary_item != null && !listsalary_item.isEmpty()) {
				StringBuffer sqlBufferin = new StringBuffer(2000);// 内层sql，读取明细
				StringBuffer sqlBufferout = new StringBuffer(2000);// 外层sql，用来汇总
				sqlBufferout.append("select ");
				sqlBufferin.append("select ");
				for (Salary_item salary_item : listsalary_item) {
					sqlBufferout.append("sum(field" + salary_item.getId() + ") as " + salary_item.getName() + ",");
					sqlBufferin.append(" case salary_item_id when " + salary_item.getId() + " then money else 0 end as field" + salary_item.getId() + ",");
				}

				sqlBufferout.deleteCharAt(sqlBufferout.lastIndexOf(","));
				sqlBufferin.deleteCharAt(sqlBufferin.lastIndexOf(","));

				sqlBufferin.append(" from salary_detail where account_id=" + account_id);
				sqlBufferout.append(" from ( ");
				sqlBufferout.append(sqlBufferin);
				sqlBufferout.append(" ) as salary_item_sum");

				System.out.println("getSalarydetaillist-->sqlBufferout:" + sqlBufferout.toString());
				List<Map<String, Object>> listsum = salary_detailService.queryNaviSql(sqlBufferout.toString(), null);

				jsonobj.put("footer", JsonUtils.getJsonFromList(listsum));

			}

		} catch (Exception e) {
			errormessage = e.getMessage();
			return ERROR;
		}

		return SUCCESS;
	}

	/**
	 * 导出奖金明细Excel
	 * 
	 * @return
	 */
	public String getSalarydetailExcel() {
		try {
			salary_detailService.callprInitsalarydetail(account_id);

			Employee employee = (Employee) ActionContext.getContext().getSession().get("employeeinfo");
			// 返回动态sql语句
			String sql = salary_detailService.GetfnGetsalarysql(account_id, employee);
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("account_id", account_id);
			List<Map<String, Object>> listsalarydetail = salary_detailService.queryNaviSql(sql, params);
			if (listsalarydetail != null && listsalarydetail.size() > 0) {
				Map<String, Object> mapSalaryDetail = listsalarydetail.get(0);
				String[] titles = new String[mapSalaryDetail.size()];
				int count = 0;
				for (String key : mapSalaryDetail.keySet()) {
					titles[count++] = key;
				}

				ExcelUtils excel = new ExcelUtils();
				inputStream = excel.getExcelInputStream(titles, titles, listsalarydetail);
			}

			return SUCCESS;
		} catch (Exception e) {
			errormessage = "导出Excel失败，请检查...";
			e.printStackTrace();
		}

		return ERROR;
	}

	/**
	 * 自动核算
	 * 
	 * @return ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public synchronized String calcSalarydetail() {
		try {
			// 第一步，取出人员的列表，关联上公式模板
			String hql = "From Employee where isdel=0 ";
			// 如果人员的信息不为空，则表示非超级管理员，则只能计算自己部门的信息
			Employee tmpEmployee = (Employee) ActionContext.getContext().getSession().get("employeeinfo");
			if (tmpEmployee != null) {
				hql += " and department_id=" + tmpEmployee.getDepartment_id();
			}
			List<Employee> listemployee = employeeService.query(hql, null);

			String exp_hql = "From Salary_item_expression";
			List<Salary_item_expression> listsalaryitemexpression = salary_item_expressionService.query(exp_hql, null);
			Map<String, Salary_item_expression> expressionMap = new HashMap<String, Salary_item_expression>();

			for (Salary_item_expression salary_item_expression : listsalaryitemexpression) {
				expressionMap.put(Integer.toString(salary_item_expression.getId()), salary_item_expression);
			}

			String unit_hql = "From Salary_item_unit";
			List<Salary_item_unit> listsalary_item_unit = salary_item_unitService.query(unit_hql, null);
			Map<String, String> mapsalary_item_unit = new HashMap<String, String>();

			for (Salary_item_unit salary_item_unit : listsalary_item_unit) {
				mapsalary_item_unit.put(Integer.toString(salary_item_unit.getId()), salary_item_unit.getSequence());
			}

			// 第一次循环计算
			calcByEmployees(listemployee, mapsalary_item_unit, expressionMap);
			// 第二次循环计算，防止公式计算取数bug
			calcByEmployees(listemployee, mapsalary_item_unit, expressionMap);

			// 第四步，显示计算好的页面
			initlistSalarydetailPage();
		} catch (Exception e) {
			errormessage = "奖金项目公式设置错误,请检查奖金公式...";
			return ERROR;
		}

		return SUCCESS;
	}

	/**
	 * 保存来自Easyui的Datagrid传递过来的json数据
	 * 
	 * @return ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public synchronized String editSalarydetailFromDatagrid() {
		try {
			String hql = "From Salary_item where isedit=1";
			if (json_str != null && !json_str.isEmpty()) {
				List<Salary_item> listsalary_item = salary_itemService.query(hql, null);
				List<Map<String, Object>> listmap = SalaryUtils.parseDatagridJson(json_str);

				for (Map<String, Object> jsonMap : listmap) {
					if (jsonMap != null && !jsonMap.isEmpty()) {
						for (Salary_item salary_item : listsalary_item) {
							if (jsonMap.containsKey(salary_item.getName())) {
								salary_detailService.callprSetsalarydetail(account_id, SalaryUtils.parseInteger(jsonMap.get("empid")), salary_item.getId(),
										SalaryUtils.parseBigDecimal(jsonMap.get(salary_item.getName())));
							}
						}
					}
				}
			}

			// 显示奖金明细
			initlistSalarydetailPage();
		} catch (Exception e) {
			errormessage = e.getMessage();
			return ERROR;
		}

		return SUCCESS;
	}

	/**
	 * 批量设置奖金明细页面
	 * 
	 * @return ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public synchronized String batchSetSalarydetailPage() {
		try {
			String hql_salary_item = "From Salary_item where isdel=0 and isedit=1";
			listsalary_item = salary_itemService.query(hql_salary_item, null);

			String hql_dept = "From Department where isdel=0 ";
			// 如果人员的信息不为空，则表示非超级管理员，则只能读取自己部门的信息
			Employee tmpEmployee = (Employee) ActionContext.getContext().getSession().get("employeeinfo");
			if (tmpEmployee != null) {
				hql_dept += " and id=" + tmpEmployee.getDepartment_id();
			}

			listdepartment = departmentService.query(hql_dept, null);
			// 如果人员的信息为空，则表示是超级管理员，添加一项“所有部门”
			if (tmpEmployee == null) {
				Department tmpDepartment = new Department();
				tmpDepartment.setId(0);
				tmpDepartment.setName("所有部门");
				listdepartment.add(0, tmpDepartment);
			}
		} catch (Exception e) {
			errormessage = e.getMessage();
			return ERROR;
		}

		return SUCCESS;
	}

	/**
	 * 批量设置奖金明细
	 * 
	 * @return ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public synchronized String batchSetSalarydetail() {
		try {
			StringBuffer sqlbuffer = new StringBuffer(500);
			sqlbuffer.append("update salary_detail set money=" + money);
			sqlbuffer.append(" where account_id=" + account_id);
			sqlbuffer.append(" and salary_item_id=" + salary_item_id);

			if (departmentid != null && departmentid != 0) {
				String hql = "From Employee where department_id=" + departmentid;
				List<Employee> listemployee = employeeService.query(hql, null);
				StringBuffer sqlbuffer2 = new StringBuffer(500);
				sqlbuffer2.append(" and emp_id in(");

				for (Employee employee : listemployee) {
					sqlbuffer2.append(employee.getId() + ",");
				}

				String sql2 = sqlbuffer2.substring(0, sqlbuffer2.length() - 1) + ")";

				sqlbuffer.append(sql2);
			}

			salary_detailService.executeSQL(sqlbuffer.toString());

			// 显示奖金明细页面数据
			initlistSalarydetailPage();
		} catch (Exception e) {
			errormessage = e.getMessage();
			return ERROR;
		}

		return SUCCESS;
	}

	/**
	 * 重新读取CRM/A6数据
	 * 
	 * @return ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public synchronized String initSalaryDetail() {
		if (account_id != null) {
			account = accountService.getEntityById(account_id, "Account");
			salary_detailService.initSalaryDetail(account);
		}

		// 显示奖金明细页面数据
		initlistSalarydetailPage();
		return SUCCESS;
	}

	/**
	 * 根据人员信息列表来进行计算
	 * 
	 * @param listemployee
	 * @param mapsalary_item_unit
	 * @param expressionMap
	 */
	public void calcByEmployees(List<Employee> listemployee, Map<String, String> mapsalary_item_unit, Map<String, Salary_item_expression> expressionMap) {
		// 第一次循环计算
		for (Employee employee : listemployee) {
			// 第二步，读取该人员的公式模板
			String[] salary_item_expressionid = mapsalary_item_unit.get(Integer.toString(employee.getSalary_item_unit_id())).split(",");
			// 第三步，循环执行该计算公式
			for (String expressionid : salary_item_expressionid) {
				Salary_item_expression salary_item_expression = expressionMap.get(expressionid);
				String hql_money = salary_item_expression.getDynmaicsql();
				hql_money = SalaryUtils.parseSQL(hql_money, account_id, employee.getId());

				// 用来存储sql语句获取到的money值

				BigDecimal money = NumberUtils.ObjectToBigDecimal(salary_item_expressionService.queryNaviSql(hql_money, null).get(0).get("money"));
				salary_detailService.callprSetsalarydetail(account_id, employee.getId(), salary_item_expression.getSalary_item_id(), money);
			}
		}
	}
}
