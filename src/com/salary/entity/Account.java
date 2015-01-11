package com.salary.entity;

import java.util.Date;

/**
 * 工资期间
 * @author 陈捷
 *
 */
public class Account {
	private int id;			
	private String name;	//工资期间名称
	private Date daystart;	//开始日期
	private Date dayend;	//结束日期
	
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
	public Date getDaystart() {
		return daystart;
	}
	public void setDaystart(Date daystart) {
		this.daystart = daystart;
	}
	public Date getDayend() {
		return dayend;
	}
	public void setDayend(Date dayend) {
		this.dayend = dayend;
	}
	
	
}
