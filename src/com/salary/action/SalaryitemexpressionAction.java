package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONObject;
import com.salary.action.base.BaseAction;
import com.salary.entity.Salary_item;
import com.salary.entity.Salary_item_expression;
import com.salary.service.impl.Salary_itemServiceImpl;
import com.salary.service.impl.Salary_item_expressionServiceImpl;
import com.salary.service.impl.Salary_item_unitServiceImpl;

/**
 * 奖金项目公式
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class SalaryitemexpressionAction extends BaseAction{
	private Salary_item_expressionServiceImpl salary_item_expressionService;
	private Salary_itemServiceImpl salary_itemService;
	private Salary_item_unitServiceImpl salary_item_unitService;
	private Salary_item_expression salary_item_expression;	//奖金项目公式
	private Integer id;										//奖金项目公式id
	private List<Salary_item> listsalary_item;				//奖金项目列表
	private List<Salary_item> listsalary_item2;				//奖金项目列表2
	public Salary_item_expressionServiceImpl getSalary_item_expressionService() {
		return salary_item_expressionService;
	}
	public void setSalary_item_expressionService(
			Salary_item_expressionServiceImpl salary_item_expressionService) {
		this.salary_item_expressionService = salary_item_expressionService;
	}

	public Salary_itemServiceImpl getSalary_itemService() {
		return salary_itemService;
	}

	public void setSalary_itemService(Salary_itemServiceImpl salary_itemService) {
		this.salary_itemService = salary_itemService;
	}

	public Salary_item_unitServiceImpl getSalary_item_unitService() {
		return salary_item_unitService;
	}

	public void setSalary_item_unitService(
			Salary_item_unitServiceImpl salary_item_unitService) {
		this.salary_item_unitService = salary_item_unitService;
	}

	public Salary_item_expression getSalary_item_expression() {
		return salary_item_expression;
	}

	public void setSalary_item_expression(
			Salary_item_expression salary_item_expression) {
		this.salary_item_expression = salary_item_expression;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<Salary_item> getListsalary_item() {
		return listsalary_item;
	}

	public void setListsalary_item(List<Salary_item> listsalary_item) {
		this.listsalary_item = listsalary_item;
	}

	public List<Salary_item> getListsalary_item2() {
		return listsalary_item2;
	}

	public void setListsalary_item2(List<Salary_item> listsalary_item2) {
		this.listsalary_item2 = listsalary_item2;
	}

	/**
	 * 添加奖金公式页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addSalaryitemexpressionPage(){
		try {
			String hql="From Salary_item where isdel=:isdel and level=:level";
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("isdel", 0);
			params.put("level", 1);
			listsalary_item=salary_itemService.query(hql, params);
			
			String hql2="From Salary_item where isdel=:isdel";
			Map<String,Object> params2=new HashMap<String,Object>();
			params2.put("isdel", 0);
			listsalary_item2=salary_itemService.query(hql2, params2);
		} catch (Exception e) {
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 修改奖金页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editSalaryitemexpressionPage(){
		try {
			String hql="From Salary_item where isdel=:isdel and level=:level";
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("isdel", 0);
			params.put("level", 1);
			listsalary_item=salary_itemService.query(hql, params);
			
			String hql2="From Salary_item where isdel=:isdel";
			Map<String,Object> params2=new HashMap<String,Object>();
			params2.put("isdel", 0);
			listsalary_item2=salary_itemService.query(hql2, params2);
			
			hql="From Salary_item_expression where id="+id;
			salary_item_expression=salary_item_expressionService.get(hql, null);
		} catch (Exception e) {
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	
	/**
	 * 添加奖金公式
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addSalaryitemexpression(){
		try {
			salary_item_expressionService.add(salary_item_expression);
		} catch (Exception e) {
			errormessage="添加奖金项目公式失败，已有相同名称的奖金项目公式...";
			return ERROR;	
		}
		
		return SUCCESS;
	}
	
	/**
	 * 修改奖金公式
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editSalaryitemexpression(){
		try {
			salary_item_expressionService.edit(salary_item_expression);
		} catch (Exception e) {
			errormessage="修改奖金项目公式失败，已有相同名称的奖金项目公式...";
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 删除奖金公式
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String delSalaryitemexpression(){
		try {
			salary_item_expression=salary_item_expressionService.getEntityById(id, "Salary_item_expression");
			salary_item_expressionService.del(salary_item_expression);
		} catch (Exception e) {
			errormessage="删除奖金公式失败，该奖金公式已在使用中...";
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	
	/**
	 * 显示奖金公式页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String listSalaryitemexpressionPage(){
		return SUCCESS;
	}
	
	/**
	 * 获取奖金公式列表json数据
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String getSalaryitemexpressionlist(){
		this.init();
		StringBuffer sqlBuffer=new StringBuffer(200);
		sqlBuffer.append(" select sal_e.id,sal_i.name as salary_item_id, ");
		sqlBuffer.append(" sal_e.name,sal_e.dynmaicsql,sal_e.comment ");
		sqlBuffer.append(" From salary_item_expression sal_e ");
		sqlBuffer.append(" left join salary_item sal_i ");
		sqlBuffer.append(" on sal_e.salary_item_id=sal_i.id ");
		
		try {
			Map<String,Object> params=new HashMap<String,Object>();
			List<Map<String,Object>> listSalaryitemexpression=
					salary_item_expressionService.queryNaviSqlByPage(sqlBuffer.toString(), params, page, rows);
			
			Map<String,Object> jsonMap=new HashMap<String,Object>();
			jsonMap.put("rows", listSalaryitemexpression);
			jsonMap.put("total", salary_item_expressionService.getRowCountBySql(sqlBuffer.toString(), params));
			
			jsonobj=new JSONObject();
			jsonobj=JSONObject.fromObject(jsonMap);
		} catch (Exception e) {
			errormessage="读取奖金公式列表失败...";
			return ERROR;
		}
		
		return SUCCESS;
	}
	
}
