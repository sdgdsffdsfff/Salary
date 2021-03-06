package com.salary.util;

import java.math.BigDecimal;
import java.math.BigInteger;

/**
 * 数字转换工具
 * @author 陈捷
 *
 */
public class NumberUtils {
	
	/**
	 * 用于除去json前后的方括号后的数字
	 * @param str_float 字符串
	 * @return	浮点数
	 */
	public static float exceptTopAndTail(String str_float){
		String newStr=str_float.substring(1, str_float.length()-1);
		return Float.parseFloat(newStr);
	}
	
	
	/**
	 * 将BigInteger类型的obj转换成int类型数据
	 * @param 	obj
	 * @return	int类型数据
	 */
	public static Integer BigIntegerToInteger(Object obj){
		return ((BigInteger) obj).intValue();
	}
	
	/**
	 * 将BigDecimal类型的obj转换成float类型的数据
	 * @param 	obj
	 * @return	float类型的数据
	 */
	public static float BigDecimalToFloat(Object obj){
		return ((BigDecimal) obj).floatValue();
	}
	
	/**
	 * 将Object对象转换为BigDecimal
	 * @param 		obj
	 * @return 		BigDecimal
	 */
	public static BigDecimal ObjectToBigDecimal(Object obj){
		return BigDecimal.valueOf(Double.parseDouble(String.valueOf(obj)));
	}
	
	
	/**
	 * 将Object类型的数据转换为float类型数据
	 * @param obj		Object类型数据
	 * @return			float类型数据
	 */
	public static float ObjectToFloat(Object obj){
		return Float.parseFloat(String.valueOf(obj));
	}
	
	
	/**
	 * 将Object类型数据转换成Ingeger类型数据
	 * @param obj	Object类型数据
	 * @return		Integer类型数据
	 */
	public static Integer ObjectToInteger(Object obj){
		return Integer.parseInt(String.valueOf(obj));
	}
	
	/**
	 * 将Object类型数据转换成Long类型数据
	 * @param obj	Object类型数据
	 * @return		Long类型数据
	 */
	public static Long ObjectToLong(Object obj){
		return Long.parseLong(String.valueOf(obj));
	}
	
	/**
	 * 将Object类型的数据转换为Double类型数据
	 * @param obj		Object类型数据
	 * @return			Double类型数据
	 */
	public static Double ObjectToDouble(Object obj){
		return Double.parseDouble(String.valueOf(obj));
	}
}
