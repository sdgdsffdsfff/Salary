package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import net.sf.json.JSONObject;
import com.salary.entity.Salary_item;
import com.salary.entity.Salary_item_expression;
import com.salary.entity.Salary_item_unit;
import com.salary.service.EmployeeService;
import com.salary.service.Salary_item_expressionService;
import com.salary.service.Salary_item_unitService;
import com.salary.util.NumberUtils;

/**
 * 奖金公式单元action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class SalaryitemunitAction extends CRUDAction {
	private Logger logger=Logger.getLogger(SalaryitemunitAction.class);
	
	private Salary_item_unitService salary_item_unitService;
	private Salary_item_expressionService salary_item_expressionService;
	private EmployeeService employeeService;
	private Integer id;								//奖金期间id
	private Integer account_id;						//奖金期间id
	private Integer emp_id;							//员工id
	private Salary_item salary_item;				//奖金项目
	private List<Salary_item_expression> listsalary_item_expression;//奖金公式列表
	private Salary_item_unit salary_item_unit;		//奖金公式单元
	
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public Salary_item_unitService getSalary_item_unitService() {
		return salary_item_unitService;
	}

	public void setSalary_item_unitService(
			Salary_item_unitService salary_item_unitService) {
		this.salary_item_unitService = salary_item_unitService;
	}

	public Salary_item_expressionService getSalary_item_expressionService() {
		return salary_item_expressionService;
	}

	public void setSalary_item_expressionService(
			Salary_item_expressionService salary_item_expressionService) {
		this.salary_item_expressionService = salary_item_expressionService;
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

	public List<Salary_item_expression> getListsalary_item_expression() {
		return listsalary_item_expression;
	}

	public void setListsalary_item_expression(
			List<Salary_item_expression> listsalary_item_expression) {
		this.listsalary_item_expression = listsalary_item_expression;
	}

	public Salary_item_unit getSalary_item_unit() {
		return salary_item_unit;
	}

	public void setSalary_item_unit(Salary_item_unit salary_item_unit) {
		this.salary_item_unit = salary_item_unit;
	}

	/**
	 * 显示添加奖金项目单元页
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addSalaryitemunitPage(){
		try {
			String hql="From Salary_item_expression";
			listsalary_item_expression=salary_item_expressionService.query(hql, null);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 显示修改奖金项目公式单元页
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editSalaryitemunitPage(){
		try {
			String hql="From Salary_item_expression";
			listsalary_item_expression=salary_item_expressionService.query(hql, null);
			hql="From Salary_item_unit where id="+id;
			salary_item_unit=salary_item_unitService.get(hql, null);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 添加奖金公式单元
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addSalaryitemunit(){
		try {
			//先检测奖金项目公式模板是否有同名的
			String sql="select count(1) as money from salary_item_unit where name=:name";
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("name", salary_item_unit.getName());
			Integer sal_count=0;
			sal_count=NumberUtils.BigIntegerToInteger(
								salary_item_unitService.queryNaviSql(sql, params).get(0).get("money"));
			if(sal_count>0){
				errormessage="添加奖金项目公式模板失败，已有相同名称的奖金项目公式模板...";
				return ERROR;
			}
			
			salary_item_unitService.add(salary_item_unit);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 修改奖金公式单元
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editSalaryitemunit(){
		try {
			//先检测是否和原来的名称相同，不相同则要检测是否有同名
			String hql="From Salary_item_unit where id="+salary_item_unit.getId();
			Salary_item_unit tmpSal=salary_item_unitService.get(hql, null);
			if(!tmpSal.getName().equals(salary_item_unit.getName())){
				//先检测奖金项目公式模板是否有同名的
				String sql="select count(1) as money from salary_item_unit where name=:name";
				Map<String,Object> params=new HashMap<String,Object>();
				params.put("name", salary_item_unit.getName());
				Integer sal_count=0;
				sal_count=NumberUtils.BigIntegerToInteger(
									salary_item_unitService.queryNaviSql(sql, params).get(0).get("money"));
				if(sal_count>0){
					errormessage="添加奖金项目公式模板失败，已有相同名称的奖金项目公式模板...";
					return ERROR;
				}
			}
			
			salary_item_unitService.edit(salary_item_unit);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 删除奖金公式单元
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String delSalaryitemunit(){
		try {
			//检测奖金公式单元模板是否有员工引用
			String sql="select count(1) as money from employee where salary_item_unit_id="+id;
			Integer sal_count=0;
			sal_count=NumberUtils.BigIntegerToInteger(
								salary_item_unitService.queryNaviSql(sql, null).get(0).get("money"));
			
			if(sal_count>0){
				errormessage="删除奖金公式单元模板失败，该奖金公式单元模板已经在使用中...";
				return ERROR;
			}
			
			String hql="From Salary_item_unit where id="+id;
			salary_item_unit=salary_item_unitService.get(hql, null);
			salary_item_unitService.del(salary_item_unit);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 显示奖金公式单元列表页
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String listSalaryitemunitPage(){
		return SUCCESS;
	}
	
	/**
	 * 获取奖金公式单元列表json数据
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
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
