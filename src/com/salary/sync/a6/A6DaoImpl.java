package com.salary.sync.a6;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.salary.dao.CRUDDaoImpl;
import com.salary.entity.Account;
import com.salary.util.DateUtils;

public class A6DaoImpl extends CRUDDaoImpl<Account>{
	
	public A6DaoImpl(){
		this.setSessionFactory(A6Util.getSessionFactory());
	}
	
	
	@Test
	public void test1(){
		//测试返回A6的员工CODE,MONEY
		A6DaoImpl a6Daoimpl=new A6DaoImpl();
		
		Calendar cal=Calendar.getInstance();
		cal.set(2014, 11, 1);
		
		Account account=new Account();
		account.setDaystart(cal.getTime());
		
		cal.set(2014, 11,31);
		account.setDayend(cal.getTime());
		//初始化IT外包:325494471094859278
		//初始化产业化招生:174537133500134577
		//初始化企业管理软件:174537133500134588
		//初始化文本组件:174537133500153932
		
		//初始化专项奖励：发票查询软件:174537133500153929
		//初始化专项奖励：企业管理软件:174537133500134588
		//初始化专项奖励：产业化招生:174537133500134577
		List<Map<String,Object>> listgzl=a6Daoimpl.getMoneyByMatClassID(account,"325494471094859278");
		
		for(Map<String,Object> gzl:listgzl){
			System.out.println("EMP_CODE:"+gzl.get("EMP_CODE")+"\t cName:"+gzl.get("cName")+"\t MONEY:"+gzl.get("MONEY"));
		}
	}
	
