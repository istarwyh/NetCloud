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
		<title>Unicorn Admin</title>
		<meta charset="UTF-8" />
        <meta name="viewport"  content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="../css/bootstrap.min.css" />
		<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="../css/fullcalendar.css" />	
		<link rel="stylesheet" href="../css/unicorn.main.css" />
		<link rel="stylesheet" href="../css/unicorn.grey.css" class="skin-color" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <style type="text/css">
    .aa {
		float:left;
		margin-right:15px;
		
		 }
   </style> 
    </head>
	<body style="background:#FFF">          
		<div id="sidebar">
			<a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
		
		
		</div>
		<div id="content" style="margin-left: 0px;">
	
			<div id="breadcrumb" style="padding-top: 7px;">
				<a href="admindex.html" title="返回首页" class="tip-bottom"><i class="icon-home"></i>主页</a>
				<a href="admin/file_userlist.action">文件管理</a><a href="javasrript:void(0)">用户文件列表</a>
			</div>
			<div class="container-fluid">
			

				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-picture"></i>
								</span>
								<h5>用户文件管理</h5>
							</div>
							<div class="widget-content">
                             
								<ul class="thumbnails">
						     
                                    <li style=" float:left">
                                      <table class="table table-bordered table-striped" id="show">
								<thead>
									<tr>
										<th width="10%">编号</th>
                                        <th style="width: 30%; text-align: center;">
                                                文件名
                                        </th>
                                        <th style="width: 20%; text-align: center;">
                                                大小
                                        </th>
                                        <th style="width: 50%; text-align: center;">
                                                操作
                                        </th>
									</tr>
								</thead>
								<tbody>
                                 <c:forEach items="${files}" var="file" varStatus="status">
                                    <tr>
                                        <td>${status.count }</td>
                                        <td>
                                            ${file.filename }
                                        </td>
                                        <td>
                                            ${file.size }
                                        </td>
                                        <td>
                                            <c:if test="${fn:contains(sessionScope.admin.access, dept.name.concat(':downloadfile')) }">
                                                <a href="admin/admindownloadfile.action?filepath=${file.url }&downloadName=${file.filename }">下载文件</a>
                                            </c:if>
                                            <c:if test="${sessionScope.admin.access.equals('all') }">
                                                <a href="admin/admindownloadfile.action?filepath=${file.url }&downloadName=${file.filename }">下载文件</a>
                                            </c:if>
                                        </td>
                                    </tr>
                                    </c:forEach>
						        </tbody>
                              </table>  
                             <div style=" margin:0 0 0 150px">
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
	            		<input type='text' name="currentPage" style=" width:50px; height:30px;"/>
	            	</div>
	            	<div class='aa'>
	            		<input type='submit' value='Go'/>
	            	</div>
            	</form>
            	</div>
                                    
                                    </li>
                           
								</ul>
                                
                                
                                 
							</div>
						</div>
					</div>
				</div>
				
				<div class="row-fluid" >
					<div id="footer" class="span12">
						2014 &copy; 软微云盘管理系统. Brought to you by <a href="http://www.nitcloud.com/" target="view_window">河南省软微计算机技术有限责任公司</a>
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
