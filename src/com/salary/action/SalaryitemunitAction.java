package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.salary.entity.Employee;
import com.salary.entity.Salary_item;
import com.salary.entity.Salary_item_expression;
import com.salary.entity.Salary_item_unit;
import com.salary.service.EmployeeService;
import com.salary.service.Salary_item_expressionService;
import com.salary.service.Salary_item_unitService;

/**
 * 奖金公式单元action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class SalaryitemunitAction extends ActionSupport {
	private Salary_item_unitService salary_item_unitService;
	private Salary_item_expressionService salary_item_expressionService;
	private EmployeeService employeeService;
	private Integer id;								//奖金期间id
	private Integer account_id;						//奖金期间id
	private Integer emp_id;							//员工id
	private Salary_item salary_item;				//奖金项目
	private JSONObject jsonobj;						//json对象，传递给Easyui表格
	private Integer page;							//Easyui分页号
	private Integer rows;							//Easyui分页大小
	private List<Salary_item_expression> listsalary_item_expression;//奖金公式列表
	private Salary_item_unit salary_item_unit;		//奖金公式单元
	private String errormessage;					//错误消息
	
	/**
	 * 初始化分页
	 */
	public void init(){
		page=(page==null || page==0)?new Integer(1):page;
		rows=(rows==null || rows==0)?new Integer(10):rows;
	}
	
	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
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
	
	public Salary_item_unitService getSalary_item_unitService() {
		return salary_item_unitService;
	}

	public void setSalary_item_unitService(
			Salary_item_unitService salary_item_unitService) {
		this.salary_item_unitService = salary_item_unitService;
	}
	
	public Salary_item_unit getSalary_item_unit() {
		return salary_item_unit;
	}
	
	public void setSalary_item_unit(Salary_item_unit salary_item_unit) {
		this.salary_item_unit = salary_item_unit;
	}
	
	public Salary_item_expressionService getSalary_item_expressionService() {
		return salary_item_expressionService;
	}
	
	public void setSalary_item_expressionService(
			Salary_item_expressionService salary_item_expressionService) {
		this.salary_item_expressionService = salary_item_expressionService;
	}
	
	public List<Salary_item_expression> getListsalary_item_expression() {
		return listsalary_item_expression;
	}
	
	public void setListsalary_item_expression(
			List<Salary_item_expression> listsalary_item_expression) {
		this.listsalary_item_expression = listsalary_item_expression;
	}
	
	public String getErrormessage() {
		return errormessage;
	}

	public void setErrormessage(String errormessage) {
		this.errormessage = errormessage;
	}

	/**
	 * 显示添加奖金项目单元页
	 * @return
	 */
	public String addSalaryitemunitPage(){
		String hql="From Salary_item_expression";
		listsalary_item_expression=salary_item_expressionService.query(hql, null);
		
		return SUCCESS;
	}
	
	/**
	 * 显示修改奖金项目公式单元页
	 * @return
	 */
	public String editSalaryitemunitPage(){
		String hql="From Salary_item_expression";
		listsalary_item_expression=salary_item_expressionService.query(hql, null);
		hql="From Salary_item_unit where id="+id;
		salary_item_unit=salary_item_unitService.get(hql, null);
		
		return SUCCESS;
	}
	
	/**
	 * 添加奖金公式单元
	 * @return
	 */
	public String addSalaryitemunit(){
		salary_item_unitService.add(salary_item_unit);
		
		return SUCCESS;
	}
	
	/**
	 * 修改奖金公式单元
	 * @return
	 */
	public String editSalaryitemunit(){
		salary_item_unitService.edit(salary_item_unit);
		
		return SUCCESS;
	}
	
	/**
	 * 删除奖金公式单元
	 * @return
	 */
	public String delSalaryitemunit(){
		//先加载员工的salary_item_unit,判断是否能删除
		String hql_emp="From Employee where isdel=0";
		List<Employee> listemployee=employeeService.query(hql_emp, null);
		for(Employee employee:listemployee){
			if(employee.getSalary_item_unit_id()==id){
				errormessage="删除失败，此奖金公式模板已在使用中。";
				return ERROR;
			}
		}
		
		String hql="From Salary_item_unit where id="+id;
		salary_item_unit=salary_item_unitService.get(hql, null);
		salary_item_unitService.del(salary_item_unit);
		
		return SUCCESS;
	}
	
	/**
	 * 显示奖金公式单元列表页
	 * @return
	 */
	public String listSalaryitemunitPage(){
		return SUCCESS;
	}
	
	/**
	 * 获取奖金公式单元列表json数据
	 * @return
	 */
	public String getSalaryitemunitlist(){
		this.init();
		String hql="From Salary_item_unit";
		List<Salary_item_unit> listsalary_item_unit=
				salary_item_unitService.queryByPage(hql, null,page,rows);
		
		Map<String,Object> jsonMap=new HashMap<String,Object>();
		jsonMap.put("rows", listsalary_item_unit);
		jsonMap.put("total", salary_item_unitService.query(hql,null).size());
		
		jsonobj=new JSONObject();
		jsonobj=JSONObject.fromObject(jsonMap);
		
		return SUCCESS;
	}
	
}
