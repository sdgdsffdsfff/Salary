package com.salary.entity;

/**
 * 工资项目组件表
 * @author 陈捷
 *
 */
public class Salary_item_unit {
	private int id;				//
	private String name;		//组件名称
	private String sequence;	//组件执行顺序,用salary_item_express的id来排列
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSequence() {
		return sequence;
	}
	public void setSequence(String sequence) {
		this.sequence = sequence;
	}
	
	
}
