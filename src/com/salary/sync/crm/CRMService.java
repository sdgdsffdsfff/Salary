package com.salary.sync.crm;

import java.util.List;
import java.util.Map;

import com.salary.dao.CRUDDao;
import com.salary.entity.Author;

public interface CRMService extends CRUDDao<Author> {
	
	/**
	 * 返回CRM的所有员工信息
	 * @return		List<Map<String,Object>> EMP_NAME,ENGINEERS_NO,EMP_CODE
	 */
	public List<Map<String,Object>> getEmployeelist();
	
	
}
