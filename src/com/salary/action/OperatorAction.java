package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.salary.entity.Account;
import com.salary.entity.Operator;
import com.salary.entity.Salary_item;
import com.salary.service.OperatorService;

/**
 * 操作员处理action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class OperatorAction extends ActionSupport {
	private OperatorService operatorService;
	private Operator operator;						//操作员
	private Integer account_id;						//奖金期间id
	private Integer id;								//奖金期间id
	private Account account;						//账户期间
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
	
	public Operator getOperator() {
		return operator;
	}

	public void setOperator(Operator operator) {
		this.operator = operator;
	}

	public OperatorService getOperatorService() {
		return operatorService;
	}
	public void setOperatorService(OperatorService operatorService) {
		this.operatorService = operatorService;
	}
	public Integer getAccount_id() {
		return account_id;
	}
	public void setAccount_id(Integer account_id) {
		this.account_id = account_id;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
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
	
	/**
	 * 添加操作员页面
	 * @return
	 */
	public String addOperatorPage(){
		return SUCCESS;
	}
	
	/**
	 * 修改操作员页面
	 * @return
	 */
	public String editOperatorPage(){
		String hql="From Operator where id="+id;
		operator=operatorService.get(hql, null);
		
		return SUCCESS;
	}
	
	/**
	 * 显示操作员页面列表
	 * @return
	 */
	public String listOperatorPage(){
		return SUCCESS;
	}
	
	/**
	 * 添加操作员
	 * @return
	 */
	public String addOperator(){
		operatorService.add(operator);
		return SUCCESS;
	}
	
	/**
	 * 删除操作员
	 * @return
	 */
	public String delOperator(){
		String hql="From Operator where id="+id;
		operator=operatorService.get(hql, null);
		operatorService.del(operator);
		return SUCCESS;
	}
	
	/**
	 * 修改操作员
	 * @return
	 */
	public String editOperator(){
		operatorService.edit(operator);
		return SUCCESS;
	}
	
	/**
	 * 获取操作员列表json数据
	 * @return
	 */
	public String getOperatorlist(){
		String hql="From Operator where isdel=0";
		List<Operator> listoperator=operatorService.queryByPage(hql, null, page, rows);
		Map<String,Object> jsonMap=new HashMap<String,Object>();
		
		jsonMap.put("rows", listoperator);
		jsonMap.put("total", operatorService.query(hql, null).size());
		
		return SUCCESS;
	}
	
	
}
