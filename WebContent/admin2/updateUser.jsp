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
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="../css/fullcalendar.css" />
<link rel="stylesheet" href="../css/unicorn.main.css" />
<link rel="stylesheet" href="../css/unicorn.grey.css" class="skin-color" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="../css/selects.css">
<link href="../css/click.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="../css/update.css" />
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script> 

<script type="text/javascript">
$(function(){
	var l=0;
	$('.navs_li').click(function(){
		$(this).siblings().removeClass('on');
		$(this).addClass('on');
		var index = $(".navs_li").index($(this));
		$(".widget-box").hide();
		$(".widget-box").eq(index).show();
	});	
})
</script>


</head>
<body style="background:#FFF">
	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>
			Dashboard</a>


	</div>
	<div id="content" style="margin-left: 0px;">
		<div id="breadcrumb" style="padding-top: 7px;">
			<a href="right_home.html" title="返回首页" class="tip-bottom"><i class="icon-home"></i>主页</a>
            <a href="userList.jsp" class="current">用户管理</a> &gt; 用户信息修改
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">                    
                       <div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-th"></i>
							</span>
							<h5>部门权限列表</h5>
						</div>
						<div class="widget-content nopadding">
                       <form action="admin/user_updatedeal.action" method="post">
	<input type="hidden" name="id" value="${user.id }"/>
	<input type="hidden" name="key" value="${user.key }"/>
	<input type="hidden" name="iv" value="${user.iv }"/>
	<input type="hidden" name="userdir" value="${user.userdir }"/>
    <table class="table table-bordered table-striped">
        <tr>
            <td width="15%" align="right"><div align="right">用户姓名： </div></td>
            <td><input  size="20" name="username" value="${user.username }"  style=" height:30px"/></td>
        </tr>
        <tr>
            <td width="15%" align="right"><div align="right">用户密码： </div></td>
            <td><input  size="20" name="password" value="${password }" style=" height:30px"/></td>
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
                     <button class="btn btn-danger"  type="submit">
												<i class="icon-leaf icon-white"> </i>提交
				 </button>
                </div>
            </td>
        </tr>
    </table>
    </form>
                                	  </p>
							
                         
						</div>
					</div>
				</div>
                
                         
			</div>
			<div class="row-fluid" style="width: 100%; height: 80%">
				<img alt="" src="../img/user_team.jpg"
					style="width: 100%; height: 20%;">
			</div>
			<div class="row-fluid">
				<div id="footer" class="span12" style="padding: 60px;">
					2014 &copy; 南工星云云盘管理系统. Brought to you by <a
						href="http://www.nitcloud.com/" target="view_window">河南省南工星云计算机技术有限责任公司</a>
				</div>
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
