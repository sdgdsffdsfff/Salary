package com.salary.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

/**
 * Excel文件读写工具
 * @author 陈捷
 *
 */
public class ExcelUtils {

	/**
	 * 获取Excel文件的输入流
	 * @param field_title	List<String>字段标题列表
	 * @param list_map		List<Map<String,Object>>数据信息列表
	 * @return				Excel的文件输出流
	 * @throws Exception	异常信息
	 */
	public InputStream getExcelInputStream(
			List<String> field_title,
			List<Map<String,Object>> list_map) throws Exception{
		ByteArrayOutputStream bos=new ByteArrayOutputStream();
		this.writeExcel(bos, field_title, list_map);
		return new ByteArrayInputStream(bos.toByteArray());
	}
	
	
	/**
	 * 获取Excel文件的输入流
	 * @param field_title	List<String>字段标题列表
	 * @param list_map		List<Map<String,Object>>数据信息列表
	 * @return				Excel的文件输出流
	 * @throws Exception	异常信息
	 */
	public InputStream getExcelInputStream(
			String[] field_title,
			List<Map<String,Object>> list_map) throws Exception{
		ByteArrayOutputStream bos=new ByteArrayOutputStream();
		this.writeExcel(bos, field_title, list_map);
		return new ByteArrayInputStream(bos.toByteArray());
	}
	
	
	/**
	 * 写入Excel文件信息
	 * @param outputStream		文件输出流
	 * @param field_title		List<String>字段标题列表
	 * @param list_map			List<Map<String,Object>>数据信息列表
	 * @throws Exception		异常信息
	 */
	public void writeExcel(OutputStream outputStream,List<String> field_title,List<Map<String,Object>> list_map) throws Exception{
		WritableWorkbook workbook = Workbook.createWorkbook(outputStream);
		WritableSheet sheet = workbook.createSheet("爱信诺绩效考核系统", 0);
		int row_index=0;
		int key_index=0;
		
		if(list_map!=null && list_map.size()>0){
			//根据field_title来设置首行数据
			for(String field_title_key:field_title){
				Label label = new Label(key_index,row_index,field_title_key);
				sheet.addCell(label);
				key_index++;
			}
			
			//根据field_title来读取出内容
			row_index=1;
			key_index=0;
			for(Map<String,Object> map:list_map){
				for(String list_field_key:field_title){
					Label label = new Label(key_index,row_index,map.get(list_field_key).toString());
					sheet.addCell(label);
					key_index++;
					System.out.println(map.get(list_field_key).toString());
				}
				row_index++;
				key_index=0;
			}
			
		}
		
		workbook.write();
		workbook.close();
	}
	
	
	/**
	 * 写入Excel文件信息
	 * @param outputStream		文件输出流
	 * @param field_title		List<String>字段标题列表
	 * @param list_map			List<Map<String,Object>>数据信息列表
	 * @throws Exception		异常信息
	 */
	public void writeExcel(OutputStream outputStream,String[] field_title,List<Map<String,Object>> list_map) throws Exception{
		WritableWorkbook workbook = Workbook.createWorkbook(outputStream);
		WritableSheet sheet = workbook.createSheet("爱信诺绩效考核系统", 0);
		int row_index=0;
		int key_index=0;
		
		if(list_map!=null && list_map.size()>0){
			//根据field_title来设置首行数据
			for(String field_title_key:field_title){
				Label label = new Label(key_index,row_index,field_title_key);
				sheet.addCell(label);
				key_index++;
			}
			
			//根据field_title来读取出内容
			row_index=1;
			key_index=0;
			for(Map<String,Object> map:list_map){
				for(String list_field_key:field_title){
					Label label = new Label(key_index,row_index,map.get(list_field_key).toString());
					sheet.addCell(label);
					key_index++;
					System.out.println(map.get(list_field_key).toString());
				}
				row_index++;
				key_index=0;
			}
			
		}
		
		workbook.write();
		workbook.close();
	}
}
