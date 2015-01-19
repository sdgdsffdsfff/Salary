package com.salary.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.salary.dao.AccountDaoImpl;
import com.salary.dao.EmployeeDaoImpl;
import com.salary.dao.Salary_detailDaoImpl;
import com.salary.dao.Salary_itemDaoImpl;
import com.salary.entity.Account;
import com.salary.entity.Salary_detail;
import com.salary.entity.Salary_item;
import com.salary.sync.a6.A6DaoImpl;
import com.salary.sync.crm.CRMDaoImpl;
import com.salary.util.NumberUtils;

/**
 * 奖金明细service
 * @author 陈捷
 *
 */
public class Salary_detailService extends CRUDService<Salary_detail> {
	private Salary_detailDaoImpl salary_detailDaoimpl;
	private EmployeeDaoImpl employeeDaoimpl;
	private AccountDaoImpl accountDaoimpl;
	private Salary_itemDaoImpl salary_itemDaoimpl;

	
	public Salary_itemDaoImpl getSalary_itemDaoimpl() {
		return salary_itemDaoimpl;
	}

	public void setSalary_itemDaoimpl(Salary_itemDaoImpl salary_itemDaoimpl) {
		this.salary_itemDaoimpl = salary_itemDaoimpl;
	}

	public Salary_detailDaoImpl getSalary_detailDaoimpl() {
		return salary_detailDaoimpl;
	}

	public void setSalary_detailDaoimpl(Salary_detailDaoImpl salary_detailDaoimpl) {
		this.salary_detailDaoimpl = salary_detailDaoimpl;
	}
	
	public EmployeeDaoImpl getEmployeeDaoimpl() {
		return employeeDaoimpl;
	}

	public void setEmployeeDaoimpl(EmployeeDaoImpl employeeDaoimpl) {
		this.employeeDaoimpl = employeeDaoimpl;
	}
	
	public AccountDaoImpl getAccountDaoimpl() {
		return accountDaoimpl;
	}

	public void setAccountDaoimpl(AccountDaoImpl accountDaoimpl) {
		this.accountDaoimpl = accountDaoimpl;
	}

	/**
	 * 设置奖金明细金额
	 * @param account_id		奖金期间
	 * @param emp_id			员工id
	 * @param salary_item_id	奖金项目id
	 * @param money				金额
	 */
	public void setSalaryDetail(int account_id, int emp_id, int salary_item_id, BigDecimal money){
		salary_detailDaoimpl.callprSetsalarydetail(account_id, emp_id, salary_item_id, money);
	}
	
