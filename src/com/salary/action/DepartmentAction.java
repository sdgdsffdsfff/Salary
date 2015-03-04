package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.salary.action.base.BaseAction;
import com.salary.entity.Department;
import com.salary.service.DepartmentService;

/**
 * 部门信息action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class DepartmentAction extends BaseAction {
	
	private DepartmentService departmentService;
	private Integer id;								//部门id
	private Department department;					//部门信息
	
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
			department=departmentService.getEntityById(id, "Department");
		} catch (Exception e) {
			errormessage="读取部门信息失败...";
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
			departmentService.add(department);
		} catch (Exception e) {
			errormessage="添加部门信息失败，已存在相同名称的部门名称...";
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
			departmentService.edit(department);
		} catch (Exception e) {
			errormessage="修改部门信息失败，已存在相同名称的部门名称...";
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
			department=departmentService.getEntityById(id, "Department");
			departmentService.del(department);
		} catch (Exception e) {
			errormessage="删除部门失败，该部门已经被使用...";
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
		
		try {
			List<Department> listdepartment=departmentService.queryByPage(hql, null, page, rows);
			Map<String,Object> jsonMap=new HashMap<String,Object>();
			jsonMap.put("rows", listdepartment);
			jsonMap.put("total", departmentService.getRowCountByHql(hql, null));
			
			jsonobj=new JSONObject();
			jsonobj=JSONObject.fromObject(jsonMap);
		} catch (Exception e) {
			errormessage="读取部门信息列表失败...";
			return ERROR;
		}
				
		return SUCCESS;
	}
	
	
}
