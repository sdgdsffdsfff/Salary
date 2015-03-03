package com.salary.spring.aop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aspectj.lang.ProceedingJoinPoint;

import com.salary.entity.Department;
import com.salary.entity.Salary_item_expression;
import com.salary.entity.Salary_item_unit;
import com.salary.service.DepartmentService;
import com.salary.service.impl.DepartmentServiceImpl;
import com.salary.service.impl.Salary_item_expressionServiceImpl;
import com.salary.service.impl.Salary_item_unitServiceImpl;
import com.salary.util.NumberUtils;

@SuppressWarnings("unused")
public class AopSalaryitemexpression {
	private Salary_item_expressionServiceImpl salary_item_expressionService;
	private Salary_item_unitServiceImpl salary_item_unitService;
	public Salary_item_expressionServiceImpl getSalary_item_expressionService() {
		return salary_item_expressionService;
	}
	public void setSalary_item_expressionService(
			Salary_item_expressionServiceImpl salary_item_expressionService) {
		this.salary_item_expressionService = salary_item_expressionService;
	}
	public Salary_item_unitServiceImpl getSalary_item_unitService() {
		return salary_item_unitService;
	}
	public void setSalary_item_unitService(
			Salary_item_unitServiceImpl salary_item_unitService) {
		this.salary_item_unitService = salary_item_unitService;
	}
	
	/**
	 * 奖金项目公式添加检测
	 * @param proceedingJoinPoint
	 * @throws Throwable 
	 */
	private void addCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		Salary_item_expression salary_item_expression=
				(Salary_item_expression) proceedingJoinPoint.getArgs()[0];
		
		System.out.println("addCheck执行了奖金项目公式检测...");
		//检测奖金公式表中是否有同名的奖金公式名称
		String sql="select 1 from salary_item_expression where name=:name";
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("name", salary_item_expression.getName());
		int sal_count=salary_item_expressionService.getRowCountBySql(sql, params);
		
		if(sal_count>0){
			throw new Throwable();
		}
		
		
		proceedingJoinPoint.proceed();
	}
	
	
	/**
	 * 奖金项目公式修改检测
	 * @param proceedingJoinPoint
	 * @throws Throwable 
	 */
	private void editCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		Salary_item_expression salary_item_expression=
				(Salary_item_expression) proceedingJoinPoint.getArgs()[0];
		
		System.out.println("editCheck执行了奖金项目公式检测...");
		//先检测是否和原先的公式名称相同，不相同则需要检测是否有重名的奖金项目名称
		Salary_item_expression tmpExp=salary_item_expressionService.getEntityById(salary_item_expression.getId(), "Salary_item_expression");
		
		if(!tmpExp.getName().equals(salary_item_expression.getName())){
			//检测奖金公式表中是否有同名的奖金公式名称
			String sql="select 1 from salary_item_expression where name=:name";
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("name", salary_item_expression.getName());
			int sal_count=salary_item_expressionService.getRowCountBySql(sql, params);
			
			if(sal_count>0){
				throw new Throwable();	
			}
		}
		
		proceedingJoinPoint.proceed();
	}
	
	
	/**
	 * 奖金项目公式删除检测
	 * @param proceedingJoinPoint
	 * @throws Throwable 
	 */
	private void delCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		Salary_item_expression salary_item_expression=
				(Salary_item_expression) proceedingJoinPoint.getArgs()[0];
		
		System.out.println("delCheck执行了奖金项目公式检测...");
		//先查询出奖金模板的计算序列，查看是否含有此id号
		String hql_unit="From Salary_item_unit";
		List<Salary_item_unit> listsalary_item_unit=salary_item_unitService.query(hql_unit, null);
		
		if(listsalary_item_unit!=null && listsalary_item_unit.size()>0){
			StringBuffer unitBuffer=new StringBuffer(200);
			for(Salary_item_unit salary_item_unit:listsalary_item_unit){
				unitBuffer.append(salary_item_unit.getSequence());
			}
			
			//检测是否存在此id
			String[] sequence=unitBuffer.toString().split(",");
			for(String str_seq:sequence){
				if(Integer.parseInt(str_seq)==salary_item_expression.getId()){
					throw new Throwable();
				}
			}
		}
		
		proceedingJoinPoint.proceed();
	}
	
	
}
