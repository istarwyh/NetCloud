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
<title>软微云盘管理系统</title>
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

<script>


$(function () {
    $("#show").live("click",function () {
        $("#bg1").css({
            display: "block", height: $(document).height()
        });
        var $box = $('.box1');
        $box.css({
            //设置弹出层距离左边的位置
            left: ($("body").width() - $box.width()) / 2 - 20 + "px",
            //设置弹出层距离上面的位置
            top: ($(window).height() - $box.height()) / 4 + $(window).scrollTop() + "px",
            display: "block"
        });
    });
    //点击关闭按钮的时候，遮罩层关闭
    $(".close1").live("click",function () {
        $("#bg1,.box1").css("display", "none");
    });
	
});
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
            <a href="#" class="current">用户管理</a>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">                    
                       <div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-th"></i>
							</span>
							<h5>用户列表</h5>
                            <!-- <input type="text" id="text_info" style="margin-top:5px" />-->
						    <button class="btn btn-danger" id="show">
					  				<i class="icon-edit"> </i> 添加用户
							</button>
                            <p style="float:right; padding-top:9px">共1个人</p>
						</div>
						<div class="widget-content nopadding">
                       
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th width="20%">用户名</th>
										<!--/*<th width="13%">密码</th>*/-->
										<th width="45%">所属部门</th>
										<th width="35%">操作</th>
									</tr>
								</thead>
								<tbody>
								
                                  <c:forEach items="${userList}" var="user" varStatus="status">
									<tr>
										<td style="text-align:center"> ${user.username }</td>
										<td>
											${user.department }
									    </td>
										<td style="text-align:center">
                                           <c:if test="${fn:contains(sessionScope.admin.access, dept.name.concat(':update')) }">
                                           <button class="btn btn-danger"
												onclick="window.location.href='admin/user_update.action?id=${user.id }'">
                                              
                                               
												<i class="icon-leaf icon-white"> </i> 修改
											</button>
                                            </c:if>
                                            <c:if test="${fn:contains(sessionScope.admin.access, dept.name.concat(':delete')) }">
                                        	<button class="btn btn-danger"
												onclick="window.location.href='admin/user_delete.action?id=${user.id }&department=${user.department }'">
												<i class="icon-remove icon-white"> </i> 删除
											</button>
                                            </c:if> 
                                            <c:if test="${sessionScope.admin.access.equals('all') }">
                                            <button class="btn btn-danger"
												onclick="window.location.href='admin/user_update.action?id=${user.id }'">
												<i class="icon-leaf icon-white"> </i> 修改
											</button>
                                            <button class="btn btn-danger"
												onclick="window.location.href='admin/user_delete.action?id=${user.id }&department=${user.department }'">
												<i class="icon-remove icon-white"> </i> 删除
											</button>
                                            <span class="btns">
                                            <button class="btn btn-danger" 
                                            onclick="window.location.href='admin/user_setaccess.action?username=${user.username }'">
                                           
												<i class="icon-leaf icon-white"> </i>权限设置
											</button>
                                          
                                            </span>
                                            </c:if>
                                          
										</td>
									</tr>
									 </c:forEach>
								</tbody>
							</table>
                              </p>
                            
                                	
							
                         
						</div>
                        <div class='MainStyle' style=" margin:25px 0 20 150px;">
            	<div class='aa'>
            		<a href='admin/admin_list.action?currentPage=1' target='_self'>首页</a>
            	</div>
            	
            	<c:if test="${page.hasPrePage }">
            		<div class='aa'>
	            		<a href='admin/admin_list.action?currentPage=${currentPage - 1}' target='_self'>上一页</a>
	            	</div>
            	</c:if>
            	
            	<c:forEach var="pg" begin="1" end="${page.totalPage}">   
                    <div class='aa'>
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
	            		<input type='text' name="currentPage" style="  width:50px; height:30px"/>
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
					2014 &copy; 软微云盘管理系统. Brought to you by <a
						href="http://www.nitcloud.com/" target="view_window">河南省软微计算机技术有限责任公司</a>
				</div>
			</div>
		</div>
	</div>
    

 <div id="bg1"></div>
    <div class="box1" style="display:none">
    <h2><span style=" margin-left:25px">添加用户</span><a href="#" class="close1" style="float:right"><img src="../images/cross1.png"></a></h2>
    <hr style="background:#333"><div style=" width:350px; margin: 0 auto">
   <form action="admin/user_adddeal.action" method="post">
    <label>用户姓名：
      <input name="uername" type="text" style=" height:30px" /></label>
       <label>用户密码：
      <input name="password" type="password" style=" height:30px"/></label>
      <label>所属部门：
      <select  name="department">
                	<c:forEach items="${departmentList}" var="department" varStatus="status">
                		<option value="${department.id }">${department.name }</option>
                	</c:forEach>
                </select>
      </label>
       <input type="submit" value="确定并退出" style=" margin-left:75px; margin-right:15px; margin-bottom:25px" onclick="javascript:window.close()" class="btn btn-danger"/>
  
    </form>
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
