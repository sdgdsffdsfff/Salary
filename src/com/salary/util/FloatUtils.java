package com.salary.util;

/**
 * 用于将字符串转换为浮点数
 * @author 陈捷
 *
 */
public class FloatUtils {
	
	/**
	 * 用于除去前后的方括号
	 * @param str_float 字符串
	 * @return	浮点数
	 */
	public static float exceptTopAndTail(String str_float){
		String newStr=str_float.substring(1, str_float.length()-1);
		return Float.parseFloat(newStr);
	}
}
