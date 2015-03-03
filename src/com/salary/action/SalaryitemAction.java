package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONObject;
import com.salary.action.base.BaseAction;
import com.salary.entity.Salary_item;
import com.salary.service.impl.Salary_itemServiceImpl;

/**
 * 奖金项目action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class SalaryitemAction extends BaseAction{
	private Salary_itemServiceImpl salary_itemService;	//工资项目业务处理sercice
	private Integer id;								//工资项目id
	private Salary_item salary_item;				//奖金项目

	public Salary_itemServiceImpl getSalary_itemService() {
		return salary_itemService;
	}

	public void setSalary_itemService(Salary_itemServiceImpl salary_itemService) {
		this.salary_itemService = salary_itemService;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Salary_item getSalary_item() {
		return salary_item;
	}

	public void setSalary_item(Salary_item salary_item) {
		this.salary_item = salary_item;
	}

	/**
	 * 显示添加奖金项目页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addSalaryitemPage(){
		return SUCCESS;
	}
	
	/**
	 * 显示修改奖金项目页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editSalaryitemPage(){
		salary_item=salary_itemService.getEntityById(id, "Salary_item");
		return SUCCESS;
	}
	
	/**
	 * 添加奖金项目
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addSalaryitem(){
		try {
			salary_item.setIsdel(0);
			salary_itemService.add(salary_item);
		} catch (Exception e) {
			errormessage="添加奖金项目失败，已有相同的奖金项目名称...";
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 修改奖金项目信息
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editSalaryitem(){
		try {
			salary_itemService.edit(salary_item);
		} catch (Exception e) {
			errormessage="修改奖金项目失败，已有相同的奖金项目名称...";
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 删除奖金项目
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String delSalaryitem(){
		try {
			salary_item=salary_itemService.getEntityById(id, "Salary_item");
			salary_itemService.del(salary_item);
		} catch (Exception e) {
			errormessage="删除奖金项目失败,该奖金项目已经在奖金明细表中使用...";
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 奖金项目列表页
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String listSalaryitemPage(){
		return SUCCESS;
	}
	
	/**
	 * 获取工资项目列表json数据
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String getSalaryitemlist(){
		this.init();
		StringBuffer sqlBuffer=new StringBuffer(500);
		sqlBuffer.append(" select sal.id,sal.name, ");
		sqlBuffer.append(" case level when 1 then '是' else '否' end as level, ");
		sqlBuffer.append(" case isshow when 1 then '是' else '否' end as isshow, ");
		sqlBuffer.append(" case isedit when 1 then '是' else '否' end as isedit, ");
		sqlBuffer.append(" case issum when 1 then '是' else '否' end as issum ");
		sqlBuffer.append(" From salary_item sal ");
		sqlBuffer.append(" where isdel=0 ");
		
		try {
			List<Map<String,Object>> listSalaryitem=salary_itemService.queryNaviSqlByPage(sqlBuffer.toString(), null,page, rows);
			Map<String,Object> jsonMap=new HashMap<String,Object>();
			
			jsonMap.put("rows", listSalaryitem);
			jsonMap.put("total", salary_itemService.queryNaviSql(sqlBuffer.toString(), null).size());
			jsonobj=new JSONObject();
			jsonobj=JSONObject.fromObject(jsonMap);
		} catch (Exception e) {
			errormessage="读取奖金项目列表失败...";
			return ERROR;
		}
	
		return SUCCESS;
	}
	
}
