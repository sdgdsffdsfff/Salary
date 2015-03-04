package com.salary.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.salary.dao.CRUDDaoHibernate3Impl;
import com.salary.entity.Account;
import com.salary.entity.Employee;
import com.salary.entity.Salary_detail;
import com.salary.entity.Salary_item;
import com.salary.service.Salary_detailService;
import com.salary.service.Salary_itemService;
import com.salary.sync.a6.A6Service;
import com.salary.sync.crm.CRMService;
import com.salary.util.DateUtils;
import com.salary.util.NumberUtils;

/**
 * 奖金明细service
 * @author 陈捷
 *
 */
public class Salary_detailServiceImpl extends CRUDDaoHibernate3Impl<Salary_detail> implements Salary_detailService {
	private Salary_itemService salary_itemService;
	private A6Service a6Service;
	private CRMService crmService;
	
	public Salary_itemService getSalary_itemService() {
		return salary_itemService;
	}

	public void setSalary_itemService(Salary_itemService salary_itemService) {
		this.salary_itemService = salary_itemService;
	}

	public A6Service getA6Service() {
		return a6Service;
	}

	public void setA6Service(A6Service a6Service) {
		this.a6Service = a6Service;
	}

	public CRMService getCrmService() {
		return crmService;
	}

	public void setCrmService(CRMService crmService) {
		this.crmService = crmService;
	}

	/**
	 * 设置奖金明细金额
	 * @param account_id		奖金期间
	 * @param emp_id			员工id
	 * @param salary_item_id	奖金项目id
	 * @param money				金额
	 */
	public void setSalaryDetail(int account_id, int emp_id, int salary_item_id, BigDecimal money){
		this.callprSetsalarydetail(account_id, emp_id, salary_item_id, money);
	}
	
	/**
	 * 初始化奖金明细，读取接口来设置得到的金额
	 * 
	 * @param account 		奖金期间
	 */
	public void initSalaryDetail(Account account){
		//注意:由于需要调用公司内部数据，因此以下代码是手工写死的
		
		
		//首先初始化本期间奖金信息,奖金期间信息
		this.callprInitsalarydetail(account.getId());
		Salary_detail salary_detail=new Salary_detail();
		salary_detail.setAccount_id(account.getId());
		
		List<Map<String,Object>> listSalarydetail=new ArrayList<Map<String,Object>>();
		//初始化日期参数
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("daystart", DateUtils.formatDate(account.getDaystart()));
		params.put("dayend", DateUtils.formatDate(account.getDayend()));
		
		
		//用来读取A6数据的信息并进行动态设置
		String a6sql="select DYNMAICSQL,COMMENT,SALARY_ITEM_ID from a6_sql where SALARY_ITEM_ID!=0";
		List<Map<String,Object>> lista6sql=this.queryNaviSql(a6sql, null);
		listSalarydetail=new ArrayList<Map<String,Object>>();
		
		if(lista6sql!=null && !lista6sql.isEmpty()){
			for(Map<String,Object> a6sqlMap:lista6sql){
				
				listSalarydetail=a6Service.queryNaviSql(a6sqlMap.get("DYNMAICSQL").toString(), params);
				if(listSalarydetail!=null && !listSalarydetail.isEmpty()){
					System.out.println(a6sqlMap.get("COMMENT")+":"+listSalarydetail.size());
					salary_detail.setSalary_item_id(Integer.parseInt(a6sqlMap.get("SALARY_ITEM_ID").toString()));
					this.setSalarydetailFromA6Map(salary_detail,listSalarydetail);
				}
			}
		}
		

		//用来读取CRM的数据信息
		String crmsql="select DYNMAICSQL,COMMENT,SALARY_ITEM_ID from crm_sql";
		List<Map<String,Object>> listcrmsql=this.queryNaviSql(crmsql, null);
		listSalarydetail=new ArrayList<Map<String,Object>>();
		
		if(listcrmsql!=null && !listcrmsql.isEmpty()){
			for(Map<String,Object> crmsqlMap:listcrmsql){
				listSalarydetail=crmService.queryNaviSql(crmsqlMap.get("DYNMAICSQL").toString(), params);
				if(listSalarydetail!=null && !listSalarydetail.isEmpty()){
					System.out.println(crmsqlMap.get("COMMENT")+":"+listSalarydetail.size());
					salary_detail.setSalary_item_id(Integer.parseInt(crmsqlMap.get("SALARY_ITEM_ID").toString()));
					this.setSalarydetailFromCRMMap(salary_detail, listSalarydetail);
				}
			}
		}
		
		
		
	}
	
	
	/**
	 * 获取动态的奖金项目明细表sql语句
	 * @param account_id	奖金期间id
	 * @return				奖金项目明细表sql语句
	 */
	public String GetfnGetsalarysql(int account_id,Employee employee){
		
		//存储外层sql
		StringBuffer sqlBuffer=new StringBuffer(1000);
		sqlBuffer.append("select emp.id as empid,emp.name as empname,emp.code,dept.name as deptname,");
		
		//存储内层sql
		StringBuffer sqlBuffer2=new StringBuffer(1000);
		sqlBuffer2.append("select emp_id,");
		
		
		
		//首先要读取出奖金项目的列表
		String hql_salary_item="From Salary_item";
		List<Salary_item> listsalary_item=salary_itemService.query(hql_salary_item, null);
		
		//循环读取奖金项目名称
		for(Salary_item salary_item:listsalary_item){
			sqlBuffer2.append(" case salary_item_id  when "+salary_item.getId()+" then money else 0 end as field"+salary_item.getId()+",");
			sqlBuffer.append(" sum(field"+salary_item.getId()+") as "+salary_item.getName()+",");
		}
		
		sqlBuffer.deleteCharAt(sqlBuffer.lastIndexOf(","));
		sqlBuffer2.deleteCharAt(sqlBuffer2.lastIndexOf(","));
		
		sqlBuffer.append(" from (");
		sqlBuffer2.append(" from salary_detail where account_id=:account_id ) sal left join employee emp on emp.id=sal.emp_id ");
		sqlBuffer2.append(" left join department dept on emp.department_id=dept.id ");
		
		//如果session域里面有读取到用户的信息，则说明不是超级管理员，需要进行部门或人员的过滤
		if(employee!=null){
			//如果该人员的等级为2，则可以看到该部门下的奖金明细信息
			if(employee.getLevel()==1){
				sqlBuffer2.append(" where dept.id="+employee.getDepartment_id());
			}
			//如果该人员的等级为0，则只能看到自己的奖金明细信息
			if(employee.getLevel()==0){
				sqlBuffer2.append(" where emp.id="+employee.getId());
			}
			
			System.out.println("GetfnGetsalarysql:employee is "+employee.getName());
		}else{
			System.out.println("GetfnGetsalarysql:employee is null");
		}
		sqlBuffer2.append(" group by emp.name,emp.code,dept.name ");
		sqlBuffer2.append(" order by deptname,empname ");
		
		sqlBuffer.append(sqlBuffer2);
		
		return sqlBuffer.toString();
	}
	
	
	
