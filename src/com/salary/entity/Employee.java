package com.salary.entity;

/**
 * 职员表
 * @author 陈捷
 *
 */
public class Employee {
	private int id;				
	private String code;			//员工编号
	private String name;			//员工姓名
	private int department_id;		//部门id
	private int level;				//员工级别，0为默认普通员工，1为主管，2为经理
	private int salary_item_unit_id;//工资项目组件id,用来关联用户的计算公式
	private int isdel;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getSalary_item_unit_id() {
		return salary_item_unit_id;
	}
	public void setSalary_item_unit_id(int salary_item_unit_id) {
		this.salary_item_unit_id = salary_item_unit_id;
	}
	public int getIsdel() {
		return isdel;
	}
	public void setIsdel(int isdel) {
		this.isdel = isdel;
	}				//是否删除，0为未删除，1为已删除
	
}
