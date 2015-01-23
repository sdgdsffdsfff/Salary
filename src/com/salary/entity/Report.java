package com.salary.entity;

/**
 * 自定义报表
 * @author 陈捷
 *
 */
public class Report {
	private int id;				//自定义报表id
	private String name;		//自定义报表名称
	private String dynmaicsql;	//动态sql语句
	private String fields;		//字段列表，用逗号隔开
	private String titles;		//标题列表，用逗号隔开
	private String widths;		//宽度列表，用逗号隔开
	private int source;			//数据源:0  奖金系统,1  CRM系统,2  A6系统
	
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
	public String getDynmaicsql() {
		return dynmaicsql;
	}
	public void setDynmaicsql(String dynmaicsql) {
		this.dynmaicsql = dynmaicsql;
	}
	public String getFields() {
		return fields;
	}
	public void setFields(String fields) {
		this.fields = fields;
	}
	public String getTitles() {
		return titles;
	}
	public void setTitles(String titles) {
		this.titles = titles;
	}
	public String getWidths() {
		return widths;
	}
	public void setWidths(String widths) {
		this.widths = widths;
	}
	public int getSource() {
		return source;
	}
	public void setSource(int source) {
		this.source = source;
	}
}
