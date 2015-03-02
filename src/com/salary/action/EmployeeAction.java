package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import com.salary.entity.Department;
import com.salary.entity.Employee;
import com.salary.entity.Salary_item;
import com.salary.entity.Salary_item_unit;
import com.salary.service.impl.DepartmentServiceImpl;
import com.salary.service.impl.EmployeeServiceImpl;
import com.salary.service.impl.Salary_item_unitServiceImpl;
import com.salary.util.NumberUtils;

/**
 * 职员信息action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class EmployeeAction extends CRUDAction {
	private Logger logger=Logger.getLogger(EmployeeAction.class);
	
	private EmployeeServiceImpl employeeService;
	private DepartmentServiceImpl departmentService;	
	private Salary_item_unitServiceImpl salary_item_unitService;
	private Integer id;								//员工id
	private Integer account_id;						//奖金期间id
	private Integer emp_id;							//员工id
	private Salary_item salary_item;				//奖金项目
	private List<Department> listdepartment;		//部门列表
	private List<Salary_item_unit> listsalary_item_unit;//奖金模板列表
	private Employee employee;						//职员
	private List<Employee> listemployee;			//员工列表
	
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public EmployeeServiceImpl getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeServiceImpl employeeService) {
		this.employeeService = employeeService;
	}

	public DepartmentServiceImpl getDepartmentService() {
		return departmentService;
	}

	public void setDepartmentService(DepartmentServiceImpl departmentService) {
		this.departmentService = departmentService;
	}

	public Salary_item_unitServiceImpl getSalary_item_unitService() {
		return salary_item_unitService;
	}

	public void setSalary_item_unitService(
			Salary_item_unitServiceImpl salary_item_unitService) {
		this.salary_item_unitService = salary_item_unitService;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getAccount_id() {
		return account_id;
	}

	public void setAccount_id(Integer account_id) {
		this.account_id = account_id;
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

	public List<Department> getListdepartment() {
		return listdepartment;
	}

	public void setListdepartment(List<Department> listdepartment) {
		this.listdepartment = listdepartment;
	}

	public List<Salary_item_unit> getListsalary_item_unit() {
		return listsalary_item_unit;
	}

	public void setListsalary_item_unit(List<Salary_item_unit> listsalary_item_unit) {
		this.listsalary_item_unit = listsalary_item_unit;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public List<Employee> getListemployee() {
		return listemployee;
	}

	public void setListemployee(List<Employee> listemployee) {
		this.listemployee = listemployee;
	}

	/**
	 * 添加员工页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addEmployeePage(){
		try {
			String hql="From Department where isdel=0";
			listdepartment=departmentService.query(hql, null);
			hql="From Salary_item_unit";
			listsalary_item_unit=salary_item_unitService.query(hql, null);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 修改员工页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editEmployeePage(){
		try {
			String hql_emp="From Employee where id="+id;
			employee=employeeService.get(hql_emp, null);
			
			String hql_dept="From Department where isdel=0";
			listdepartment=departmentService.query(hql_dept, null);
			
			String hql_sala="From Salary_item_unit";
			listsalary_item_unit=salary_item_unitService.query(hql_sala, null);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 添加员工
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addEmployee(){
		try {
			//先检测员工表中是否有相同的code，如果有则抛出错误信息
			String sql="select count(1) as money from employee where code=:code";
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("code", employee.getCode());
			Integer emp_count=NumberUtils.BigIntegerToInteger(
					employeeService.queryNaviSql(sql, params).get(0).get("money"));
			if(emp_count>0){
				errormessage="添加员工失败，已有相同的员工编号...";
				return ERROR;
			}
			
			employeeService.add(employee);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 修改员工
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editEmployee(){
		try {
			//先检测原员工表中的code是否和现在一样，不一样则需要检测
			String hql="From Employee where id="+employee.getId();
			Employee tmpEmployee=employeeService.get(hql, null);
			if(!tmpEmployee.getCode().equals(employee.getCode())){
				//先检测员工表中是否有相同的code，如果有则抛出错误信息
				String sql="select count(1) as money from employee where code=:code";
				Map<String,Object> params=new HashMap<String,Object>();
				params.put("code", employee.getCode());
				Integer emp_count=NumberUtils.BigIntegerToInteger(
						employeeService.queryNaviSql(sql, params).get(0).get("money"));
				if(emp_count>0){
					errormessage="修改员工失败，已有相同的员工编号...";
					return ERROR;
				}
			}
			
			employeeService.edit(employee);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 删除员工
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String delEmployee(){
		try {
			//先检测该人员是否在奖金明细表中
			String sql="select count(1) as money from salary_detail where emp_id="+id;
			Integer emp_count=0;
			emp_count=NumberUtils.BigIntegerToInteger(
									employeeService.queryNaviSql(sql, null).get(0).get("money"));
			
			if(emp_count>0){
				errormessage="删除人员失败，该人员已经在奖金明细表中使用...";
				return ERROR;
			}
			
			//删除人员信息
			String hql="From Employee where id="+id;
			employee=employeeService.get(hql, null);
			employeeService.del(employee);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 显示员工列表页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String listEmployeePage(){
		return SUCCESS;
	}
	
	/**
	 * 获取员工列表json数据
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String getEmployeelist(){
		this.init();
		StringBuffer hqlBuffer=new StringBuffer(500);
		hqlBuffer.append(" select emp.id,emp.code,emp.a6code,emp.name,dept.name as department_id, ");
		hqlBuffer.append(" case emp.level when 0 then '员工' when 1 then '主管' else '经理' end as level ");
		hqlBuffer.append(" From employee emp  ");
		hqlBuffer.append(" left join department dept ");
		hqlBuffer.append(" on emp.department_id=dept.id ");
		hqlBuffer.append(" where emp.isdel=0 ");
		
		List<Map<String,Object>> listemployee=employeeService.queryNaviSqlByPage(hqlBuffer.toString(), null, page, rows);
		Map<String,Object> jsonMap=new HashMap<String,Object>();
		jsonMap.put("rows", listemployee);
		jsonMap.put("total", employeeService.queryNaviSql(hqlBuffer.toString(), null).size());
		
		jsonobj=new JSONObject();
		jsonobj=JSONObject.fromObject(jsonMap);
		
		return SUCCESS;
	}
	
	/**
	 * 同步A6的员工编号
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String syncEmployeeFromA6(){
		employeeService.syncEmployeeFromA6();
		return SUCCESS;
	}
	
}
