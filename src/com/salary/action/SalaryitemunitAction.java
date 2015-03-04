package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.salary.action.base.BaseAction;
import com.salary.entity.Salary_item_unit;
import com.salary.service.Salary_item_unitService;

/**
 * 奖金公式单元action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class SalaryitemunitAction extends BaseAction {
	private Salary_item_unitService salary_item_unitService;
	private Integer id;								//奖金期间id
	private Salary_item_unit salary_item_unit;		//奖金公式单元
	
	public Salary_item_unitService getSalary_item_unitService() {
		return salary_item_unitService;
	}
	public void setSalary_item_unitService(
			Salary_item_unitService salary_item_unitService) {
		this.salary_item_unitService = salary_item_unitService;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
		return SUCCESS;
	}
	
	/**
	 * 显示修改奖金项目公式单元页
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editSalaryitemunitPage(){
		try {
			salary_item_unit=salary_item_unitService.getEntityById(id, "Salary_item_unit");
		} catch (Exception e) {
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
			salary_item_unitService.add(salary_item_unit);
		} catch (Exception e) {
			errormessage="添加奖金项目公式模板失败，已有相同名称的奖金项目公式模板...";
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
			salary_item_unitService.edit(salary_item_unit);
		} catch (Exception e) {
			errormessage="修改奖金项目公式模板失败，已有相同名称的奖金项目公式模板...";
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
			salary_item_unit=salary_item_unitService.getEntityById(id, "Salary_item_unit");
			salary_item_unitService.del(salary_item_unit);
		} catch (Exception e) {
			errormessage="删除奖金公式单元模板失败，该奖金公式单元模板已经在使用中...";
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
		try {
			List<Salary_item_unit> listsalary_item_unit=
					salary_item_unitService.queryByPage(hql, null,page,rows);
			
			Map<String,Object> jsonMap=new HashMap<String,Object>();
			jsonMap.put("rows", listsalary_item_unit);
			jsonMap.put("total", salary_item_unitService.getRowCountByHql(hql, null));
			
			jsonobj=new JSONObject();
			jsonobj=JSONObject.fromObject(jsonMap);
		} catch (Exception e) {
			errormessage="获取奖金公式单元列表失败...";
			return ERROR;
		}
		
		return SUCCESS;
	}
	
}
