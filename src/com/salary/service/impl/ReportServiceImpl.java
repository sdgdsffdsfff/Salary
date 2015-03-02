package com.salary.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.salary.dao.CRUDDaoImpl;
import com.salary.entity.Report;
import com.salary.service.ReportService;
import com.salary.sync.a6.A6DaoImpl;
import com.salary.sync.crm.CRMDaoImpl;
import com.salary.util.ReportUtils;

/**
 * 自定义报表服务类
 * @author 陈捷
 *
 */
public class ReportServiceImpl extends CRUDDaoImpl<Report> implements ReportService {
	private A6DaoImpl a6DaoImpl;
	private CRMDaoImpl crmDaoImpl;
	
	public A6DaoImpl getA6DaoImpl() {
		return a6DaoImpl;
	}
	public void setA6DaoImpl(A6DaoImpl a6DaoImpl) {
		this.a6DaoImpl = a6DaoImpl;
	}
	public CRMDaoImpl getCrmDaoImpl() {
		return crmDaoImpl;
	}
	public void setCrmDaoImpl(CRMDaoImpl crmDaoImpl) {
		this.crmDaoImpl = crmDaoImpl;
	}
	/**
	 * 根据报表信息来获取动态报表的数据列表
	 * @param report		报表信息
	 * @param request		请求参数
	 * @return				List<Map<String,Object>>的报表数据列表
	 */
	public List<Map<String,Object>> queryReportlist(Report report,HttpServletRequest request){
		String sql=report.getDynmaicsql();
		request=ServletActionContext.getRequest();
		Map<String,Object> params=this.autoSetParams(report.getParams(),request);
		List<Map<String,Object>> listjson=null;
		
		//判断数据来源是哪里的
		switch(report.getSource()){
		case 0:
			listjson=this.queryNaviSql(sql, params);
			break;
		case 1:
			listjson=crmDaoImpl.queryNaviSql(sql, params);
			break;
		case 2:
			listjson=a6DaoImpl.queryNaviSql(sql, params);
			break;
		}
		
		
		return listjson;
	}
	
	
	/**
	 * 自动添加参数
	 * @param reportParams	自定义查询的参数字段
	 * @return				Map<String,Object> params
	 */
	public Map<String,Object> autoSetParams(String reportParams,HttpServletRequest request){
		Map<String,Object> params=new HashMap<String,Object>();
		//首先要解析出有哪些参数
		List<String> listParamField=ReportUtils.parseReportParamFields(reportParams);
		if(listParamField!=null && !listParamField.isEmpty()){
			for(String param:listParamField){
				params.put(param,request.getParameter(param));
			}
		}
		
		return params;
	}
}
