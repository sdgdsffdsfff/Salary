package com.salary.action;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.salary.entity.Account;
import com.salary.entity.Employee;
import com.salary.entity.Salary_item;
import com.salary.entity.Salary_item_expression;
import com.salary.entity.Salary_item_unit;
import com.salary.service.AccountService;
import com.salary.service.EmployeeService;
import com.salary.service.Salary_detailService;
import com.salary.service.Salary_itemService;
import com.salary.service.Salary_item_expressionService;
import com.salary.service.Salary_item_unitService;
import com.salary.util.SalaryUtils;

/**
 * 工资明细action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class SalarydetailAction extends ActionSupport {
	private Salary_detailService salary_detailService;
	private Salary_itemService salary_itemService;
	private AccountService accountService;
	private EmployeeService employeeService;
	private Salary_item_unitService salary_item_unitService;
	private Salary_item_expressionService salary_item_expressionService;
	private Integer account_id;						//奖金期间id
	private Integer id;								//奖金期间id
	private Integer emp_id;							//员工id
	private Salary_item salary_item;				//奖金项目
	private JSONObject jsonobj;						//json对象，传递给Easyui表格
	private Integer page;							//Easyui分页号
	private Integer rows;							//Easyui分页大小
	private String dynmaiccolumn;					//Easyui动态的数据列
	private Account account;						//奖金期间
	private String json_str;						//获取Easyui表格修改后保存的json数据
	
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
	
	public Salary_itemService getSalary_itemService() {
		return salary_itemService;
	}

	public void setSalary_itemService(Salary_itemService salary_itemService) {
		this.salary_itemService = salary_itemService;
	}

	public Salary_detailService getSalary_detailService() {
		return salary_detailService;
	}

	public void setSalary_detailService(Salary_detailService salary_detailService) {
		this.salary_detailService = salary_detailService;
	}
	
	public String getDynmaiccolumn() {
		return dynmaiccolumn;
	}

	public void setDynmaiccolumn(String dynmaiccolumn) {
		this.dynmaiccolumn = dynmaiccolumn;
	}
	
	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}
	
	public AccountService getAccountService() {
		return accountService;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
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
	
	public String getJson_str() {
		return json_str;
	}

	public void setJson_str(String json_str) {
		this.json_str = json_str;
	}

	/**
	 * 显示奖金明细页
	 * @return
	 */
	public String listSalarydetailPage(){
		String hql="From Salary_item where isdel=:isdel and isshow=:isshow";
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("isdel", 0);
		params.put("isshow", 1);
		
		List<Salary_item> listsalaryitem=salary_itemService.query(hql, params);
		
		StringBuffer dynmaicBuffer=new StringBuffer(5000);
		dynmaicBuffer.append("[[{field:'empid',title:'人员id'},{field:'empname',title:'姓名'},");
		dynmaicBuffer.append("{field:'code',title:'工号'},{field:'deptname',title:'部门名称'},");
		
		if(listsalaryitem!=null){
			for(Salary_item salaryitem:listsalaryitem){
				if(salaryitem.getIsedit()==1){
					dynmaicBuffer.append(
							"{field:\'"+salaryitem.getName()+
							"\',title:\'"+salaryitem.getName()+
							"\',editor:{type:\'numberbox\',options:{precision:1}}},");
				}else{
					dynmaicBuffer.append("{field:\'"+salaryitem.getName()+"\',title:\'"+salaryitem.getName()+"\',},");
				}
			}
		}
		
		hql="From Account where id="+account_id;
		account=accountService.get(hql, null);
		dynmaicBuffer.append("]]");
		dynmaiccolumn=dynmaicBuffer.toString();
		System.out.println("listSalarydetailPage:"+dynmaiccolumn);
		
		return SUCCESS;
	}
	
	/**
	 * 获取奖金明细json数据
	 * @return
	 */
	public String getSalarydetaillist(){
		
		salary_detailService.callprInitsalarydetail(account_id);
		
		String sql=salary_detailService.callfnGetsalarysql(account_id);
		List<Map<String,Object>> listsalarydetail=salary_detailService.queryNaviSql(sql, null);
		
		Map<String,Object> jsonMap=new HashMap<String,Object>();
		jsonMap.put("rows", listsalarydetail);
		jsonMap.put("total", listsalarydetail.size());
		jsonobj=JSONObject.fromObject(jsonMap);
		
		return SUCCESS;
	}
	
	
	/**
	 * 自动核算
	 * @return
	 */
	public String calcSalarydetail(){
		//第一步，取出人员的列表，关联上公式模板
		String hql="From Employee where isdel=0";
		List<Employee> listemployee=employeeService.query(hql, null);
		
		String exp_hql="From Salary_item_expression";
		List<Salary_item_expression> listsalaryitemexpression=salary_item_expressionService.query(exp_hql, null);
		Map<String,Salary_item_expression> expressionMap=new HashMap<String,Salary_item_expression>();
		
		for(Salary_item_expression salary_item_expression:listsalaryitemexpression){
			expressionMap.put(
					Integer.toString(salary_item_expression.getId()), 
					salary_item_expression);
		}
		
		
		/**
		 * 这段很要命，在计算的时候，霸占了所有的连接数
		 *
		 *
		for(Employee employee:listemployee){
			//第二步，读取该人员的公式模板
			String unit_hql="From Salary_item_unit where id="+employee.getSalary_item_unit_id();
			Salary_item_unit salary_item_unit=salary_item_unitService.get(unit_hql, null);
			String[] salary_item_expressionid=salary_item_unit.getSequence().split(",");
			//第三步，循环执行该计算公式
			for(String expressionid:salary_item_expressionid){
				Salary_item_expression salary_item_expression=expressionMap.get(expressionid);
				String hql_money=salary_item_expression.getDynmaicsql();
				hql_money=SalaryUtils.parseSQL(hql_money, account_id, employee.getId());
				BigDecimal money=(BigDecimal) salary_item_expressionService.queryNaviSql(hql_money, null).get(0).get("money");
				salary_detailService.callprSetsalarydetail(account_id, employee.getId(), salary_item_expression.getSalary_item_id(), money);
			}
		}
		*
		*
		*/
		
		/**
		 * 优化很要命的这段操作2015-01-12  20:53
		 */
		
		String unit_hql="From Salary_item_unit";
		List<Salary_item_unit> listsalary_item_unit=salary_item_unitService.query(unit_hql, null);
		Map<String,String> mapsalary_item_unit=new HashMap<String,String>();
		
		for(Salary_item_unit salary_item_unit:listsalary_item_unit){
			mapsalary_item_unit.put(Integer.toString(salary_item_unit.getId()), salary_item_unit.getSequence());
		}
		
		
		for(Employee employee:listemployee){
			//第二步，读取该人员的公式模板
			String[] salary_item_expressionid=mapsalary_item_unit.
					get(Integer.toString(employee.getSalary_item_unit_id())).split(",");
			//第三步，循环执行该计算公式
			for(String expressionid:salary_item_expressionid){
				Salary_item_expression salary_item_expression=expressionMap.get(expressionid);
				String hql_money=salary_item_expression.getDynmaicsql();
				hql_money=SalaryUtils.parseSQL(hql_money, account_id, employee.getId());
				BigDecimal money=(BigDecimal) salary_item_expressionService.queryNaviSql(hql_money, null).get(0).get("money");
				salary_detailService.callprSetsalarydetail(account_id, employee.getId(), salary_item_expression.getSalary_item_id(), money);
			}
		}
		
		/**
		 * 优化结束2015-01-12  20:53
		 */
		
		
		//第四部，显示计算好的页面
		hql="From Salary_item where isdel=:isdel and isshow=:isshow";
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("isdel", 0);
		params.put("isshow", 1);
		
		List<Salary_item> listsalaryitem=salary_itemService.query(hql, params);
		
		StringBuffer dynmaicBuffer=new StringBuffer(5000);
		dynmaicBuffer.append("[[{field:'empid',title:'人员id'},{field:'empname',title:'姓名'},");
		dynmaicBuffer.append("{field:'code',title:'工号'},{field:'deptname',title:'部门名称'},");
		
		if(listsalaryitem!=null){
			for(Salary_item salaryitem:listsalaryitem){
				if(salaryitem.getIsedit()==1){
					dynmaicBuffer.append(
							"{field:\'"+salaryitem.getName()+
							"\',title:\'"+salaryitem.getName()+
							"\',editor:{type:\'numberbox\',options:{precision:1}}},");
				}else{
					dynmaicBuffer.append("{field:\'"+salaryitem.getName()+"\',title:\'"+salaryitem.getName()+"\',},");
				}
			}
		}
		
		hql="From Account where id="+account_id;
		account=accountService.get(hql, null);
		dynmaicBuffer.append("]]");
		dynmaiccolumn=dynmaicBuffer.toString();
		
		System.out.println("calcSalarydetail:"+dynmaiccolumn);
		return SUCCESS;
	}
	
	
	/**
	 * 保存来自Easyui的Datagrid传递过来的json数据
	 * @return
	 */
	public String editSalarydetailFromDatagrid(){
		String hql="From Salary_item where isedit=1";
		if(json_str!=null && !json_str.isEmpty()){
			List<Salary_item> listsalary_item=salary_itemService.query(hql, null);
			List<Map<String,Object>> listmap=SalaryUtils.parseDatagridJson(json_str);
			
			for(Map<String,Object> jsonMap:listmap){
				if(jsonMap!=null && !jsonMap.isEmpty()){
					for(Salary_item salary_item:listsalary_item){
						if(jsonMap.containsKey(salary_item.getName())){
							salary_detailService.callprSetsalarydetail(
									account_id, 
									SalaryUtils.parseInteger(jsonMap.get("empid")), 
									salary_item.getId(), 
									SalaryUtils.parseBigDecimal(jsonMap.get(salary_item.getName())));
							System.out.println("key:"+salary_item.getName()+"   value:"+jsonMap.get(salary_item.getName()));
						}
					}
				}
			}
		}
		
		//显示奖金明细
		hql="From Salary_item where isdel=:isdel and isshow=:isshow";
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("isdel", 0);
		params.put("isshow", 1);
		
		List<Salary_item> listsalaryitem=salary_itemService.query(hql, params);
		
		StringBuffer dynmaicBuffer=new StringBuffer(5000);
		dynmaicBuffer.append("[[{field:'empid',title:'人员id'},{field:'empname',title:'姓名'},");
		dynmaicBuffer.append("{field:'code',title:'工号'},{field:'deptname',title:'部门名称'},");
		
		if(listsalaryitem!=null){
			for(Salary_item salaryitem:listsalaryitem){
				if(salaryitem.getIsedit()==1){
					dynmaicBuffer.append(
							"{field:\'"+salaryitem.getName()+
							"\',title:\'"+salaryitem.getName()+
							"\',editor:{type:\'numberbox\',options:{precision:1}}},");
				}else{
					dynmaicBuffer.append("{field:\'"+salaryitem.getName()+"\',title:\'"+salaryitem.getName()+"\',},");
				}
			}
		}
		
		System.out.println("editSalarydetailFromDatagrid->account_id:"+account_id);
		hql="From Account where id="+account_id;
		account=accountService.get(hql, null);
		dynmaicBuffer.append("]]");
		dynmaiccolumn=dynmaicBuffer.toString();
		System.out.println("editSalarydetailFromDatagrid:"+dynmaiccolumn);
		
		return SUCCESS;
	}
	
}
