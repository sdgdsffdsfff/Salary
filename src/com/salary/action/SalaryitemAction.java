package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.salary.entity.Salary_item;
import com.salary.service.Salary_itemService;

/**
 * 奖金项目action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class SalaryitemAction extends ActionSupport{
	private Salary_itemService salary_itemService;	//工资项目业务处理sercice
	private Integer id;								//工资项目id
	private Integer salary_item_id;					//工资项目的id
	private Integer account_id;						//奖金期间id
	private Integer emp_id;							//员工id
	private Salary_item salary_item;				//奖金项目
	private JSONObject jsonobj;						//json对象，传递给Easyui表格
	private Integer page;							//Easyui分页号
	private Integer rows;							//Easyui分页大小
	
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
	 * @return
	 */
	public String addSalaryitemPage(){
		return SUCCESS;
	}
	
	/**
	 * 显示修改奖金项目页面
	 * @return
	 */
	public String editSalaryitemPage(){
		String hql="From Salary_item where id="+id;
		salary_item=salary_itemService.get(hql, null);
		return SUCCESS;
	}
	
	/**
	 * 添加工资项目
	 * @return
	 */
	public String addSalaryitem(){
		salary_item.setIsdel(0);
		salary_itemService.add(salary_item);
		
		return SUCCESS;
	}
	
	/**
	 * 修改工资项目信息
	 * @return
	 */
	public String editSalaryitem(){
		salary_itemService.edit(salary_item);
		
		return SUCCESS;
	}
	
	/**
	 * 删除工资项目
	 * @return
	 */
	public String delSalaryitem(){
		String hql="From Salary_item where id="+id;
		salary_item=salary_itemService.get(hql, null);
		salary_itemService.del(salary_item);
		
		return SUCCESS;
	}
	
	/**
	 * 奖金项目列表页
	 * @return
	 */
	public String listSalaryitemPage(){
		return SUCCESS;
	}
	
	/**
	 * 获取工资项目列表json数据
	 * @return
	 */
	public String getSalaryitemlist(){
		this.init();
		String hql="From Salary_item where isdel=0";
		Map<String,Object> params=new HashMap<String,Object>();
		
		List<Salary_item> listSalaryitem=salary_itemService.queryByPage(hql, params,page, rows);
		Map<String,Object> jsonMap=new HashMap<String,Object>();
		
		jsonMap.put("rows", listSalaryitem);
		jsonMap.put("total", salary_itemService.query(hql, null).size());
		jsonobj=new JSONObject();
		jsonobj=JSONObject.fromObject(jsonMap);
	
		return SUCCESS;
	}
	
}
