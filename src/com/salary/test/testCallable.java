package com.salary.test;

import junit.framework.Assert;

import org.junit.Test;

import com.salary.util.SalaryUtils;

public class testCallable {
	
	@Test
	public void testCall(){
		
	}
	
	@Test
	public void testSalaryUtilsparseSQL(){
		String sql="fnGetDepartmentMoney(:account_id,:emp_id,2)*fnGetSalaryMoney(:account_id,:emp_id,1)/fnGetItemMoney(:account_id,2)";
		int account_id=1;
		int emp_id=2;
		sql=SalaryUtils.parseSQL(sql, account_id, emp_id);
		String result="select fnaccount_id(1,2) from emp_id";
		
		System.out.println(sql);
		Assert.assertEquals(sql, result);
	}
}
