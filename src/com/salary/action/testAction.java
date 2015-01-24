package com.salary.action;

import java.util.List;
import java.util.Map;
import net.sf.json.JSONObject;
import com.opensymphony.xwork2.ActionSupport;
import com.salary.dao.CRUDDaoImpl;

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
	private String errormessage;					//错误消息
	
	public String getErrormessage() {
		return errormessage;
	}

	public void setErrormessage(String errormessage) {
		this.errormessage = errormessage;
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


}
