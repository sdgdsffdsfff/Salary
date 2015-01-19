package com.salary.test;

import java.util.Date;

import junit.framework.Assert;

import org.junit.Test;

import com.salary.util.MD5Util;
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
	
	/**
	 * 
	 * @return
	 */
	public static double randMoney(String emp_code,Date daystart,Date dayend){
		return Math.random();
	}
	
	@Test
	public void testRandmoney(){
		Date dt=new Date();
		System.out.println(testCallable.randMoney("1",dt,dt));
	}
	
	@Test
	public void testMd5(){
		System.out.println(MD5Util.MD5("admin"));
	}
	
	public static String parseDynmaicsqlToSalaryItemID(String dynmaicsql,String search_str){
		StringBuffer strBuffer=new StringBuffer(1000);
		String[] sparr=dynmaicsql.split(search_str);
		int index=0;
		for(String sp:sparr){
			System.out.println("sp:"+sp);
			index=sp.indexOf(")");
			if(index==-1){
				index=0;
			}
			
			String substr=new String(sp.substring(0, index));
			if(substr!=null && substr.length()>0){
				strBuffer.append(substr+",");
			}
		}
		
		return strBuffer.toString();
	}
	
	@SuppressWarnings("static-access")
	@Test
	public void testCut(){
		String str="fnGetSalaryMoney(:account_id,:emp_id,2)*0.2*fnGetDepartmentMoney(:account_id,:emp_id,2)/fnGetItemMoney(:account_id,:emp_id,2)";
		this.parseDynmaicsqlToSalaryItemID(str,":account_id,:emp_id,");
	}
	
}
