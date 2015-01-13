package com.salary.interceptor;

import java.util.Map;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.salary.entity.Operator;

/**
 * 公共拦截器
 * 检测用户是否登录、是否有权限操作
 * @author 陈捷
 *
 */
public class commonInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 4519764622747737885L;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		//先检测用户是否登录
		ActionContext ac=invocation.getInvocationContext();
		Map session=ac.getSession();
		Operator operator=(Operator) session.get("operatorinfo");
		
		if(operator==null){
			return Action.INPUT;
		}
		
		//检测用户是否有权限
		String actionName=invocation.getProxy().getActionName();
		if(!actionName.toLowerCase().contains("page")){
			Map<String,Object> maprole_author=(Map<String, Object>) session.get("maprole_author");
			
			if(maprole_author==null || !maprole_author.containsKey(actionName)){
				System.out.println(operator.getName()+"-->无此权限:"+actionName);
				return Action.NONE;
			}
		};
		
		//允许执行
		return invocation.invoke();
	}

}
