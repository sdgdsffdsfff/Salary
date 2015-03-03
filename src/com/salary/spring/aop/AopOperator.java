package com.salary.spring.aop;

import java.util.HashMap;
import java.util.Map;

import org.aspectj.lang.ProceedingJoinPoint;

import com.salary.entity.Operator;
import com.salary.service.impl.OperatorServiceImpl;

/**
 * 操作员检测
 * @author 陈捷
 *
 */
@SuppressWarnings("unused")
public class AopOperator {
	private OperatorServiceImpl operatorService;
	public OperatorServiceImpl getOperatorService() {
		return operatorService;
	}
	public void setOperatorService(OperatorServiceImpl operatorService) {
		this.operatorService = operatorService;
	}


	/**
	 * 添加操作员检测
	 * @throws Throwable
	 */
	private void addCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		Operator operator=(Operator) proceedingJoinPoint.getArgs()[0];
		System.out.println("addCheck执行了职员检测...");
		//先判断该操作员的名称在表中是否存在，如果存在，则页面抛出错误信息
		String sql="select 1 from operator where name=:name";
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("name", operator.getName());
		int op_count=operatorService.getRowCountBySql(sql, params);
		
		if(op_count>0){
			throw new Throwable();
		}
		
		proceedingJoinPoint.proceed();
	}
	
	
	/**
	 * 修改操作员检测
	 * @throws Throwable
	 */
	private void editCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		Operator operator=(Operator) proceedingJoinPoint.getArgs()[0];
		System.out.println("editCheck执行了职员检测...");
		//首先判断角色的名称是否和原来一样，如果和原来不一样，则需要检测表中是否有重名的数据
		Operator tmpOperator=operatorService.getEntityById(operator.getId(), "Operator");
		if(!tmpOperator.getName().equals(operator.getName())){
			//判断该操作员的名称在表中是否存在，如果存在，则页面抛出错误信息
			String sql="select 1 from operator where name=:name";
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("name", operator.getName());
			int op_count=operatorService.getRowCountBySql(sql, params);
			
			if(op_count>0){
				throw new Throwable();
			}
		}
		
		proceedingJoinPoint.proceed();
	}
	
	
	/**
	 * 删除操作员检测
	 * @throws Throwable
	 */
	private void delCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		Operator operator=(Operator) proceedingJoinPoint.getArgs()[0];
		System.out.println("delCheck执行了职员检测...");
		
		if(operator.getId()==1){
			throw new Throwable();
		}
		
		proceedingJoinPoint.proceed();
	}
	
	
}
