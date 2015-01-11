package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.salary.entity.Account;
import com.salary.entity.Salary_item;
import com.salary.service.AccountService;

/**
 * 奖金期间action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class AccountAction extends ActionSupport {
	private AccountService accountService;
	private Integer account_id;						//奖金期间id
	private Integer id;								//奖金期间id
	private Account account;						//账户期间
	private Integer emp_id;							//员工id
	private Salary_item salary_item;				//奖金项目
	private JSONObject jsonobj;						//json对象，传递给Easyui表格
	private Integer page;							//Easyui分页号
	private Integer rows;							//Easyui分页大小
	private String daystart;						//日期开始
	private String dayend;							//日期结束
	
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
	
	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
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
	public AccountService getAccountService() {
		return accountService;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	
	public String getDaystart() {
		return daystart;
	}

	public void setDaystart(String daystart) {
		this.daystart = daystart;
	}
	public String getDayend() {
		return dayend;
	}

	public void setDayend(String dayend) {
		this.dayend = dayend;
	}

	/**
	 * 获取奖金期间列表json数据
	 * @return
	 */
	public String getAccountlist(){
		this.init();
		String hql="From Account";
		List<Account> listaccount=accountService.queryByPage(hql, null,page,rows);
		
		Map<String,Object> jsonMap=new HashMap<String,Object>();
		jsonMap.put("rows", listaccount);
		jsonMap.put("total", accountService.query(hql,null).size());
		jsonobj=new JSONObject();
		jsonobj=JSONObject.fromObject(jsonMap);
		
		return SUCCESS;
	}
	
	/**
	 * 显示奖金期间列表页
	 * @return
	 */
	public String listAccountPage(){
		return SUCCESS;
	}
	
	/**
	 * 增加奖金期间页面
	 * @return
	 */
	public String addAccountPage(){
		return SUCCESS;
	}
	
	/**
	 * 修改奖金期间页面
	 * @return
	 */
	public String editAccountPage(){
		String hql="From Account where id="+id;
		account=accountService.get(hql, null);
		daystart=account.getDaystart().toString();
		dayend=account.getDayend().toString();
		
		return SUCCESS;
	}
	
	/**
	 * 增加奖金期间
	 * @return
	 */
	public String addAccount(){
		accountService.add(account);
		return SUCCESS;
	}
	
	/**
	 * 删除奖金期间
	 * @return
	 */
	public String delAccount(){
		String hql="From Account where id="+id;
		account=accountService.get(hql, null);
		accountService.del(account);
		return SUCCESS;
	}
	
	/**
	 * 修改奖金期间
	 * @return
	 */
	public String editAccount(){
		accountService.edit(account);
		return SUCCESS;
	}
	
	
}
