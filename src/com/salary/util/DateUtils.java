package com.salary.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期工具
 * @author 陈捷
 *
 */
public class DateUtils {
	
	/**
	 * 日期转换工具
	 * 将日期类型转换为字符串类型的日期
	 * @param dt	日期类型
	 * @return		格式化成'年-月-日'类型的字符串
	 */
	public static String formatDate(Date dt){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(dt);
	}
}
