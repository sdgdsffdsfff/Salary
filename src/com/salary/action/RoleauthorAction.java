package com.salary.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	private Role_authorService role_authorService;
	private AuthorService authorService;			
	private Role role;								//角色信息
	private Role_author role_author;				//角色权限
	private JSONObject jsonobj;						//json对象，传递给Easyui表格
	private String authorids;						//未选中的权限集合
	private RoleService roleService;				//角色服务
	private Integer id;								//主键
	
	
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
	 * @return
	 */
	public String addRoleauthorPage(){
		return SUCCESS;
	}
	
	/**
	 * 修改角色权限页面
	 * @return
	 */
	public String editRoleauthorPage(){
		String hql="From Role_author where id="+id;
		role_author=role_authorService.get(hql, null);
		
		return SUCCESS;
	}
	
	/**
	 * 显示角色权限列表页面
	 * @return
	 */
	public String listRoleauthorPage(){
		String hql="From Role where id="+id;
		role=roleService.get(hql, null);
		
		return SUCCESS;
	}
	
	/**
	 * 添加角色权限
	 * @return
	 */
	public String addRoleauthor(){
		role_authorService.add(role_author);
		
		return SUCCESS;
	}
	
	/**
	 * 修改角色权限
	 * @return
	 */
	public String editRoleauthor(){
		if(authorids!=null && !authorids.trim().isEmpty()){
			
			String sql="update Role_author set isallow=0 where role_id="+role.getId();
			role_authorService.executeSQL(sql);
			
			String sql2="update Role_author set isallow=1 where role_id="+role.getId()
					+" and author_id in ("+authorids.substring(0,authorids.length()-1)+")";
			
			role_authorService.executeSQL(sql2);
		}else{
			String sql="update Role_author set isallow=0 where role_id="+role.getId();
			role_authorService.executeSQL(sql);
		}
	
		return SUCCESS;
	}
	
	/**
	 * 删除角色权限
	 * @return
	 */
	public String delRoleauthor(){
		return SUCCESS;
	}
	
	/**
	 * 获取角色权限列表json数据
	 * @return
	 */
	public String getRoleauthorlist(){
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
			if(author.getId()>1){
				authorjson.setPid(author.getPid());
				authorjson.setState("closed");
			}
			authorjson.setText(author.getName());
			
			authorjson.setChecked(false);
			if(role_author.getIsallow()==1){
				authorjson.setChecked(true);
			}
			
			
			list_jsonauthor.add(authorjson);
		}
		
		
		Map<String,Object> jsonMap=new HashMap<String,Object>();
		jsonMap.put("data", list_jsonauthor);
		jsonobj=new JSONObject();
		jsonobj=JSONObject.fromObject(jsonMap);
		
		return SUCCESS;
	}
	
	
}
