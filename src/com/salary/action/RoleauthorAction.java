package com.salary.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.salary.entity.Author;
import com.salary.entity.Role;
import com.salary.entity.Role_author;
import com.salary.service.AuthorService;
import com.salary.service.RoleService;
import com.salary.service.Role_authorService;
import com.salary.util.AuthorJson;

/**
 * 角色权限处理action
 * @author 陈捷
 *
 */
@SuppressWarnings("serial")
public class RoleauthorAction extends ActionSupport {
	private Logger logger=Logger.getLogger(RoleauthorAction.class);
	
	private Role_authorService role_authorService;
	private AuthorService authorService;			
	private Role role;								//角色信息
	private Role_author role_author;				//角色权限
	private JSONObject jsonobj;						//json对象，传递给Easyui表格
	private String authorids;						//未选中的权限集合
	private RoleService roleService;				//角色服务
	private Integer id;								//主键
	private String errormessage;					//错误消息
	
	public String getErrormessage() {
		return errormessage;
	}

	public void setErrormessage(String errormessage) {
		this.errormessage = errormessage;
	}
	
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public Role_authorService getRole_authorService() {
		return role_authorService;
	}

	public void setRole_authorService(Role_authorService role_authorService) {
		this.role_authorService = role_authorService;
	}

	public AuthorService getAuthorService() {
		return authorService;
	}

	public void setAuthorService(AuthorService authorService) {
		this.authorService = authorService;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Role_author getRole_author() {
		return role_author;
	}

	public void setRole_author(Role_author role_author) {
		this.role_author = role_author;
	}

	public JSONObject getJsonobj() {
		return jsonobj;
	}

	public void setJsonobj(JSONObject jsonobj) {
		this.jsonobj = jsonobj;
	}

	public String getAuthorids() {
		return authorids;
	}

	public void setAuthorids(String authorids) {
		this.authorids = authorids;
	}
	
	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	/**
	 * 添加角色权限页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addRoleauthorPage(){
		return SUCCESS;
	}
	
	/**
	 * 修改角色权限页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editRoleauthorPage(){
		try {
			String hql="From Role_author where id="+id;
			role_author=role_authorService.get(hql, null);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 添加角色权限
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String addRoleauthor(){
		try {
			role_authorService.add(role_author);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 修改角色权限
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String editRoleauthor(){
		try {
			
			String sql="update role_author set isallow=0 where role_id="+role.getId();
			
			//如果是超级管理员，则直接将所有权限更新为1
			if(role.getId()==1){
				sql="update role_author set isallow=1 where role_id=1";
				role_authorService.executeSQL(sql);
				return SUCCESS;
			}
			
			role_authorService.executeSQL(sql);
			
			if(authorids!=null && !authorids.trim().isEmpty()){
				String sql2="update role_author set isallow=1 where role_id="+role.getId()
						+" and author_id in ("+authorids.substring(0,authorids.length()-1)+")";
				
				role_authorService.executeSQL(sql2);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
	
		return SUCCESS;
	}
	
	/**
	 * 删除角色权限
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String delRoleauthor(){
		return SUCCESS;
	}
	
	/**
	 * 显示角色权限列表页面
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String listRoleauthorPage(){
		try {
			String hql="From Role where id="+id;
			role=roleService.get(hql, null);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	/**
	 * 获取角色权限列表json数据
	 * @return		ACTION执行正常返回SUCCESS,没有权限和执行错误则返回ERROR
	 */
	public String getRoleauthorlist(){
		try {
			//检测权限表中是否有新增加的权限，有的话就自动添加到角色权限表中
			role_authorService.initRoleauthor();
					
			String hql="From Role_author where role_id="+id;
			List<Role_author> listrole_author=role_authorService.query(hql, null);
			List<AuthorJson> list_jsonauthor=new ArrayList<AuthorJson>();
			
			hql="From Author";
			List<Author> list_author=authorService.query(hql, null);
			Map<String,Author> authorMap=new HashMap<String,Author>();
			
			for(Author author:list_author){
				authorMap.put(Integer.toString(author.getId()), author);
			}
			
			for(Role_author role_author:listrole_author){
				Author author=new Author();
				AuthorJson authorjson=new AuthorJson();
				author=authorMap.get(Integer.toString(role_author.getAuthor_id()));
				authorjson.setId(author.getId());
				authorjson.setText(author.getName());
				authorjson.setChecked(false);
				
				//除了根目录展开外，tree子目录全部关闭
				if(author.getId()>1){
					authorjson.setPid(author.getPid());
					authorjson.setState("closed");
				}
				
				//如果取到isallow的值为1，则tree勾选框选中
				if(role_author.getIsallow()==1){
					authorjson.setChecked(true);
				}
				
				list_jsonauthor.add(authorjson);
			}
			
			
			Map<String,Object> jsonMap=new HashMap<String,Object>();
			jsonMap.put("data", list_jsonauthor);
			jsonobj=new JSONObject();
			jsonobj=JSONObject.fromObject(jsonMap);
		} catch (Exception e) {
			logger.error(e.getMessage());
			errormessage=e.getMessage();
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	
}
