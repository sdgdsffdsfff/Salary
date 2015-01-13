package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.salary.dao.CRUDDaoImpl;
import com.salary.util.SalaryUtils;

/**
 * 测试Action
 * 
 * @author 陈捷
 * 
 */
@SuppressWarnings("serial")
public class testAction extends ActionSupport {
	private Integer id;
	private Integer account_id;
	private Integer emp_id;
	private Integer salary_item_id;
	private float money;
	private List<Map<String,Object>> listmap;
	private JSONObject jsonobj;
	private String str;
	
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

	public Integer getSalary_item_id() {
		return salary_item_id;
	}

	public void setSalary_item_id(Integer salary_item_id) {
		this.salary_item_id = salary_item_id;
	}

	public float getMoney() {
		return money;
	}

	public void setMoney(float money) {
		this.money = money;
	}

	public JSONObject getJsonobj() {
		return jsonobj;
	}

	public void setJsonobj(JSONObject jsonobj) {
		this.jsonobj = jsonobj;
	}


	@SuppressWarnings("rawtypes")
	private CRUDDaoImpl crudDaoimpl;

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@SuppressWarnings("rawtypes")
	public CRUDDaoImpl getCrudDaoimpl() {
		return crudDaoimpl;
	}

	public void setCrudDaoimpl(@SuppressWarnings("rawtypes") CRUDDaoImpl crudDaoimpl) {
		this.crudDaoimpl = crudDaoimpl;
	}
	
	public List<Map<String, Object>> getListmap() {
		return listmap;
	}
	
	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}

	public void setListmap(List<Map<String, Object>> listmap) {
		this.listmap = listmap;
	}

	/**
	 * 测试调用callprInitsalarydetail 根据账套id来初始化本月的工资项目明细
	 * 
	 * @return
	 */
	public String callprInitsalarydetail() {
		System.out.println("testAction --> callprInitsalarydetail: " + id);
		try {
			crudDaoimpl.callprInitsalarydetail(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 设置员工工资项目金额
	 * select fnGetsalarydetail(1,1,1)*100/fnGetdepartmentmoney(1,1,1) as money
	 * @return
	 */
	public String callprSetsalarydetail(){
//		System.out.println("testAction --> callprSetsalarydetail: ");
//		try {
//			crudDaoimpl.callprSetsalarydetail(account_id,emp_id,salary_item_id,money);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		return SUCCESS;
	}
	
	/**
	 * 测试动态sql语句执行结果
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String testDynmaicsql(){
		try {
			String sql="select dynmaicsql from salary_item_expression where id=:id";
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("id", id);
			List<Map<String,String>> salary_item_expression=crudDaoimpl.queryNaviSql(sql,params);
			
			String dynmaicsql = salary_item_expression.get(0).get("dynmaicsql");
			System.out.println(dynmaicsql);
			
			System.out.println(crudDaoimpl.getSalarydetailmoney(dynmaicsql));
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ERROR;
	}
	
	
	/**
	 * 测试奖金查询语句
	 */
	@SuppressWarnings("unchecked")
	public String callfnGetsalarysql(){
		try {
			String dynmaicsql=crudDaoimpl.callfnGetsalarysql(id);
			System.out.println(dynmaicsql);
			
			List<Map<String,Object>> list=crudDaoimpl.queryNaviSql(dynmaicsql, null);
			
			System.out.println(list.size());
			
			StringBuffer sbf=new StringBuffer(500000);
			
			for(Map<String,Object> map:list){
				if(map!=null && !map.isEmpty()){
					for(String key:map.keySet()){
						sbf.append(key+":"+map.get(key)+"  ");
					}
				}
				sbf.append("\r\n");
			}
			
			System.out.println(sbf.toString());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	/**
	 * 测试Easyui表格传递的东东 
	 * @return
	 */
	public String testDatagridsend(){
		if(str!=null){
			System.out.println("testDatagridsend->"+str);
			listmap=SalaryUtils.parseDatagridJson(str);
			for(Map<String,Object> jsonMap:listmap){
				for(String key:jsonMap.keySet()){
					System.out.println("testDatagridsend->json_key:"+key+"         json_value:"+jsonMap.get(key));
				}
			}
		}else{
			System.out.println("testDatagridsend -->nothing");
		}
		return SUCCESS;
	}
}
