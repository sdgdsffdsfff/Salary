package com.salary.util;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 奖金处理工具
 * @author 陈捷
 *
 */
public class SalaryUtils {
	
	public static String[] unSupportBrowser={"Mozilla/4","MSIE 8.0","MSIE 7.0","MSIE 6.0","MSIE 5","AppleWebKit/533","AppleWebKit/534"};
	/**
	 * 解析动态函数SQL语句，将SQL语句中的:account_id,:emp_id替换为具体的值
	 * 注意:此方法只适用与在奖金项目公式表取出的语句进行解析
	 * 
	 * @param sql			动态函数SQL语句
	 * @param account_id	奖金期间id
	 * @param emp_id		职员id
	 * @return
	 */
	public static String parseSQL(String sql,int account_id,int emp_id){
		return "select ifnull("+sql.replace(":account_id", Integer.toString(account_id))
					.replace(":emp_id", Integer.toString(emp_id))+",0.0) as money";
	}
	
	
	/**
	 * 将Easyui表格更新的json数据解析成List<Map<String,Object>>数据
	 * @param json_str
	 * @return
	 */
	public static List<Map<String,Object>> parseDatagridJson(String json_str){
		if(json_str==null || json_str.isEmpty()){
			return null;
		}
		
		List<Map<String,Object>> listmap=new ArrayList<Map<String,Object>>();
		//先将json文本去除头尾的方括号,再将无用字符去掉
		json_str=json_str.substring(1,json_str.length()-1);
		json_str=json_str.replace("\"", "").replace("'","").replace("{", "");
		
		
		String[] json_array=json_str.split("}");
		for(String str:json_array){
			String[] str_array=str.split(",");
			Map<String,Object> jsonMap=new HashMap<String,Object>();
			for(String str1:str_array){
				int index=str1.indexOf(":");
				if(str1.length()>(index+1)){
					jsonMap.put(str1.substring(0,index), str1.substring(index+1));
				}
			}
			listmap.add(jsonMap);
		}
		
		return listmap;
	}
	
	
	/**
	 * 将obj数据转换成BigDecimal
	 * @param obj
	 * @return BigDecimal数据
	 */
	public static BigDecimal parseBigDecimal(Object obj){
		return BigDecimal.valueOf(Double.parseDouble((String) obj));
	}
	
	
	/**
	 * 将Map取出的数据转换成int类型
	 * @param obj
	 * @return Integer数据
	 */
	public static Integer parseInteger(Object obj){
		return Integer.parseInt((String) obj);
	}
	
	
	/**
	 * 将奖金项目公式的动态sql语句中提取出salary_item_id
	 * @param dynmaicsql	奖金项目公式的动态sql
	 * @param split_str		需要将sql语句分段的字符串':account_id,:emp_id,'
	 * @return				以逗号分隔的奖金项目id
	 */
	public static String parseDynmaicsqlToSalaryItemID(String dynmaicsql,String split_str){
		StringBuffer strBuffer=new StringBuffer(1000);
		String[] sparr=dynmaicsql.split(split_str);
		int index=0;
		for(String sp:sparr){
			System.out.println("sp:"+sp);
			index=sp.indexOf(")");
			if(index==-1){
				index=0;
			}
			
			String substr=new String(sp.substring(0, index));
			if(substr!=null && substr.length()>0){
				strBuffer.append(substr+",");
			}
		}
		
		return strBuffer.toString();
	}
	
	
}