	/**
	 * 初始化奖金明细，读取接口来设置得到的金额
	 * 
	 * @param account_id 		奖金期间id
	 */
	public void initSalaryDetail(Account account){
		//注意:由于需要调用公司内部数据，因此以下代码是手工写死的
		
		
		//首先初始化本期间奖金信息,奖金期间信息
		salary_detailDaoimpl.callprInitsalarydetail(account.getId());
		Salary_detail salary_detail=new Salary_detail();
		salary_detail.setAccount_id(account.getId());
		
		//用来读取CRM的数据信息
		CRMDaoImpl crmDaoimpl=new CRMDaoImpl();
		//用来读取A6数据的信息
		A6DaoImpl a6Daoimpl=new A6DaoImpl();
		
		//初始化CRM工作量
		List<Map<String,Object>> listSalarydetail=crmDaoimpl.getGzl(account);
		if(listSalarydetail!=null && !listSalarydetail.isEmpty()){
			System.out.println("初始化工作量:"+listSalarydetail.size());
			salary_detail.setSalary_item_id(4);
			this.setSalarydetailFromCRMMap(salary_detail,listSalarydetail);
		}
		
		
		//初始化CRM服务费收取户数
		listSalarydetail=new ArrayList<Map<String,Object>>();
		listSalarydetail=crmDaoimpl.getFwfhs(account);
		if(listSalarydetail!=null && !listSalarydetail.isEmpty()){
			System.out.println("初始化服务费收取户数:"+listSalarydetail.size());
			salary_detail.setSalary_item_id(6);
			this.setSalarydetailFromCRMMap(salary_detail,listSalarydetail);
		}
		
		
		//初始化IT外包
		listSalarydetail=new ArrayList<Map<String,Object>>();
		listSalarydetail=a6Daoimpl.getMoneyByMatClassID(account,"325494471094859278");
		if(listSalarydetail!=null && !listSalarydetail.isEmpty()){
			System.out.println("初始化IT外包:"+listSalarydetail.size());
			salary_detail.setSalary_item_id(7);
			this.setSalarydetailFromA6Map(salary_detail,listSalarydetail);
		}
		
		//初始化产业化招生
		listSalarydetail=new ArrayList<Map<String,Object>>();
		listSalarydetail=a6Daoimpl.getMoneyByMatClassID(account,"174537133500134577");
		if(listSalarydetail!=null && !listSalarydetail.isEmpty()){
			System.out.println("初始化产业化招生:"+listSalarydetail.size());
			salary_detail.setSalary_item_id(8);
			this.setSalarydetailFromA6Map(salary_detail,listSalarydetail);
		}
		
		//初始化企业管理软件
		listSalarydetail=new ArrayList<Map<String,Object>>();
		listSalarydetail=a6Daoimpl.getMoneyByMatClassID(account,"174537133500134588");
		if(listSalarydetail!=null && !listSalarydetail.isEmpty()){
			System.out.println("初始化企业管理软件:"+listSalarydetail.size());
			salary_detail.setSalary_item_id(9);
			this.setSalarydetailFromA6Map(salary_detail,listSalarydetail);
		}
		
		//初始化文本组件
		listSalarydetail=new ArrayList<Map<String,Object>>();
		listSalarydetail=a6Daoimpl.getMoneyByMatClassID(account,"174537133500153932");
		if(listSalarydetail!=null && !listSalarydetail.isEmpty()){
			System.out.println("初始化文本组件:"+listSalarydetail.size());
			salary_detail.setSalary_item_id(10);
			this.setSalarydetailFromA6Map(salary_detail,listSalarydetail);
		}
		
		//初始化专项奖励：发票查询软件
		listSalarydetail=new ArrayList<Map<String,Object>>();
		listSalarydetail=a6Daoimpl.getZX_FPCXRJMoneyByMatClassID(account,"174537133500153929");
		if(listSalarydetail!=null && !listSalarydetail.isEmpty()){
			System.out.println("初始化专项奖励-->发票查询软件:"+listSalarydetail.size());
			salary_detail.setSalary_item_id(12);
			this.setSalarydetailFromA6Map(salary_detail,listSalarydetail);
		}
		
		//初始化专项奖励：企业管理软件
		listSalarydetail=new ArrayList<Map<String,Object>>();
		listSalarydetail=a6Daoimpl.getZX_QYGLRJMoneyByMatClassID(account,"174537133500134588");
		if(listSalarydetail!=null && !listSalarydetail.isEmpty()){
			System.out.println("初始化专项奖励-->企业查询软件:"+listSalarydetail.size());
			salary_detail.setSalary_item_id(13);
			this.setSalarydetailFromA6Map(salary_detail,listSalarydetail);
		}
		
		//初始化专项奖励：产业化招生
		listSalarydetail=new ArrayList<Map<String,Object>>();
		listSalarydetail=a6Daoimpl.getZX_CYHZSMoneyByMatClassID(account,"174537133500134577");
		if(listSalarydetail!=null && !listSalarydetail.isEmpty()){
			System.out.println("初始化专项奖励：产业化招生:"+listSalarydetail.size());
			salary_detail.setSalary_item_id(14);
			this.setSalarydetailFromA6Map(salary_detail,listSalarydetail);
		}
		
	}
	
	
	/**
	 * 获取动态的奖金项目明细表sql语句
	 * @param account_id	奖金期间id
	 * @return				奖金项目明细表sql语句
	 */
	public String GetfnGetsalarysql(int account_id){
		
		//查找quick_sql表中，是否有相应的sql语句
		String sql="select dynmaicsql,status from quick_sql where name='GetfnGetsalarysql'";
		List<Map<String,Object>> listquick_sql=salary_itemDaoimpl.queryNaviSql(sql, null);
		if(listquick_sql!=null && listquick_sql.size()>0){
			if(listquick_sql.get(0).get("status").toString().equals("0")){
				System.out.println("GetfnGetsalarysql -->使用了快速sql...");
				return listquick_sql.get(0).get("dynmaicsql").toString();
			}
		}
		
		//存储外层sql
		StringBuffer sqlBuffer=new StringBuffer(1000);
		sqlBuffer.append("select emp.id as empid,emp.name as empname,emp.code,dept.name as deptname,");
		
		//存储内层sql
		StringBuffer sqlBuffer2=new StringBuffer(1000);
		sqlBuffer2.append("select emp_id,");
		
		
		
		//首先要读取出奖金项目的列表
		String hql_salary_item="From Salary_item";
		List<Salary_item> listsalary_item=salary_itemDaoimpl.query(hql_salary_item, null);
		
		//循环读取奖金项目名称
		for(Salary_item salary_item:listsalary_item){
			sqlBuffer2.append(" case salary_item_id  when "+salary_item.getId()+" then money else 0 end as field"+salary_item.getId()+",");
			sqlBuffer.append(" sum(field"+salary_item.getId()+") as "+salary_item.getName()+",");
		}
		
		sqlBuffer.deleteCharAt(sqlBuffer.lastIndexOf(","));
		sqlBuffer2.deleteCharAt(sqlBuffer2.lastIndexOf(","));
		
		sqlBuffer.append(" from (");
		sqlBuffer2.append(" from salary_detail where account_id=:account_id ) sal left join employee emp on emp.id=sal.emp_id ");
		sqlBuffer2.append(" left join department dept on emp.department_id=dept.id group by emp.name,emp.code, ");
		sqlBuffer2.append(" dept.name order by deptname,empname ");
		
		sqlBuffer.append(sqlBuffer2);
		
		String dynmaicsql=sqlBuffer.toString();
		//更新快速SQL表的status为0
		String update_quick_sql="update quick_sql set status=0,dynmaicsql='"+dynmaicsql+"' where name='GetfnGetsalarysql'";
		salary_detailDaoimpl.executeSQL(update_quick_sql);
		
		return sqlBuffer.toString();
	}
	
	
	
	
	/**
	 * 根据CRM数据库查询出来的信息来写入到账期数据中  
	 * @param salary_detail		需要传入account_id,salary_item_id
	 * @param mapSalarydetail	List<Map<EMP_CODE:员工编号,MONEY:工作量>>
	 */
	public void setSalarydetailFromCRMMap(Salary_detail salary_detail,List<Map<String,Object>> listSalarydetail){
		
		System.out.println("setSalarydetailFromCRMMap-->account_id:"+salary_detail.getAccount_id()+
							"    salary_item_id:"+salary_detail.getSalary_item_id());
		for(Map<String,Object> mapSalary:listSalarydetail){
			System.out.println("setSalarydetailFromMap-->for loop:"+
						mapSalary.get("EMP_CODE").toString()+"    MONEY:"+mapSalary.get("MONEY"));
			salary_detailDaoimpl.callprSetsalarydetailByEmpCode(
					salary_detail.getAccount_id(), 
					mapSalary.get("EMP_CODE").toString(), 
					salary_detail.getSalary_item_id(), 
					NumberUtils.ObjectToBigDecimal(mapSalary.get("MONEY")));
		}
	}
	
	
	/**
	 * 根据A6数据库查询出来的信息来写入到账期数据中  
	 * @param salary_detail		需要传入account_id,salary_item_id
	 * @param mapSalarydetail	List<Map<EMP_CODE:员工编号,MONEY:工作量>>
	 */
	public void setSalarydetailFromA6Map(Salary_detail salary_detail,List<Map<String,Object>> listSalarydetail){
		
		System.out.println("setSalarydetailFromA6Map-->account_id:"+salary_detail.getAccount_id()+
							"    salary_item_id:"+salary_detail.getSalary_item_id());
		for(Map<String,Object> mapSalary:listSalarydetail){
			System.out.println(
					"EMP_CODE:"+mapSalary.get("EMP_CODE")+
					"\t cName:"+mapSalary.get("cName")+
					"\t MONEY:"+mapSalary.get("MONEY"));

			salary_detailDaoimpl.callprSetsalarydetailByEmpCodeA6(
					salary_detail.getAccount_id(), 
					mapSalary.get("EMP_CODE").toString(), 
					salary_detail.getSalary_item_id(), 
					NumberUtils.ObjectToBigDecimal(mapSalary.get("MONEY")));
		}
	}
}