	@Test
	public void test2(){
		//测试返回A6的员工信息
		A6DaoImpl a6Daoimpl=new A6DaoImpl();
		
		List<Map<String,Object>> a6employeelist=a6Daoimpl.getEmployeelist();
		for(Map<String,Object> mapEmployee:a6employeelist){
			System.out.println(mapEmployee.get("EMP_CODE")+"  :  "+mapEmployee.get("EMP_NAME"));
		}
	}
	
	
	/**
	 * 根据奖金期间、物品类别id来获取此期间销售金额
	 * @param account		奖金期间
	 * @param MatClassID	物品类别id
	 * @return				List<Map<EMP_CODE,MONEY>>员工编号，金额
	 */
	public List<Map<String,Object>> getMoneyByMatClassID(Account account,String MatClassID){
		StringBuffer sqlBuffer=new StringBuffer(1000);
		
		sqlBuffer.append(" select emp.cCode as EMP_CODE,emp.cName,dis.MONEY from ( ");
		sqlBuffer.append(" select dis_main.cEmpGUID,sum(dis_line.iTotal) as MONEY from ( ");
		sqlBuffer.append(" select dispatchline.* from( ");
		sqlBuffer.append(" select cguid,cHeadGUID,cMatGUID,iTotal from SA_DispatchLine where cHeadGUID in( ");
		sqlBuffer.append(" select cSMainID from BILL_GEN_RELATION_MAIN where cDMainID in ( ");
		sqlBuffer.append(" select cGUID from AP_Payment ");
		sqlBuffer.append(" where cVouCode like 'SK%' ");
		sqlBuffer.append(" and dAuditDate between '"+DateUtils.formatDate(account.getDaystart())+"' and '"+DateUtils.formatDate(account.getDayend())+"'))) dispatchline ");
		sqlBuffer.append(" left join ");
		sqlBuffer.append(" (select cGUID,cMatName from CM_Material ");
		sqlBuffer.append(" where cMatCGUID in ");
		sqlBuffer.append(" (select cm_class.cGUID from ( ");
		sqlBuffer.append(" select '"+MatClassID+"' as cGUID ");
		sqlBuffer.append(" union ");
		sqlBuffer.append(" select cGUID from CM_MatClass ");
		sqlBuffer.append(" where cParentID='"+MatClassID+"') cm_class)) material ");
		sqlBuffer.append(" on dispatchline.cMatGUID=material.cGUID ");
		sqlBuffer.append(" where material.cGUID is not null) dis_line ");
		sqlBuffer.append(" left join SA_Dispatch dis_main ");
		sqlBuffer.append(" on dis_line.cHeadGUID=dis_main.cGUID ");
		sqlBuffer.append(" where dis_main.cEmpGUID is not null ");
		sqlBuffer.append(" group by dis_main.cEmpGUID) dis ");
		sqlBuffer.append(" left join CM_Employee emp ");
		sqlBuffer.append(" on dis.cEmpGUID=emp.cGUID ");
		
		return this.queryNaviSql(sqlBuffer.toString(), null);
	}
	
	
	/**
	 * 返回A6的所有员工信息
	 * @return
	 */
	public List<Map<String,Object>> getEmployeelist(){
		String sql="select cName as EMP_NAME,cCode as EMP_CODE from CM_EMPLOYEE";
		return this.queryNaviSql(sql, null);
	}
	
	
	/**
	 * 查询发票查询软件专项奖励
	 * @param account		奖金期间
	 * @param MatClassID	物品类别id:'174537133500153929'
	 * @return				List<Map<EMP_CODE,MONEY>>员工编号，金额
	 */
	public List<Map<String,Object>> getZX_FPCXRJMoneyByMatClassID(Account account,String MatClassID){
		StringBuffer sqlBuffer=new StringBuffer(1000);
		
		sqlBuffer.append(" select emp.cCode as EMP_CODE,emp.cName,dis.MONEY from ( ");
		sqlBuffer.append(" select dis_main.cEmpGUID,sum(dis_line.cTotal) as MONEY from ( ");
		sqlBuffer.append(" select dispatchline.* from( ");
		sqlBuffer.append(" select cguid,cHeadGUID,cMatGUID,case when iTotal>=780 then 50 else 0 end as cTotal from SA_DispatchLine where cHeadGUID in( ");
		sqlBuffer.append(" select cSMainID from BILL_GEN_RELATION_MAIN where cDMainID in ( ");
		sqlBuffer.append(" select cGUID from AP_Payment ");
		sqlBuffer.append(" where cVouCode like 'SK%' ");
		sqlBuffer.append(" and dAuditDate between '"+DateUtils.formatDate(account.getDaystart())+"' and '"+DateUtils.formatDate(account.getDayend())+"'))) dispatchline ");
		sqlBuffer.append(" left join ");
		sqlBuffer.append(" (select cGUID,cMatName from CM_Material ");
		sqlBuffer.append(" where cMatCGUID in ");
		sqlBuffer.append(" (select cm_class.cGUID from ( ");
		sqlBuffer.append(" select '"+MatClassID+"' as cGUID ");
		sqlBuffer.append(" union ");
		sqlBuffer.append(" select cGUID from CM_MatClass ");
		sqlBuffer.append(" where cParentID='"+MatClassID+"') cm_class)) material ");
		sqlBuffer.append(" on dispatchline.cMatGUID=material.cGUID ");
		sqlBuffer.append(" where material.cGUID is not null) dis_line ");
		sqlBuffer.append(" left join SA_Dispatch dis_main ");
		sqlBuffer.append(" on dis_line.cHeadGUID=dis_main.cGUID ");
		sqlBuffer.append(" where dis_main.cEmpGUID is not null ");
		sqlBuffer.append(" group by dis_main.cEmpGUID) dis ");
		sqlBuffer.append(" left join CM_Employee emp ");
		sqlBuffer.append(" on dis.cEmpGUID=emp.cGUID ");
		
		return this.queryNaviSql(sqlBuffer.toString(), null);
	}
	
	
	/**
	 * 查询专项奖励：企业管理软件
	 * @param account		奖金期间
	 * @param MatClassID	物品类别id
	 * @return				List<Map<EMP_CODE,MONEY>>员工编号，金额
	 */
	public List<Map<String,Object>> getZX_QYGLRJMoneyByMatClassID(Account account,String MatClassID){
		StringBuffer sqlBuffer=new StringBuffer(1000);
		
		sqlBuffer.append(" select emp.cCode as EMP_CODE,emp.cName,dis.MONEY from ( ");
		sqlBuffer.append(" select dis_main.cEmpGUID,sum(dis_line.cTotal) as MONEY from ( ");
		sqlBuffer.append(" select dispatchline.* from( ");
		sqlBuffer.append(" select cguid,cHeadGUID,cMatGUID,case when iTaxPrice<=3000 then 200*iQTY else iTotal*0.05 end as cTotal from SA_DispatchLine where cHeadGUID in( ");
		sqlBuffer.append(" select cSMainID from BILL_GEN_RELATION_MAIN where cDMainID in ( ");
		sqlBuffer.append(" select cGUID from AP_Payment ");
		sqlBuffer.append(" where cVouCode like 'SK%' ");
		sqlBuffer.append(" and dAuditDate between '"+DateUtils.formatDate(account.getDaystart())+"' and '"+DateUtils.formatDate(account.getDayend())+"'))) dispatchline ");
		sqlBuffer.append(" left join ");
		sqlBuffer.append(" (select cGUID,cMatName from CM_Material ");
		sqlBuffer.append(" where cMatCGUID in ");
		sqlBuffer.append(" (select cm_class.cGUID from ( ");
		sqlBuffer.append(" select '"+MatClassID+"' as cGUID ");
		sqlBuffer.append(" union ");
		sqlBuffer.append(" select cGUID from CM_MatClass ");
		sqlBuffer.append(" where cParentID='"+MatClassID+"') cm_class)) material ");
		sqlBuffer.append(" on dispatchline.cMatGUID=material.cGUID ");
		sqlBuffer.append(" where material.cGUID is not null) dis_line ");
		sqlBuffer.append(" left join SA_Dispatch dis_main ");
		sqlBuffer.append(" on dis_line.cHeadGUID=dis_main.cGUID ");
		sqlBuffer.append(" where dis_main.cEmpGUID is not null ");
		sqlBuffer.append(" group by dis_main.cEmpGUID) dis ");
		sqlBuffer.append(" left join CM_Employee emp ");
		sqlBuffer.append(" on dis.cEmpGUID=emp.cGUID ");
		
		return this.queryNaviSql(sqlBuffer.toString(), null);
	}
	
	
	/**
	 * 查询专项奖励：产业化招生
	 * @param account		奖金期间
	 * @param MatClassID	物品类别id:174537133500134577
	 * @return				List<Map<EMP_CODE,MONEY>>员工编号，金额
	 */
	public List<Map<String,Object>> getZX_CYHZSMoneyByMatClassID(Account account,String MatClassID){
		StringBuffer sqlBuffer=new StringBuffer(1000);
		
		sqlBuffer.append(" select emp.cCode as EMP_CODE,emp.cName,dis.MONEY from ( ");
		sqlBuffer.append(" select dis_main.cEmpGUID,sum(dis_line.cTotal) as MONEY from ( ");
		sqlBuffer.append(" select dispatchline.* from( ");
		sqlBuffer.append(" select cguid,cHeadGUID,cMatGUID,(iQTY*100) as cTotal from SA_DispatchLine where cHeadGUID in( ");
		sqlBuffer.append(" select cSMainID from BILL_GEN_RELATION_MAIN where cDMainID in ( ");
		sqlBuffer.append(" select cGUID from AP_Payment ");
		sqlBuffer.append(" where cVouCode like 'SK%' ");
		sqlBuffer.append(" and dAuditDate between '"+DateUtils.formatDate(account.getDaystart())+"' and '"+DateUtils.formatDate(account.getDayend())+"'))) dispatchline ");
		sqlBuffer.append(" left join ");
		sqlBuffer.append(" (select cGUID,cMatName from CM_Material ");
		sqlBuffer.append(" where cMatCGUID in ");
		sqlBuffer.append(" (select cm_class.cGUID from ( ");
		sqlBuffer.append(" select '"+MatClassID+"' as cGUID ");
		sqlBuffer.append(" union ");
		sqlBuffer.append(" select cGUID from CM_MatClass ");
		sqlBuffer.append(" where cParentID='"+MatClassID+"') cm_class)) material ");
		sqlBuffer.append(" on dispatchline.cMatGUID=material.cGUID ");
		sqlBuffer.append(" where material.cGUID is not null) dis_line ");
		sqlBuffer.append(" left join SA_Dispatch dis_main ");
		sqlBuffer.append(" on dis_line.cHeadGUID=dis_main.cGUID ");
		sqlBuffer.append(" where dis_main.cEmpGUID is not null ");
		sqlBuffer.append(" group by dis_main.cEmpGUID) dis ");
		sqlBuffer.append(" left join CM_Employee emp ");
		sqlBuffer.append(" on dis.cEmpGUID=emp.cGUID ");
		
		return this.queryNaviSql(sqlBuffer.toString(), null);
	}
	
	
}
