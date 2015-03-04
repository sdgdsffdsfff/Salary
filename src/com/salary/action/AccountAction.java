package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.salary.action.base.BaseAction;
import com.salary.entity.Account;
import com.salary.service.AccountService;
import com.salary.service.Salary_detailService;

/**
 * 奖金期间action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class AccountAction extends BaseAction {
	private AccountService accountService;
	private Salary_detailService salary_detailService;
	private Integer id;								//奖金期间id
	private Account account;						//账户期间
	private String daystart;						//日期开始
	private String dayend;							//日期结束
	
	public AccountService getAccountService() {
		return accountService;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
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
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addAccountPage(){
		return SUCCESS;
	}
	
	/**
	 * 修改奖金期间页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editAccountPage(){
		account=accountService.getEntityById(id, "Account");
		daystart=account.getDaystart().toString();
		dayend=account.getDayend().toString();
		
		return SUCCESS;
	}
	
	/**
	 * 增加奖金期间
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addAccount(){
		try {
			accountService.add(account);
			salary_detailService.initSalaryDetail(account);
		} catch (Exception e) {
			errormessage="已有相同的奖金期间名称，请检查...";
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 修改奖金期间
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editAccount(){
		try {
			accountService.edit(account);
		} catch (Exception e) {
			errormessage="已有相同的奖金期间名称，请检查...";
			e.printStackTrace();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 删除奖金期间
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String delAccount(){
		try {
			//删除奖金期间
			account=accountService.getEntityById(id, "Account");
			accountService.del(account);
		} catch (Exception e) {
			errormessage="删除奖金期间失败，该期间有奖金数据...";
			e.printStackTrace();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 显示奖金期间列表页
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String listAccountPage(){
		return SUCCESS;
	}
	
	/**
	 * 获取奖金期间列表json数据
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String getAccountlist(){
		this.init();
		String hql="From Account order by daystart desc";
		try {
			List<Account> listaccount=accountService.queryByPage(hql, null,page,rows);
			
			Map<String,Object> jsonMap=new HashMap<String,Object>();
			jsonMap.put("rows", listaccount);
			jsonMap.put("total", accountService.getRowCountByHql(hql, null));
			jsonobj=new JSONObject();
			jsonobj=JSONObject.fromObject(jsonMap);
		} catch (Exception e) {
			errormessage="读取奖金期间列表失败...";
			e.printStackTrace();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 清除所有奖金期间
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String cleanAllAccount(){
		String sql_del_salary_detail="truncate table salary_detail";
		String sql_del_account="delete from account";
		
		try {
			accountService.executeSQL(sql_del_salary_detail);
			accountService.executeSQL(sql_del_account);
		} catch (Exception e) {
			errormessage="清除所有奖金期间失败...";
			e.printStackTrace();
			return ERROR;
		}
		
		return SUCCESS;
	}
}
