
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>

<title>南工星云云盘管理系统</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="../css/fullcalendar.css" />
<link rel="stylesheet" href="../css/unicorn.main.css" />
<link rel="stylesheet" href="../css/ss.css" />
<link rel="stylesheet" href="../css/unicorn.grey.css" class="skin-color" />
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script src="../js/tupian.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">
	$(document).ready(function() {
		var height = document.documentElement.clientHeight - 42;
		var frameheight = document.documentElement.clientHeight - 128;

		document.getElementById("content").style.height = height + "px";
		document.getElementById("frame").style.height = frameheight + "px";
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$(".ss li").click(function(){
			$(this).addClass("cli").siblings().removeClass();

		});
		
	});

</script>
<script type="text/javascript" src="../js/change.js"></script>

</head>

<body onload="showGMTDateTime();">
	
	<div id="header">
		<h1>
			<a href="./dashboard.jsp"></a>
		</h1>
	</div>
	<div id="user-nav" class="navbar navbar-inverse">
		<ul class="nav btn-group">

			<li class="btn btn-inverse"><a title="" href="#"><i
					class="icon icon-user"></i> <span class="text">${sessionScope.admin.username }</span></a></li>
                    <li class="btn btn-inverse"><a target="rightFrame" href="admin/admin_updateinfo.action?id=${sessionScope.admin.id }">信息修改</a> </li>
			<li class="btn btn-inverse"><a href="logout.action"><i
					class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
		</ul>
	</div>

	<div id="sidebar" >
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>Dashboard</a>
		<ul>
			<li id="menu1" class="active">
                <a target="rightFrame" href="right_home.html">
                <i class="icon icon-home"></i> <span>主页</span></a></li>
          
          <c:if test="${!sessionScope.admin.access.equals('all') }">
             <li id="menu7">
					 <a href="admin/department_list.action" target="rightFrame">
                   
                    <i class="icon icon-pencil" ></i> <span>部门管理</span></a>
              
		    </li> 
           </c:if>
			<li id="menu2"><a  class="a1" href="javascript:void(0)">
          
             <i class="icon icon-th"></i>
					<span>用户管理</span><img src="../res/static/images/pull1.png" style=" margin-left:80px;"></a>
                   
                    <ul class="ss" id="m2">
                     <c:forEach items="${userManageList}" var="department">
                       <li><a href="admin/user_list.action?department=${department.id }" target="rightFrame">${department.name }用户列表</a></li>
                     </c:forEach>
                    </ul>
            </li>
			
			<li id="menu3"><a  class="a1" href="javascript:void(0)">
        
             <i class="icon icon-th-list"></i> <span>文件管理</span><img src="../res/static/images/pull1.png" style=" margin-left:80px;"></a>
                     <ul class="ss" id="m3">
                     <c:forEach items="${fileManageList}" var="department">
                       <li><a href="admin/file_userlist.action?department=${department.id }" target="rightFrame">${department.name }用户文件</a></li>
                     </c:forEach>
                    </ul>
            </li>
           
			<li id="menu8">
           <c:if test="${sessionScope.admin.access.equals('all') }">
            <a  class="a1" href="javascript:void(0)"> <i class="icon icon-adjust"></i>
					<span>系统管理</span><img src="../res/static/images/pull1.png" style=" margin-left:80px;"></a>
                    <ul class="ss" id="m4">
                     
                       <li><a href="admin/admin_list.action" target="rightFrame">管理员列表</a></li>
                     
                    </ul>
             </c:if>
            </li>
          
			<li id="menu4"><a target="rightFrame" href="admin/newstype_list.action"> <i class="icon icon-signal"></i>
					<span>设置说明</span></a></li>
			<li id="menu5"><a target="rightFrame" href="admin/news_list.action"> <i class="icon icon-tint"></i>
					<span>权利义务</span></a></li>
           
			<li id="menu6"><a target="rightFrame" href="admin/news_list.action"> <i class="icon icon-inbox"></i>
					<span>关于我们</span></a>
            </li>

			
		</ul>
       
	</div>
	<div id="content" style="padding-bottom: 0px;">


		<div id="content-header">

			<h1>南工星云云盘后台管理系统，欢迎您的登陆！</h1>

		</div>
		<div id="breadcrumb">
			
		</div>
		<div class="container-fluid"
			style="padding-right: 0px; padding-left: 0px">


			<div class="row-fluid" style="margin-top: 0px">

				<iframe id="frame" height="500px" width="100%" border="0"
					frameborder="0" src="right_home.html" name="rightFrame"></iframe>

			</div>

		</div>


	</div>


	<script src="../js/excanvas.min.js"></script>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/jquery.ui.custom.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.flot.min.js"></script>
	<script src="../js/jquery.flot.resize.min.js"></script>
	<script src="../js/jquery.peity.min.js"></script>
	<script src="../js/fullcalendar.min.js"></script>
	<script src="../js/unicorn.js"></script>
	<script src="../js/unicorn.dashboard.js"></script>
	
</body>


</html>
