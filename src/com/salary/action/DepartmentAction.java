package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import net.sf.json.JSONObject;
import com.salary.entity.Department;
import com.salary.entity.Salary_item;
import com.salary.service.DepartmentService;
import com.salary.util.NumberUtils;

/**
 * 部门信息action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class DepartmentAction extends CRUDAction {
	private Logger logger=Logger.getLogger(DepartmentAction.class);
	
	private DepartmentService departmentService;
	private Integer id;								//部门id
	private Integer account_id;						//奖金期间id
	private Integer emp_id;							//员工id
	private Salary_item salary_item;				//奖金项目
	private Department department;					//部门信息
	
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
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

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	/**
	 * 显示添加部门页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addDepartmentPage(){
		return SUCCESS;
	}
	
	/**
	 * 显示修改部门页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editDepartmentPage(){
		try {
			String hql="From Department where id="+id;
			department=departmentService.get(hql, null);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 添加部门
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addDepartment(){
		try {
			//先检测在表中是否有重名的部门信息
			String sql="select count(1) as money from department where name=:name";
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("name", department.getName());
			Integer dept_count=NumberUtils.BigIntegerToInteger(
					departmentService.queryNaviSql(sql, params).get(0).get("money"));
			if(dept_count>0){
				errormessage="添加部门失败，已有相同名称的部门信息...";
				return ERROR;
			}
			
			departmentService.add(department);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 修改部门
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editDepartment(){
		try {
			//先检测原部门名称和现在的部门名称是否相同，如果相同，则需要检测是否有同名的部门
			String hql="From Department where id="+department.getId();
			Department tmpDepartment=departmentService.get(hql, null);
			if(!tmpDepartment.getName().equals(department.getName())){
				//先检测在表中是否有重名的部门信息
				String sql="select count(1) as money from department where name=:name";
				Map<String,Object> params=new HashMap<String,Object>();
				params.put("name", department.getName());
				Integer dept_count=NumberUtils.BigIntegerToInteger(
						departmentService.queryNaviSql(sql, params).get(0).get("money"));
				if(dept_count>0){
					errormessage="修改部门失败，已有相同名称的部门信息...";
					return ERROR;
				}
			}
			
			departmentService.edit(department);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 删除部门
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String delDepartment(){
		try {
			//先检测该部门是否有人员在引用
			String sql="select count(1) as money from employee where department_id="+id;
			Integer dept_count=0;
			dept_count=NumberUtils.BigIntegerToInteger(departmentService.queryNaviSql(sql, null).get(0).get("money"));
			
			if(dept_count>0){
				errormessage="删除部门失败，该部门已经在使用中...";
				return ERROR;
			}
			
			String hql="From Department where id="+id;
			department=departmentService.get(hql, null);
			departmentService.del(department);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 显示部门列表信息
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String listDepartmentPage(){
		return SUCCESS;
	}
	
	/**
	 * 获取部门列表josn数据
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String getDepartmentlist(){
		this.init();
		String hql="From Department where isdel=0";
		List<Department> listdepartment=departmentService.queryByPage(hql, null, page, rows);
		
		Map<String,Object> jsonMap=new HashMap<String,Object>();
		jsonMap.put("rows", listdepartment);
		jsonMap.put("total", departmentService.query(hql, null).size());
		
		jsonobj=new JSONObject();
		jsonobj=JSONObject.fromObject(jsonMap);
				
		return SUCCESS;
	}
	
	
}
