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
		A6DaoImpl a6Daoimpl=new A6DaoImpl();
		
		Calendar cal=Calendar.getInstance();
		cal.set(2014, 11, 1);
		
		Account account=new Account();
		account.setDaystart(cal.getTime());
		
		cal.set(2014, 11,31);
		account.setDayend(cal.getTime());
		List<Map<String,Object>> listgzl=a6Daoimpl.getMoneyByMatClassID(account,"174537133500153932");
		
		for(Map<String,Object> gzl:listgzl){
			System.out.println(gzl.get("EMP_CODE")+"  :  "+gzl.get("MONEY"));
		}
	}
	
	
	/**
	 * 根据奖金期间、物品类别id来获取此期间销售金额
	 * @param account
	 * @param MatClassID
	 * @return
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
}
