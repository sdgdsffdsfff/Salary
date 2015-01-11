package com.salary.entity;

/**
 * 工资项目表
 * @author 陈捷
 *
 */
public class Salary_item {
	private int id;			//
	private String name;	//工资项目名称
	private int level;		//是否公式计算,0为默认不计算,1为需要公式计算
	private int isdel;		//是否删除，0未删除，1已删除
	private int isshow;		//是否显示
	private int isedit;		//是否可以编辑，0不可编辑，1可以编辑
	
	public int getIsshow() {
		return isshow;
	}
	public void setIsshow(int isshow) {
		this.isshow = isshow;
	}
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
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getIsdel() {
		return isdel;
	}
	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}
	public int getIsedit() {
		return isedit;
	}
	public void setIsedit(int isedit) {
		this.isedit = isedit;
	}
	
	
}
