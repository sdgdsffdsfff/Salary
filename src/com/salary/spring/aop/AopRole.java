package com.salary.spring.aop;

import java.util.HashMap;
import java.util.Map;

import org.aspectj.lang.ProceedingJoinPoint;
import com.salary.entity.Role;
import com.salary.service.impl.RoleServiceImpl;

@SuppressWarnings("unused")
public class AopRole {
	private RoleServiceImpl roleService;
	public RoleServiceImpl getRoleService() {
		return roleService;
	}
	public void setRoleService(RoleServiceImpl roleService) {
		this.roleService = roleService;
	}
	
	/**
	 * 添加角色检测
	 * @throws Throwable
	 */
	private void addCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		Role role=(Role) proceedingJoinPoint.getArgs()[0];
		System.out.println("addCheck执行了角色检测..");
		//先检测是否存在相同名称的角色
		String sql="select 1 from role where name=:name";
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("name", role.getName());
		int rol_count=roleService.getRowCountBySql(sql, params);
		
		if(rol_count>0){
			throw new Throwable();
		}
		
		proceedingJoinPoint.proceed();
	}
	
	
	/**
	 * 添加角色检测
	 * @throws Throwable
	 */
	private void editCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		Role role=(Role) proceedingJoinPoint.getArgs()[0];
		System.out.println("editCheck执行了角色检测..");
		//先检测角色名称和原来的是否一样，如果不一样，则要检测角色名称在表中是否重复
		Role tmpRole=roleService.getEntityById(role.getId(), "Role");
		if(!tmpRole.getName().equals(role.getName())){
			//先检测是否存在相同名称的角色
			String sql="select 1 from role where name=:name";
			Map<String,Object> params=new HashMap<String,Object>();
			params.put("name", role.getName());
			int rol_count=roleService.getRowCountBySql(sql, params);
			
			if(rol_count>0){
				throw new Throwable();
			}
		}
		
		
		proceedingJoinPoint.proceed();
	}
	
	
	/**
	 * 添加角色检测
	 * @throws Throwable
	 */
	private void delCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable{
		Role role=(Role) proceedingJoinPoint.getArgs()[0];
		System.out.println("delCheck执行了角色检测..");
		
		//先检测在操作员表中是否有引用该角色
		String sql="select 1 from Operator where role_id="+role.getId();
		int rol_count=roleService.getRowCountBySql(sql, null);
		
		if(rol_count>0){
			throw new Throwable();
		}
		
		//删除角色前先删除角色权限表下与此角色关联的信息
		String sql_del_role_author="delete from role_author where role_id="+role.getId();
		String sql_del_role_menu="delete from role_menu where role_id="+role.getId();
		roleService.executeSQL(sql_del_role_author);
		roleService.executeSQL(sql_del_role_menu);
		
		proceedingJoinPoint.proceed();
	}
	
	
}
