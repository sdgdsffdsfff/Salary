package com.salary.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.salary.dao.CRUDDao;
import com.salary.entity.Report;

public interface ReportService extends CRUDDao<Report> {
	
	/**
	 * 根据报表信息来获取动态报表的数据列表
	 * @param report		报表信息
	 * @param request		请求参数
	 * @return				List<Map<String,Object>>的报表数据列表
	 */
	public List<Map<String,Object>> queryReportlist(Report report,HttpServletRequest request);
	
	
	/**
	 * 自动添加参数
	 * @param reportParams	自定义查询的参数字段
	 * @return				Map<String,Object> params
	 */
	public Map<String,Object> autoSetParams(String reportParams,HttpServletRequest request);
	
}
