package com.salary.service;

import com.salary.dao.ReportDaoImpl;
import com.salary.entity.Report;

/**
 * 自定义报表服务类
 * @author 陈捷
 *
 */
public class ReportService extends CRUDService<Report> {
	private ReportDaoImpl reportDaoimpl;

	public ReportDaoImpl getReportDaoimpl() {
		return reportDaoimpl;
	}

	public void setReportDaoimpl(ReportDaoImpl reportDaoimpl) {
		this.reportDaoimpl = reportDaoimpl;
	}
	
	
}
