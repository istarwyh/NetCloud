<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<base href="<%=basePath%>"></base>

<link rel="shortcut icon" href="images/ico.ico" />
<title>
奇观云盘后台管理系统
</title>
	<link href="css/StudentStyle.css" rel="stylesheet" type="text/css" />
	<link href="css/jbox.css" rel="stylesheet" type="text/css" />
	<link href="css/ks.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
	<script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="js/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="js/Common.js" type="text/javascript"></script>
    <script src="js/Data.js" type="text/javascript"></script>
    <script type="text/javascript">
		function fillZero(v){
			   if(v<10){
			       v='0'+v;
			   }
			   return v;
		}
		function testing()
		{
			var Week=['星期天','星期一','星期二','星期三','星期四','星期五','星期六'];
		    var d;
		    d = new Date();
		    w = Week[d.getDay()];
		    Y = d.getFullYear();
		    M = fillZero(d.getMonth()+1);
		    D = fillZero(d.getDate());
		    H = fillZero(d.getHours());
		    I = fillZero(d.getMinutes());
		    S = fillZero(d.getSeconds());
		    var showData = Y+'-'+M+'-'+D+' '+H+':'+I+':'+S;    
			return showData;
		}
		function showGMTDateTime() {
			$("#showtime").empty();
			$("#showtime").append(testing().toString());
			setTimeout('showGMTDateTime()', 1000);
		
		}
	</script>
    
    <script src="js/changeOption.js" type="text/javascript"></script>
    <script src="js/rl.js" type="text/javascript"></script>
    
    <%-- <c:if test="${requestScope.flag == 'true' }">
        <script type="text/javascript">
			 window.onload=function(){ 
				document.getElementById("iframe").src = 'admin/department_list.action';
			}
		</script>
    </c:if> --%>

</head>
<body onload="showGMTDateTime();">



    <div class="banner">
        <div class="bgh">
            <div class="page">
                <div id="logo" style="top:22px">
					<div>
						<span style="font-size:24px; color:#fff">奇观云盘后台管理系统</span>
					</div>
                </div>
                <div class="topxx" style="padding-top:22px; font-size:14px; letter-spacing: 1px;">
						${sessionScope.admin.username }，欢迎您！
						<a target="rightFrame" href="admin/admin_updateinfo.action">信息修改</a> 
						<a href="logout.action">安全退出</a>
                </div>
            </div>
        </div>
    </div>
    <div class="page">
        <div class="box mtop">
            <div class="leftbox">
                <div class="l_nav2">
	                <c:if test="${sessionScope.admin.access.equals('all') }">
		                <div class="ta1">
	                        <strong>部门管理</strong>
	                        <div class="leftbgbt">
	                        </div>
	                    </div>
	                    <div class="cdlist">
	                        <div>
	                            <a href="admin/department_list.action" target="rightFrame">部门列表</a></div>
	                    </div>
	                </c:if>
                    
                    <div class="ta1">
                        <strong>用户管理</strong>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
	                    <c:forEach items="${userManageList}" var="department">
	                    	<div><a href="admin/user_list.action?department=${department.id }" target="rightFrame">${department.name }用户列表</a></div>
	                    </c:forEach>
                    </div>
                    <div class="ta1">
                        <strong>文件管理</strong><div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                    	<c:forEach items="${fileManageList}" var="department">
                        	<div><a href="admin/file_userlist.action?department=${department.id }" target="rightFrame">${department.name }用户文件</a></div>
                        </c:forEach>
                    </div>
                   
                    <%-- <c:if test="${sessionScope.admin.access.equals('all') }">
	                    <div class="ta1">
	                        <strong>系统管理</strong><div class="leftbgbt2">
	                        </div>
	                    </div>
	                    <div class="cdlist">
	                        	<div><a href="admin/admin_list.action" target="rightFrame">管理员列表</a></div>
	                    </div>
                    </c:if> --%>
                    
                    <div class="ta1">
                        <strong>关于系统</strong><div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="state.jsp" target="_blank">权利义务</a></div>
                        <div>
                            <a href="services.jsp" target="_blank">服务协议</a></div>
                    </div>
                    
					<div class="ta1">
                        <span id="showtime" style=""></span>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightbox" style="height:700px">
				<iframe height="100%" width="100%"  id="iframe" style="border:0;" src="admin/welcome.jsp" name="rightFrame"></iframe>
            </div>
        </div>
		
		<div class="footer" style="margin-top:20px">
            <p>
                &copy;copyright 2015 奇观 版权所有 </p>
        </div>
    </div>
</body>
</html>
