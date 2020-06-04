<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<link rel="shortcut icon" href="images/logo.jpg" />
<base href="<%=basePath%>"></base>
<title>
	信息管理系统
</title>
	<link href="css/StudentStyle.css" rel="stylesheet" type="text/css" />
	<link href="css/jbox.css" rel="stylesheet" type="text/css" />
	<link href="css/ks.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="kindeditor/themes/default/default.css" />
	<script charset="utf-8" type="text/javascript" language="javascript" src="kindeditor/kindeditor-min.js"></script>
	<script charset="utf-8" type="text/javascript" language="javascript" src="kindeditor/lang/zh_CN.js"></script>
    <script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="js/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="js/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="js/Common.js" type="text/javascript"></script>
    <script src="js/Data.js" type="text/javascript"></script>
    <script src="js/changeOption.js" type="text/javascript"></script>
    <script src="js/rl.js" type="text/javascript"></script>
    <script>
		KindEditor.ready(function(K) {
		
		K.create('textarea[name="summary"]', {
		
		uploadJson : 'kindeditor/jsp/upload_json.jsp',
		
		                fileManagerJson : 'kindeditor/jsp/file_manager_json.jsp',
		
		                allowFileManager : true,
		
		                allowImageUpload : true, 
		
		autoHeightMode : true,
		
		afterCreate : function() {this.loadPlugin('autoheight');},
		
		afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息
		
		});
		
		});
		
		function tsubmit() {
			/* alert("wwww");  */
				var userName = $("#username").val();
				var password = $("#password").val();
				var l1 = $("#username").val().length;
				var l2 = $("#password").val().length; 
				var regUserName = /^[a-zA-Z0-9]+$/;
				 var regPassWord = /^[a-zA-Z0-9]+$/;
				if(userName == "")
				 {
					 alert("用户名不能为空");
					 return false;
				 }
				 if(password == "")
				 {
					 alert("密码不能为空");
					 return false;
				 }
				 if(!regUserName.test(userName) || l1<6 || l1>20){
					 alert("用户名应为6-20个字符且只能为字母和数字");
	                 return false;
				}
				 if(!regPassWord.test(password) || l2<6 || l2>20){
					 alert("确认密码应为6-20个字符且只能为字母和数字，（区分大小写）");
					 return false;
				}
			  /*  $("#form1").submit(); */
				
			}
	</script>
</head>
<body>



    <div class="page" style="width:825px">
        <div class="box mtop">
    <div class="rightbox" style="margin-left:0px">
                
<h2 class="mbx">用户管理 &gt; 修改用户</h2>

<div class="cztable">
	<form action="admin/user_updatedeal.action" method="post"  id="form1"  name="form1" onsubmit="return tsubmit()">
	<input type="hidden" name="id" value="${user.id }"/>
	<input type="hidden" name="key" value="${user.key }"/>
	<input type="hidden" name="iv" value="${user.iv }"/>
	<input type="hidden" name="oldname" value="${user.username }"/>
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td width="15%" align="right"><div align="right">用户名： </div></td>
            <td><input size="20" name="username" value="${user.username }" class="input_2" id="username" placeholder="6-20个字母或者数字" required/></td>
        </tr>
        <tr>
            <td width="15%" align="right"><div align="right">用户密码： </div></td>
            <td><input size="20" name="password" value="${password }" class="input_2" id="password" placeholder="6-20个字母或者数字" required/></td>
        </tr>
        <tr>
            <td width="15%" align="right"><div align="right">用户部门： </div></td>
            <td>
                <select id="Ctype" name="department">
                	<c:forEach items="${departmentList}" var="department">
                    	<c:if test="${user.department == department.id}">
							<option selected="selected" value="${department.id }">${department.name }</option>
						</c:if>
                	<c:if test="${user.department != department.id}">
							<option value="${department.id }">${department.name }</option>
						</c:if>
	                </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <div align="center" >
                    <input type="submit" value="提交" class="input2" />
                </div>
            </td>
        </tr>
    </table>
    </form>
</div>

    </div>
        </div>
    </div>

</body>
</html>
