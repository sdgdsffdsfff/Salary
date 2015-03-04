package com.salary.sync.a6;

import java.util.List;
import java.util.Map;

import com.salary.dao.CRUDDao;
import com.salary.entity.Author;

public interface A6Service extends CRUDDao<Author> {
	
	/**
	 * 返回A6的所有员工信息
	 * @return	List<Map<String,Object>>返回A6的所有员工信息
	 */
	public List<Map<String,Object>> getEmployeelist();
	
}
