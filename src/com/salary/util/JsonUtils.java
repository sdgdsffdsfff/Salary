package com.salary.util;

import java.util.List;
import java.util.Map;

/**
 * Json转换工具
 * @author 陈捷
 *
 */
public class JsonUtils {
	
	/**
	 * 将字段名称和值写入到json格式中
	 * @param fields 字段名称
	 * @param values 字段值
	 * @return json格式的字符串
	 */
	public static String jsonConvert(String[] fields,Object[] values){
		int size=fields.length;
		int tail=size-1;
		if(size!=values.length){
			return "";
		}
		
		StringBuffer stringBuffer=new StringBuffer(1000);
		stringBuffer.append("{");
		for(int i=0;i<size;i++){
			if(i<tail){
				stringBuffer.append("\""+fields[i]+"\":\""+values[i]+"\",");
			}else{
				stringBuffer.append("\""+fields[i]+"\":\""+values[i]+"\"");
			}
		}
		stringBuffer.append("},");
		return stringBuffer.toString();
	}
	
	
	/**
	 * 根据传递进来的List<Map<String,Object>> listmap对象来生成json数据
	 * @param listmap	List<Map<String,Object>> listmap
	 * @return			json类型的字符串
	 */
	public static String getJsonFromList(List<Map<String,Object>> listmap){
		if(listmap!=null && !listmap.isEmpty()){
			StringBuffer json_footerBuffer=new StringBuffer(500);
			StringBuffer fieldBuffer=new StringBuffer(500);
			StringBuffer valueBuffer=new StringBuffer(500);
			
			for(Map<String,Object> mapsum:listmap){
				for(String key:mapsum.keySet()){
					fieldBuffer.append(key+",");
					valueBuffer.append(mapsum.get(key)+",");
				}
			}
			
			json_footerBuffer.append("[");
			json_footerBuffer.append(JsonUtils.jsonConvert(fieldBuffer.toString().split(","), valueBuffer.toString().split(",")));
			json_footerBuffer.deleteCharAt(json_footerBuffer.lastIndexOf(","));
			json_footerBuffer.append("]");
			
			return json_footerBuffer.toString();
		}
		
		return "[]";
	}
}
