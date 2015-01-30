package com.salary.util;

import java.util.ArrayList;
import java.util.List;

/**
 * 报表解析工具
 * @author 陈捷
 *
 */
public class ReportUtils {
	
	/**
	 * 将字符串类型的参数解析成Easyui的组件字符串
	 * @param reportParams		自定义报表的参数字段(格式    查询参数:EasyUI类型:参数说明,)
	 * @return					EasyUI的组件字符串
	 */
	public static String reportParamsToEasyui(String reportParams){
		//生成EasyUI的代码
		StringBuffer easyuiBuffer=new StringBuffer(2000);
		//根据逗号来分割各个参数
		String[] paramComma=reportParams.split(",");
		for(String strParamComma:paramComma){
			//各个参数根据冒号再进行分割
			String[] paramColon=strParamComma.split(":");
			
			easyuiBuffer.append(paramColon[2]+":<input type=\"text\" id=\""+paramColon[0]+"\" class=\"easyui-"+paramColon[1]+"\" ");
			easyuiBuffer.append("data-options=\"required:true,formatter:defaultdate,parser:defaultparser,validType:'validDate'\" />&nbsp;&nbsp;&nbsp;&nbsp;");
		}
		
		//添加查询按钮
		easyuiBuffer.append("<a onclick=\"submit()\" class=\"easyui-linkbutton\" data-options=\"iconCls:'icon-search',plain:true\">查询</a>");
		System.out.println("parserReportParamsToTools:"+easyuiBuffer);
		return easyuiBuffer.toString();
	}
	
	
	/**
	 * 将自定义报表的字段，标题，宽度转换为Easyuid的动态表格列
	 * @param sqlfields		自定义报表的字段
	 * @param sqltitles		自定义报表的标题
	 * @param sqlwidths		自定义报表的宽度
	 * @return				json数据:Easyuid的动态表格列
	 */
	public static String reportParamsToDynmaiccolumn(String sqlfields,String sqltitles,String sqlwidths){
		
		StringBuffer colBuffer=new StringBuffer(5000);
		String[] fields=sqlfields.split(",");
		String[] titles=sqltitles.split(",");
		String[] widths=sqlwidths.split(",");
		colBuffer.append("[[");
		
		for(int i=0;i<fields.length;i++){
			colBuffer.append("{field:'"+fields[i]+"',title:'"+titles[i]+"',width:"+widths[i]+"},");
		}
		
		colBuffer.append("]]");
		return colBuffer.toString();
	}
	
	
	/**
	 * 根据自定义报表的params字段，来获取参数列表
	 * @param reportParams		自定义报表的params字段
	 * @return					List<String>
	 */
	public static List<String> parseReportParamFields(String reportParams){
		String[] paramComma=reportParams.split(",");
		List<String> listFields=new ArrayList<String>();
		for(String params:paramComma){
			String[] paramField=params.split(":");
			listFields.add(paramField[0]);
			
			System.out.println("parseReportParamFields:"+paramField[0]);
		}
		
		return listFields;
	}
	
	
	/**
	 * 根据自定义报表的params字段，来获取参数列表的EasyUI类型
	 * @param reportParams		自定义报表的params字段
	 * @return					List<String>
	 */
	public static List<String> parseReportParamFieldsType(String reportParams){
		String[] paramComma=reportParams.split(",");
		List<String> listFields=new ArrayList<String>();
		for(String params:paramComma){
			String[] paramField=params.split(":");
			listFields.add(paramField[1]);
			
			System.out.println("parseReportParamFields:"+paramField[1]);
		}
		
		return listFields;
	}
}
