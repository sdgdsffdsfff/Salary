package com.salary.test;

import java.sql.Connection;
import java.sql.DriverManager;

public class SqlTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String dbURL="jdbc:sqlserver://192.168.247:49168;DatabaseName=A60032014";
		String userName="sa";
		String userPwd="sa123456";
		try{	Class.forName(driverName);
		System.out.println("加载驱动成功！");}
		catch(Exception e){	e.printStackTrace();
		System.out.println("加载驱动失败！");}
		try{
			Connection dbConn=DriverManager.getConnection(dbURL,userName,userPwd);
		System.out.println("连接数据库成功！");}
		catch(Exception e){	e.printStackTrace();
		System.out.print("SQL Server连接失败！");
		}
	}

}
