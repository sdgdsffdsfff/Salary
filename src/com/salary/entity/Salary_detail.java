package com.salary.entity;

/**
 * 奖金明细表
 * @author 陈捷
 *
 */
public class Salary_detail {
	private int id;				//
	private int account_id;		//工资期间id
	private int emp_id;			//员工id
	private int salary_item_id;	//工资项目id
	private float money;		//金额
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public int getSalary_item_id() {
		return salary_item_id;
	}
	public void setSalary_item_id(int salary_item_id) {
		this.salary_item_id = salary_item_id;
	}
	public float getMoney() {
		return money;
	}
	public void setMoney(float money) {
		this.money = money;
	}
	
	
}
