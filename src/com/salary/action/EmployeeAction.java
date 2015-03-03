package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONObject;
import com.salary.action.base.BaseAction;
import com.salary.entity.Employee;
import com.salary.service.impl.EmployeeServiceImpl;

/**
 * 职员信息action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class EmployeeAction extends BaseAction {
	private EmployeeServiceImpl employeeService;
	private Integer id;								//员工id
	private Employee employee;						//职员
	
	public EmployeeServiceImpl getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeServiceImpl employeeService) {
		this.employeeService = employeeService;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	/**
	 * 添加员工页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addEmployeePage(){
		return SUCCESS;
	}
	
	/**
	 * 修改员工页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editEmployeePage(){
		try {
			employee=employeeService.getEntityById(id, "Employee");
		} catch (Exception e) {
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
			employeeService.add(employee);
		} catch (Exception e) {
			errormessage="添加员工失败，已有相同的员工编号...";
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
			employeeService.edit(employee);
		} catch (Exception e) {
			errormessage="修改员工失败，已有相同的员工编号...";
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
			employee=employeeService.getEntityById(id, "Employee");
			employeeService.del(employee);
		} catch (Exception e) {
			errormessage="删除人员失败，该人员已经在奖金明细表中使用...";
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
		
		try {
			List<Map<String,Object>> listemployee=employeeService.queryNaviSqlByPage(hqlBuffer.toString(), null, page, rows);
			Map<String,Object> jsonMap=new HashMap<String,Object>();
			jsonMap.put("rows", listemployee);
			jsonMap.put("total", employeeService.getRowCountBySql(hqlBuffer.toString(), null));
			
			jsonobj=new JSONObject();
			jsonobj=JSONObject.fromObject(jsonMap);
		} catch (Exception e) {
			errormessage="读取员工信息列表失败...";
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 同步A6的员工编号
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editSyncEmployeeFromA6(){
		try {
			employeeService.editSyncEmployeeFromA6();
		} catch (Exception e) {
			errormessage="同步A6员工编码失败...";
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}
	
}
