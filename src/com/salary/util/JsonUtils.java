package com.salary.util;

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
}
