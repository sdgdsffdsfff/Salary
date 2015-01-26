package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.salary.entity.Salary_item;
import com.salary.service.Salary_itemService;
import com.salary.util.NumberUtils;

/**
 * 奖金项目action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class SalaryitemAction extends ActionSupport{
	private Logger logger=Logger.getLogger(SalaryitemAction.class);
	
	private Salary_itemService salary_itemService;	//工资项目业务处理sercice
	private Integer id;								//工资项目id
	private Integer salary_item_id;					//工资项目的id
	private Integer account_id;						//奖金期间id
	private Integer emp_id;							//员工id
	private Salary_item salary_item;				//奖金项目
	private JSONObject jsonobj;						//json对象，传递给Easyui表格
	private Integer page;							//Easyui分页号
	private Integer rows;							//Easyui分页大小
	private String errormessage;					//错误消息
	
	public String getErrormessage() {
		return errormessage;
	}

	public void setErrormessage(String errormessage) {
		this.errormessage = errormessage;
	}
	
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	/**
	 * 初始化分页
	 */
	public void init(){
		page=(page==null || page==0)?new Integer(1):page;
		rows=(rows==null || rows==0)?new Integer(10):rows;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSalary_item_id() {
		return salary_item_id;
	}

	public void setSalary_item_id(Integer salary_item_id) {
		this.salary_item_id = salary_item_id;
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
	public Salary_itemService getSalary_itemService() {
		return salary_itemService;
	}
	public void setSalary_itemService(Salary_itemService salary_itemService) {
		this.salary_itemService = salary_itemService;
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
		String hql="From Salary_item where id="+id;
		salary_item=salary_itemService.get(hql, null);
		return SUCCESS;
	}
	
	/**
	 * 添加奖金项目
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addSalaryitem(){
		try {
			//先检测奖金项目名称是否有重复
			String sql="select count(1) as money from salary_item where name=:name";
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("name", salary_item.getName());
			Integer sal_count=NumberUtils.BigIntegerToInteger(
					salary_itemService.queryNaviSql(sql, params).get(0).get("money"));
			if(sal_count>0){
				errormessage="添加奖金项目失败，已有相同的奖金项目名称...";
				return ERROR;
			}
			
			salary_item.setIsdel(0);
			salary_itemService.add(salary_item);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
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
			//先读取原奖金项目的名称，查看是否和现在一致，如果不一致，则需要检测在奖金项目表中是否有重名
			String hql="From Salary_item where id="+salary_item.getId();
			Salary_item tmpSalary_item=salary_itemService.get(hql, null);
			if(!tmpSalary_item.getName().equals(salary_item.getName())){
				//先检测奖金项目名称是否有重复
				String sql="select count(1) as money from salary_item where name=:name";
				Map<String,Object> params=new HashMap<String,Object>();
				params.put("name", salary_item.getName());
				Integer sal_count=NumberUtils.BigIntegerToInteger(
						salary_itemService.queryNaviSql(sql, params).get(0).get("money"));
				if(sal_count>0){
					errormessage="修改奖金项目失败，已有相同的奖金项目名称...";
					return ERROR;
				}
			}
			
			salary_itemService.edit(salary_item);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
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
			//删除奖金项目之前，需要检测奖金项目公式是否有引用此奖金项目id
			//统计出包含奖金项目id的数量
			String sql="select count(1) as money from salary_item_expression ";
			sql+=" where 0<INSTR(dynmaicsql,':account_id,:emp_id,"+id+"')";
			Integer sal_count=0;
			sal_count=NumberUtils.BigIntegerToInteger(
					salary_itemService.queryNaviSql(sql, null).get(0).get("money"));
			if(sal_count>0){
				errormessage="删除奖金项目失败,该奖金项目已经在奖金项目公式中使用...";
				return ERROR;
			}
			
			sql="select count(1) as money from salary_item_expression where salary_item_id="+id;
			sal_count=NumberUtils.BigIntegerToInteger(
					salary_itemService.queryNaviSql(sql, null).get(0).get("money"));
			if(sal_count>0){
				errormessage="删除奖金项目失败,该奖金项目已经在奖金项目公式中使用...";
				return ERROR;
			}
			
			sql="select count(1) as money from salary_detail where salary_item_id="+id;
			sal_count=NumberUtils.BigIntegerToInteger(
					salary_itemService.queryNaviSql(sql, null).get(0).get("money"));
			if(sal_count>0){
				errormessage="删除奖金项目失败,该奖金项目已经在奖金明细表中使用...";
				return ERROR;
			}
			
			String hql="From Salary_item where id="+id;
			salary_item=salary_itemService.get(hql, null);
			salary_itemService.del(salary_item);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
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
		
		List<Map<String,Object>> listSalaryitem=salary_itemService.queryNaviSqlByPage(sqlBuffer.toString(), null,page, rows);
		Map<String,Object> jsonMap=new HashMap<String,Object>();
		
		jsonMap.put("rows", listSalaryitem);
		jsonMap.put("total", salary_itemService.queryNaviSql(sqlBuffer.toString(), null).size());
		jsonobj=new JSONObject();
		jsonobj=JSONObject.fromObject(jsonMap);
	
		return SUCCESS;
	}
	
}
