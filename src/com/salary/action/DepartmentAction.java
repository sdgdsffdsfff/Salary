package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.salary.entity.Department;
import com.salary.entity.Salary_item;
import com.salary.service.DepartmentService;

/**
 * 部门信息action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class DepartmentAction extends ActionSupport {
	private DepartmentService departmentService;
	private Integer id;								//部门id
	private Integer account_id;						//奖金期间id
	private Integer emp_id;							//员工id
	private Salary_item salary_item;				//奖金项目
	private JSONObject jsonobj;						//json对象，传递给Easyui表格
	private Integer page;							//Easyui分页号
	private Integer rows;							//Easyui分页大小
	private Department department;					//部门信息
	
	/**
	 * 初始化分页
	 */
	public void init(){
		page=(page==null || page==0)?new Integer(1):page;
		rows=(rows==null || rows==0)?new Integer(10):rows;
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
	 * @return
	 */
	public String addDepartmentPage(){
		return SUCCESS;
	}
	
	/**
	 * 显示修改部门页面
	 * @return
	 */
	public String editDepartmentPage(){
		String hql="From Department where id="+id;
		department=departmentService.get(hql, null);
		
		return SUCCESS;
	}
	
	/**
	 * 添加部门
	 * @return
	 */
	public String addDepartment(){
		departmentService.add(department);
		
		return SUCCESS;
	}
	
	/**
	 * 修改部门
	 * @return
	 */
	public String editDepartment(){
		departmentService.edit(department);
		
		return SUCCESS;
	}
	
	/**
	 * 删除部门
	 * @return
	 */
	public String delDepartment(){
		String hql="From Department where id="+id;
		department=departmentService.get(hql, null);
		departmentService.del(department);
		
		return SUCCESS;
	}
	
	/**
	 * 显示部门列表信息
	 * @return
	 */
	public String listDepartmentPage(){
		return SUCCESS;
	}
	
	/**
	 * 获取部门列表josn数据
	 * @return
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
