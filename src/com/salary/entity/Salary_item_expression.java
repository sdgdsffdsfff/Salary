package com.salary.entity;

/**
 * 工资项目动态SQL公式
 * @author 陈捷
 *
 */
public class Salary_item_expression {
	private int id;				//
	private int salary_item_id;	//工资项目id(用公式来改变该项目id金额)
	private String name;		//公式名称
	private String dynmaicsql;	//动态SQL语句
	private String comment;		//公式说明
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSalary_item_id() {
		return salary_item_id;
	}
	public void setSalary_item_id(int salary_item_id) {
		this.salary_item_id = salary_item_id;
	}
	public String getDynmaicsql() {
		return dynmaicsql;
	}
	public void setDynmaicsql(String dynmaicsql) {
		this.dynmaicsql = dynmaicsql;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
}
