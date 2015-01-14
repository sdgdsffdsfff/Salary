package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.salary.entity.Account;
import com.salary.entity.Salary_item;
import com.salary.service.AccountService;
import com.salary.service.Salary_detailService;
import com.salary.util.NumberUtils;

/**
 * 奖金期间action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class AccountAction extends ActionSupport {
	private Logger logger=Logger.getLogger(AccountAction.class);
	
	private AccountService accountService;
	private Salary_detailService salary_detailService;
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
	
	public Salary_detailService getSalary_detailService() {
		return salary_detailService;
	}

	public void setSalary_detailService(Salary_detailService salary_detailService) {
		this.salary_detailService = salary_detailService;
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
		try {
			String hql="From Account where id="+id;
			account=accountService.get(hql, null);
			daystart=account.getDaystart().toString();
			dayend=account.getDayend().toString();
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 增加奖金期间
	 * @return
	 */
	public String addAccount(){
		try {
			//先检测奖金期间表中是否有相同的奖金期间名称
			String sql="select count(1) as money from account where name=:name";
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("name", account.getName());
			Integer acc_count=NumberUtils.BigIntegerToInteger(accountService.queryNaviSql(sql, params).get(0).get("money"));
			if(acc_count>0){
				errormessage="添加奖金期间失败，已有相同名称的奖金期间...";
				return ERROR;
			}
			
			accountService.add(account);
			salary_detailService.initSalaryDetail(account);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 修改奖金期间
	 * @return
	 */
	public String editAccount(){
		try {
			//先读取原奖金期间的名称，如果与现在的名称不一致，则需要检测是否有重名的奖金期间
			String hql="From Account where id="+account.getId();
			Account tmpAccount=accountService.get(hql, null);
			if(!tmpAccount.getName().equals(account.getName())){
				//先检测奖金期间表中是否有相同的奖金期间名称
				String sql="select count(1) as money from account where name=:name";
				Map<String,Object> params=new HashMap<String,Object>();
				params.put("name", account.getName());
				Integer acc_count=NumberUtils.BigIntegerToInteger(accountService.queryNaviSql(sql, params).get(0).get("money"));
				if(acc_count>0){
					errormessage="修改奖金期间失败，已有相同名称的奖金期间...";
					return ERROR;
				}
			}
			
			accountService.edit(account);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 删除奖金期间
	 * @return
	 */
	public String delAccount(){
		try {
			//检测在奖金明细表中该奖金期间的金额合计是否为0(为0则视为没有任何数据)
			String sql="select ifnull(sum(money),0) as money from salary_detail where account_id="+id;
			float acc_money=0;
			
			acc_money=NumberUtils.BigDecimalToFloat(accountService.queryNaviSql(sql, null).get(0).get("money"));
			if(acc_money>0){
				errormessage="删除奖金期间失败，该期间存在数据信息...";
				return ERROR;
			}
			
			//删除奖金期间
			String hql="From Account where id="+id;
			account=accountService.get(hql, null);
			accountService.del(account);
			
			//删除奖金明细表数据
			String sql_del_salary_detail="delete from salary_detail where account_id="+id;
			accountService.executeSQL(sql_del_salary_detail);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
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
	 * 获取奖金期间列表json数据
	 * @return
	 */
	public String getAccountlist(){
		this.init();
		String hql="From Account order by daystart desc";
		List<Account> listaccount=accountService.queryByPage(hql, null,page,rows);
		
		Map<String,Object> jsonMap=new HashMap<String,Object>();
		jsonMap.put("rows", listaccount);
		jsonMap.put("total", accountService.query(hql,null).size());
		jsonobj=new JSONObject();
		jsonobj=JSONObject.fromObject(jsonMap);
		
		return SUCCESS;
	}
	
}
