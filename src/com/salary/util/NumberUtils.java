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
		if(obj==null){
			return BigDecimal.valueOf(0.0);
		}
		
		if(obj instanceof BigDecimal){
			return (BigDecimal) obj;
		}
		if(obj instanceof BigInteger){
			return BigDecimal.valueOf(((BigInteger) obj).doubleValue());
		}
		if(obj instanceof Integer){
			return BigDecimal.valueOf(((Integer) obj).doubleValue());
		}
		
		return null;
	}
}
