<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" href="c../ss/selects.css">
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

   <style type="text/css">
    .aa {
		float:left;
		margin-right:15px;
		
		 }
   </style>
</head>
<body style="background:#FFF">
	<div id="sidebar">
		<a href="#" class="visible-phone"><i class="icon icon-home"></i>
			Dashboard</a>


	</div>
	<div id="content" style="margin-left: 0px;">
		<div id="breadcrumb" style="padding-top: 7px;">
			<a href="right_home.html" title="返回首页" class="tip-bottom"><i class="icon-home"></i>主页</a>
            <a href="javascript:void(0)" class="current">文件管理</a> 
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">                    
                       <div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-th"></i>
							</span>
							
						</div>
						<div class="widget-content nopadding">
                       <form action="admin/user_setaccessdeal.action" method="post">
	<input type="hidden" name="username" value="${username }"/>
	<input type="hidden" name="department" value="${user.department }"/>
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th width="10%">编号</th>
                                        <th style="width: 30%; text-align: center;">
                                                用户名
                                        </th>
                                        <th style="width: 20%; text-align: center;">
                                                所属部门
                                        </th>
                                        <th style="width: 50%; text-align: center;">
                                                操作
                                        </th>
										
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${userList}" var="user" varStatus="status">
	    	<tr>
	           <td>${status.count }</td>
                    <td>
                        ${user.username }
                    </td>
                    <td>
                        ${user.department }
                    </td>
                    <td>
                        <a href="admin/file_list.action?username=${user.username }&department=${dept.id }">
                      
                        查看文件</a>
                        
                    </td>
	        </tr>
    	</c:forEach>

                                 
								
								</tbody>
							</table>
                           
                                	  </p>
							
                         
						</div>
                        <div style=" margin:25px 0 25px 150px">
            	<div class='aa'>
            		<a href='admin/admin_list.action?currentPage=1' target='_self'>首页</a>
            	</div>
            	
            	<c:if test="${page.hasPrePage }">
            		<div class='aa'>
	            		<a href='admin/admin_list.action?currentPage=${currentPage - 1}' target='_self'>上一页</a>
	            	</div>
            	</c:if>
            	   
            	<c:forEach var="pg" begin="1" end="${page.totalPage}">   
                    <div class="aa">
	            		<a href='admin/admin_list.action?currentPage=${pg}' target='_self'>${pg}</a>
	            	</div>
                </c:forEach> 
            	
            	<c:if test="${page.hasNextPage }">
            		<div class='aa'>
	            		<a href='admin/admin_list.action?currentPage=${page.currentPage + 1}' target='_self'>下一页</a>
	            	</div>
            	</c:if>
            	
            	<div class='aa'>
            		<a href='admin/admin_list.action?currentPage=${page.totalPage }' target='_self'>尾页</a>
            	</div>
            	
            	<div class='aa'>总共<b>${page.totalCount }</b>条数据</div>
            	<div class='aa'>每页<b>${page.everyPage }</b>条数据</div>
            	<div class='aa'><b>${page.currentPage }</b>/${page.totalPage }</div>
            	
            	<form action="admin/admin_list.action" method="post" style="display:inline">
	            	<div class='SearchStyle aa'>
	            		<input type='text' name="currentPage" style=" width:50px; height:30px"/>
	            	</div>
	            	<div class='aa'>
	            		<input type='submit' value='Go'/>
	            	</div>
            	</form>
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
