package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.salary.entity.Salary_item;
import com.salary.entity.Salary_item_expression;
import com.salary.entity.Salary_item_unit;
import com.salary.service.Salary_itemService;
import com.salary.service.Salary_item_expressionService;
import com.salary.service.Salary_item_unitService;

/**
 * 奖金项目公式
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class SalaryitemexpressionAction extends ActionSupport{
	private Logger logger=Logger.getLogger(SalaryitemexpressionAction.class);
	
	private Salary_item_expressionService salary_item_expressionService;
	private Salary_itemService salary_itemService;
	private Salary_item_unitService salary_item_unitService;
	private Salary_item_expression salary_item_expression;	//奖金项目公式
	private Integer id;										//奖金项目公式id
	private Integer account_id;								//奖金期间id
	private Integer emp_id;									//员工id
	private Salary_item salary_item;						//奖金项目
	private List<Salary_item> listsalary_item;				//奖金项目列表
	private List<Salary_item> listsalary_item2;				//奖金项目列表2
	private JSONObject jsonobj;								//json对象，传递给Easyui表格
	private Integer page;									//Easyui分页号
	private Integer rows;									//Easyui分页大小
	private String errormessage;							//错误信息
	
	/**
	 * 初始化分页
	 */
	public void init(){
		page=(page==null || page==0)?new Integer(1):page;
		rows=(rows==null || rows==0)?new Integer(10):rows;
	}
	
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Salary_item_expression getSalary_item_expression() {
		return salary_item_expression;
	}

	public void setSalary_item_expression(
			Salary_item_expression salary_item_expression) {
		this.salary_item_expression = salary_item_expression;
	}

	public Salary_itemService getSalary_itemService() {
		return salary_itemService;
	}

	public void setSalary_itemService(Salary_itemService salary_itemService) {
		this.salary_itemService = salary_itemService;
	}

	public List<Salary_item> getListsalary_item() {
		return listsalary_item;
	}

	public void setListsalary_item(List<Salary_item> listsalary_item) {
		this.listsalary_item = listsalary_item;
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
	
	public List<Salary_item> getListsalary_item2() {
		return listsalary_item2;
	}

	public void setListsalary_item2(List<Salary_item> listsalary_item2) {
		this.listsalary_item2 = listsalary_item2;
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
	public Salary_item_expressionService getSalary_item_expressionService() {
		return salary_item_expressionService;
	}

	public void setSalary_item_expressionService(
			Salary_item_expressionService salary_item_expressionService) {
		this.salary_item_expressionService = salary_item_expressionService;
	}
	
	public Salary_item_unitService getSalary_item_unitService() {
		return salary_item_unitService;
	}

	public void setSalary_item_unitService(
			Salary_item_unitService salary_item_unitService) {
		this.salary_item_unitService = salary_item_unitService;
	}
	
	public String getErrormessage() {
		return errormessage;
	}

	public void setErrormessage(String errormessage) {
		this.errormessage = errormessage;
	}

	/**
	 * 添加奖金公式页面
	 * @return
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
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 修改奖金页面
	 * @return
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
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	
	/**
	 * 添加奖金公式
	 * @return
	 */
	public String addSalaryitemexpression(){
		try {
			salary_item_expressionService.add(salary_item_expression);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 修改奖金公式
	 * @return
	 */
	public String editSalaryitemexpression(){
		try {
			salary_item_expressionService.edit(salary_item_expression);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 删除奖金公式
	 * @return
	 */
	public String delSalaryitemexpression(){
		try {
			//先查询出奖金模板的计算序列，查看是否含有此id号
			String hql_unit="From Salary_item_unit";
			List<Salary_item_unit> listsalary_item_unit=salary_item_unitService.query(hql_unit, null);
			StringBuffer unitBuffer=new StringBuffer(200);
			for(Salary_item_unit salary_item_unit:listsalary_item_unit){
				unitBuffer.append(salary_item_unit.getSequence());
			}
			
			//检测是否存在此id
			String[] sequence=unitBuffer.toString().split(",");
			for(String str_seq:sequence){
				if(Integer.parseInt(str_seq)==id){
					errormessage="删除奖金公式失败，该奖金公式已在使用中!";
					return ERROR;
				}
			}
			
			//删除奖金项目公式
			String hql="From Salary_item_expression where id="+id;
			salary_item_expression=salary_item_expressionService.get(hql, null);
			salary_item_expressionService.del(salary_item_expression);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	
	/**
	 * 显示奖金公式页面
	 * @return
	 */
	public String listSalaryitemexpressionPage(){
		return SUCCESS;
	}
	
	/**
	 * 获取奖金公式列表json数据
	 * @return
	 */
	public String getSalaryitemexpressionlist(){
		this.init();
		String hql="From Salary_item_expression";
		Map<String,Object> params=new HashMap<String,Object>();
		List<Salary_item_expression> listSalaryitemexpression=
				salary_item_expressionService.queryByPage(hql, params, page, rows);
		
		Map<String,Object> jsonMap=new HashMap<String,Object>();
		jsonMap.put("rows", listSalaryitemexpression);
		jsonMap.put("total", salary_item_expressionService.query(hql, params).size());
		
		jsonobj=new JSONObject();
		jsonobj=JSONObject.fromObject(jsonMap);
		
		return SUCCESS;
	}
	
}