	/**
	 * 根据CRM数据库查询出来的信息来写入到账期数据中  
	 * @param salary_detail			需要传入account_id,salary_item_id
	 * @param listSalarydetail		List<Map<EMP_CODE:员工编号,MONEY:金额>>
	 */
	public void setSalarydetailFromCRMMap(Salary_detail salary_detail,List<Map<String,Object>> listSalarydetail){
		
		System.out.println("setSalarydetailFromCRMMap-->account_id:"+salary_detail.getAccount_id()+
							"    salary_item_id:"+salary_detail.getSalary_item_id());
		for(Map<String,Object> mapSalary:listSalarydetail){
			System.out.println("setSalarydetailFromCRMMap-->for loop:"+
						mapSalary.get("EMP_CODE").toString()+"    MONEY:"+mapSalary.get("MONEY"));
			this.callprSetsalarydetailByEmpCode(
					salary_detail.getAccount_id(), 
					mapSalary.get("EMP_CODE").toString(), 
					salary_detail.getSalary_item_id(), 
					NumberUtils.ObjectToBigDecimal(mapSalary.get("MONEY")));
		}
	}
	
	
	/**
	 * 根据A6数据库查询出来的信息来写入到账期数据中
	 * @param salary_detail			需要传入account_id,salary_item_id
	 * @param listSalarydetail		List<Map<EMP_CODE:员工编号,MONEY:金额>>
	 */
	public void setSalarydetailFromA6Map(Salary_detail salary_detail,List<Map<String,Object>> listSalarydetail){
		
		System.out.println("setSalarydetailFromA6Map-->account_id:"+salary_detail.getAccount_id()+
							"    salary_item_id:"+salary_detail.getSalary_item_id());
		for(Map<String,Object> mapSalary:listSalarydetail){
			System.out.println(
					"EMP_CODE_A6:"+mapSalary.get("EMP_CODE")+
					"\t EMP_NAME:"+mapSalary.get("EMP_NAME")+
					"\t MONEY:"+mapSalary.get("MONEY"));

			this.callprSetsalarydetailByEmpCodeA6(
					salary_detail.getAccount_id(), 
					mapSalary.get("EMP_CODE").toString(), 
					salary_detail.getSalary_item_id(), 
					NumberUtils.ObjectToBigDecimal(mapSalary.get("MONEY")));
		}
	}
	

}
