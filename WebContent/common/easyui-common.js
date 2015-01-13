/**
 * 用于EasyUI的datebox控件
 * 格式化日期控件1
 */
function defaultdate(date){
	var y=date.getFullYear();
	var m=date.getMonth()+1;
	var d=date.getDate();
	return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
}

/**
 * 用于EasyUI的datebox控件
 * 格式化日期控件2
 */
function defaultparser(s){
	if(!s) return new Date();
	var ss=(s.split('-'));
	var y=parseInt(ss[0],10);
	var m=parseInt(ss[1],10);
	var d=parseInt(ss[2],10);
	if(!isNaN(y) && !isNaN(m) && !isNaN(d)){
		return new Date(y,m-1,d);
	}else{
		return new Date();
	}
}


/**
 * 取得当前时间 戳
 */
function getTimeStamp()  
{  
    // 声明变量。  
    var d, s;  
    // 创建 Date 对象。  
    d = new Date();  
    s = d.getFullYear() + "-";  
    s += ("0"+(d.getMonth()+1)).slice(-2) + "-";  
    s += ("0"+d.getDate()).slice(-2) + " ";  
    s += ("0"+d.getHours()).slice(-2) + ":";  
    s += ("0"+d.getMinutes()).slice(-2) + ":";  
    s += ("0"+d.getSeconds()).slice(-2) + ".";  
    s += ("00"+d.getMilliseconds()).slice(-3);  
    return s;  
}

/**
 * 格式化日期(格式化Easyui的date类型object)
 * @param val
 * @returns {String}
 */
function formatTime(val) {
	var year=parseInt(val.year)+1900;
	var month=(parseInt(val.month)+1);
	month=month>9?month:('0'+month);
	var date=parseInt(val.date);
	date=date>9?date:('0'+date);
	var hours=parseInt(val.hours);
	hours=hours>9?hours:('0'+hours);
	var minutes=parseInt(val.minutes);
	minutes=minutes>9?minutes:('0'+minutes);
	var seconds=parseInt(val.seconds);
	seconds=seconds>9?seconds:('0'+seconds);
	var time=year+'-'+month+'-'+date;
	return time;
}

/**
 * 生成随机字符串
 * @param dstObj
 * @param charsLength
 * @param chars
 */
function randomString(charsLength) { 
    var length=charsLength;
    var chars="abcdefghijkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789";
    var randomChars="";

    for(var x=0; x<length; x++) {
        var i=Math.floor(Math.random()*chars.length);
        randomChars+=chars.charAt(i);
    }
    
    return randomChars;
}


/**
 * 用于添加tab页面
 * @param tabId
 * @param tabTitle
 * @param url
 */
function addTab(tabId,tabTitle,url){
	var t=$('#centerTab');
	//如果tabid不存在则添加一个tab
	if(!t.tabs('exists',tabTitle)){
		var tabName=tabId;
		$('#centerTab').tabs('add',{
			title:tabTitle,
			closable:true,
			cache:false,
			//注：使用iframe即可防止同一个页面出现js和css冲突的问题
			content:'<iframe name="'+tabName+'"id="'+tabId+'"src="'+url+'" width="100%" height="100%" frameborder="0" scrolling="auto" ></iframe>'
		});
	}else{
		//如果存在tab，则切换到指定的tab
		t.tabs('select',tabTitle);
	}
}

/*设置鼠标右键无菜单*/
$(document).on('contextmenu',function (e){
	e.preventDefault();
});


/**
 * 对Easyui的校验进行扩展
 */
$.extend($.fn.validatebox.defaults.rules, {
    validDate: {//检测日期是否合法
        validator: function (value){
        	var regexp=/^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;
            return value.match(regexp);
        },
        message: '请输入正确的日期.'  
    },
    validFloat:{//检测是否为浮点数
    	validator:function (value){
    		var v1=value.search(/[^\d.]/g);
    		return (v1==-1);
    	},
    	message: '请输入正确的数字.'
    },
    equals:{//检测两个值是否一致
        validator: function(value,param){
            return value == $(param[0]).val();
        },
        message: '两次输入内容不一致.'  
    } 
});


/**
 * 格式化浮点数，保留2位小数
 * @param x
 */
function convertFloat(x){
	var f_x=parseFloat(x);
	if(isNaN(f_x)){
		return 0;
	}
	
	f_x=Math.round(f_x*100)/100;
	return f_x;
}

/**
 * 提示功能更新中
 */
function functionUpdate(){
	$.messager.show({
		title:'提示',
		msg:'功能更新中...',
		timeout:3000,
	});
}


/**
 * 获取浏览器版本
 */
function getBrowserInfo()
{
  var agent=navigator.userAgent.toLowerCase();
  var regStr_ie=/msie [\d.]+;/gi;
  var regStr_ff=/firefox\/[\d.]+/gi;
  var regStr_chrome=/chrome\/[\d.]+/gi;
  var regStr_saf=/safari\/[\d.]+/gi;
  //IE
  if(agent.indexOf("msie")>0){
    return agent.match(regStr_ie);
  }

  //firefox
  if(agent.indexOf("firefox")>0){
    return agent.match(regStr_ff);
  }

  //Chrome
  if(agent.indexOf("chrome")>0){
    return agent.match(regStr_chrome);
  }

  //Safari
  if(agent.indexOf("safari")>0 && agent.indexOf("chrome")<0){
    return agent.match(regStr_saf);
  }
}

/**
 * 检测浏览器版本，IE9及以上的为5，IE8及一下的会返回false
 * 
 */
function checkBrowser(){
	//检测浏览器的版本，5以上的为新浏览器即IE9及以上
	var b_version=navigator.appVersion;
	var version=parseFloat(b_version);
	
	if(version<5){
		return false;
	}
	
	return true;
}

/**
 * easyui 扩展tree 为 ztree(id, pid)的扁平数据结构集 
 * 里增加了三个属性，可以指定idFiled，textFiled和parentField
	 实例:
	  $(function(){
			$('#tt3').tree({
				checkbox: true,
				url: 'tree_data_simp.php',
				parentField:"pid",
				textFiled:"name",
				idFiled:"key"
			});
		});
 */
$.fn.tree.defaults.loadFilter = function (data, parent) {
	var opt = $(this).data().tree.options;
	var idFiled,
	textFiled,
	parentField;
	if (opt.parentField) {
		idFiled = opt.idFiled || 'id';
		textFiled = opt.textFiled || 'text';
		parentField = opt.parentField;
		
		var i,
		l,
		treeData = [],
		tmpMap = [];
		
		for (i = 0, l = data.length; i < l; i++) {
			tmpMap[data[i][idFiled]] = data[i];
		}
		
		for (i = 0, l = data.length; i < l; i++) {
			if (tmpMap[data[i][parentField]] && data[i][idFiled] != data[i][parentField]) {
				if (!tmpMap[data[i][parentField]]['children'])
					tmpMap[data[i][parentField]]['children'] = [];
				data[i]['text'] = data[i][textFiled];
				tmpMap[data[i][parentField]]['children'].push(data[i]);
			} else {
				data[i]['text'] = data[i][textFiled];
				treeData.push(data[i]);
			}
		}
		return treeData;
	}
	return data;
};