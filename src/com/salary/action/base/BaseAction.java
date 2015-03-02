package com.salary.action.base;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 通用CRUDAction
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class BaseAction extends ActionSupport {
	
	public Integer page;							//Easyui分页号
	public Integer rows;							//Easyui分页大小
	public String errormessage;						//错误消息
	public JSONObject jsonobj;						//json对象，传递给Easyui表格
	
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

	public String getErrormessage() {
		return errormessage;
	}

	public void setErrormessage(String errormessage) {
		this.errormessage = errormessage;
	}

	public JSONObject getJsonobj() {
		return jsonobj;
	}

	public void setJsonobj(JSONObject jsonobj) {
		this.jsonobj = jsonobj;
	}

	/**
	 * 初始化分页
	 */
	public void init(){
		page=(page==null || page==0)?new Integer(1):page;
		rows=(rows==null || rows==0)?new Integer(10):rows;
	}
	
}
