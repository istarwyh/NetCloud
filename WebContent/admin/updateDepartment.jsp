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
	</script>
</head>
<body>



    <div class="page" style="width:825px">
        <div class="box mtop">
    <div class="rightbox" style="margin-left:0px">
                
<h2 class="mbx">部门管理 &gt; 修改部门</h2>

<div class="cztable">
	<form action="admin/department_updatedeal.action" method="post">
	<input type="hidden" name="id" value="${department.id }"/>
	<input type="hidden" name="oldname" value="${department.name }"/>
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td width="15%" align="right"><div align="right">部门名称： </div></td>
            <td><input id="Ctitle" size="20" name="name" value="${department.name }" class="input_2"/></td>
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
