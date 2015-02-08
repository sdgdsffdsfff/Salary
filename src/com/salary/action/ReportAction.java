package com.salary.action;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import com.salary.entity.Report;
import com.salary.service.ReportService;
import com.salary.util.ExcelUtils;
import com.salary.util.ReportUtils;

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
	private Integer report_id;						//报表id
	private Report report;							//自定义报表类
	private JSONObject jsonobj;						//json数据
	private String dynmaiccolumn;					//动态的Easyui表格列
	private String dynmaiceasyui;					//动态的Easyui组件列表(用来传递参数)
	private String formparams;						//form表单的参数列表,用逗号分割
	private String formparamstype;					//form表单的Easyui类型列表,用逗号分割
	private InputStream inputStream;				//文件输出流
	
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
	
	public String getDynmaiceasyui() {
		return dynmaiceasyui;
	}

	public void setDynmaiceasyui(String dynmaiceasyui) {
		this.dynmaiceasyui = dynmaiceasyui;
	}
	
	public Integer getReport_id() {
		return report_id;
	}

	public void setReport_id(Integer report_id) {
		this.report_id = report_id;
	}
	
	public String getFormparams() {
		return formparams;
	}

	public void setFormparams(String formparams) {
		this.formparams = formparams;
	}
	
	public String getFormparamstype() {
		return formparamstype;
	}

	public void setFormparamstype(String formparamstype) {
		this.formparamstype = formparamstype;
	}
	
	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
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
		//生成EasyUI的表格、组件
		String hql="From Report where id="+report_id;
		report=reportService.get(hql, null);
		this.generalEasyuiDataGrid(report);
		return SUCCESS;
	}
	
	/**
	 * 获取自定义报表查询json数据
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String queryReportlist(){
		try {
			String hql="From Report where id="+report_id;
			report=reportService.get(hql, null);
			
			HttpServletRequest request=ServletActionContext.getRequest();
			List<Map<String,Object>> listjson=reportService.queryReportlist(report,request);
			
			//生成EasyUI的表格、组件
			this.generalEasyuiDataGrid(report);
			
			Map<String,Object> jsonMap=new HashMap<String,Object>();
			jsonMap.put("rows", listjson);
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
	
	
	/**
	 * 自动生成EasyUI表格和查询组件
	 */
	public void generalEasyuiDataGrid(Report report){
		//获取参数列表给表单
		List<String> listParamField=ReportUtils.parseReportParamFields(report.getParams());
		formparams="";
		for(String param:listParamField){
			formparams+=param+",";
		}
		
		//获取参数类型列表给表单
		List<String> listParamFieldType=ReportUtils.parseReportParamFieldsType(report.getParams());
		formparamstype="";
		for(String paramtype:listParamFieldType){
			formparamstype+=paramtype+",";
		}
		
		formparams=formparams.substring(0, formparams.length()-1);
		formparamstype=formparamstype.substring(0,formparamstype.length()-1);
		dynmaiccolumn=ReportUtils.reportParamsToDynmaiccolumn(report.getFields(), report.getTitles(), report.getWidths());
		dynmaiceasyui=ReportUtils.reportParamsToEasyui(report.getParams());
	}

	
	/**
	 * 自定义报表获取Excel数据
	 * @return
	 */
	public String getReportExcel(){
		try {
			String hql="From Report where id="+report_id;
			report=reportService.get(hql, null);
			
			HttpServletRequest request=ServletActionContext.getRequest();
			List<Map<String,Object>> listjson=reportService.queryReportlist(report,request);
			
			ExcelUtils excel=new ExcelUtils();
			String[] titles=report.getTitles().split(",");
			String[] fields=report.getFields().split(",");
			
			inputStream=excel.getExcelInputStream(titles,fields, listjson);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			errormessage="动态查询语句不正确，请检查...";
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	
}
