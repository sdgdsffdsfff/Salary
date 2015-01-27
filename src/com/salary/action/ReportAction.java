package com.salary.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import net.sf.json.JSONObject;
import com.salary.entity.Report;
import com.salary.service.ReportService;

/**
 * 自定义报表action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class ReportAction extends CRUDAction {
	private Logger logger=Logger.getLogger(ReportAction.class);
	private ReportService reportService;
	private Integer id;
	private Report report;							//自定义报表类
	private JSONObject jsonobj;						//json数据
	private String dynmaiccolumn;					//动态的Easyui表格列
	
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public ReportService getReportService() {
		return reportService;
	}

	public void setReportService(ReportService reportService) {
		this.reportService = reportService;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Report getReport() {
		return report;
	}

	public void setReport(Report report) {
		this.report = report;
	}

	public JSONObject getJsonobj() {
		return jsonobj;
	}

	public void setJsonobj(JSONObject jsonobj) {
		this.jsonobj = jsonobj;
	}

	public String getDynmaiccolumn() {
		return dynmaiccolumn;
	}

	public void setDynmaiccolumn(String dynmaiccolumn) {
		this.dynmaiccolumn = dynmaiccolumn;
	}

	/**
	 * 显示添加自定义报表页
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addReportPage(){
		return SUCCESS;
	}
	
	/**
	 * 显示修改自定义报表页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editReportPage(){
		String hql="From Report where id="+id;
		report=reportService.get(hql, null);
		return SUCCESS;
	}
	
	/**
	 * 显示自定义报表列表页
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String listReportPage(){
		return SUCCESS;
	}
	
	/**
	 * 添加自定义报表
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addReport(){
		reportService.add(report);
		return SUCCESS;
	}
	
	/**
	 * 修改自定义报表
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editReport(){
		reportService.edit(report);
		return SUCCESS;
	}
	
	/**
	 * 删除自定义报表
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String delReport(){
		String hql="From Report where id="+id;
		report=reportService.get(hql, null);
		reportService.del(report);
		
		return SUCCESS;
	}
	
	/**
	 * 获取自定义报表列表json数据
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String getReportlist(){
		this.init();
		String hql="From Report";
		List<Report> listreport=reportService.queryByPage(hql, null, page, rows);
		
		Map<String,Object> reportMap=new HashMap<String,Object>();
		reportMap.put("rows", listreport);
		reportMap.put("total", reportService.query(hql, null).size());
		
		jsonobj=new JSONObject();
		jsonobj=JSONObject.fromObject(reportMap);
		
		return SUCCESS;
	}
	
	/**
	 * 显示自定义报表查询页
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String queryReportPage(){
		String hql="From Report where id="+id;
		report=reportService.get(hql, null);
		String[] fields=report.getFields().split(",");
		String[] titles=report.getTitles().split(",");
		String[] widths=report.getWidths().split(",");
		
		StringBuffer colBuffer=new StringBuffer(5000);
		colBuffer.append("[[");
		
		
		for(int i=0;i<fields.length;i++){
			colBuffer.append("{field:'"+fields[i]+"',title:'"+titles[i]+"',width:"+widths[i]+"},");
		}
		
		colBuffer.append("]]");
		dynmaiccolumn=colBuffer.toString();
		return SUCCESS;
	}
	
	/**
	 * 获取自定义报表查询json数据
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String queryReportlist(){
		try {
			String hql="From Report where id="+id;
			report=reportService.get(hql, null);
			
			String sql=report.getDynmaicsql();
			List<Map<String,Object>> listjson=reportService.queryNaviSql(sql, null);
			Map<String,Object> jsonMap=new HashMap<String,Object>();
			jsonMap.put("rows", listjson);
			jsonMap.put("total", listjson.size());
			
			jsonobj=new JSONObject();
			jsonobj=JSONObject.fromObject(jsonMap);
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			errormessage="动态查询语句不正确，请检查...";
			return ERROR;
		}
		
		return SUCCESS;
	}
}
