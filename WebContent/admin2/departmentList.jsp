<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>

	<!-- container-fluid -->

		<title>Unicorn Admin</title>
		<meta charset="UTF-8" />
		<link rel="stylesheet" href="../css/bootstrap.min.css" />
		<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="../css/fullcalendar.css" />	
		<link rel="stylesheet" href="../css/unicorn.main.css" />
		<link rel="stylesheet" href="../css/unicorn.grey.css" class="skin-color" />
        <link href="../css/update.css" rel="stylesheet" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <style type="text/css">
    .aa {
		float:left;
		margin-right:15px;
		
		 }
   </style> 
    </head>
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    
    <script>
   $(function () {
   $("#add").live("click",function () {
        $("#bg").css({
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
    $(".close").live("click",function () {
        $("#bg,.box1").css("display", "none");
    });
 });	
	 $(function () { 
	
	  $(".btns").live("click",function () {
		  /*va = $(this).parent().parent().find(".text").val();
		  alert(va + "dc");*/
		       $(this).parent().parent().find(".text").css("border","1px solid #CCC").css("cursor","");
			   $(this).parent().parent().find(".re").css("display","block");
			   
		   });
		   
		   $('.del-text').live('click',function(){  
         $(this).parent().parent().find(".text").css("border","none").css("cursor","pointer");
         $(this).parent().remove();
        });
		});
		$('.rt').live('click',function(){  
         $(this).parent().parent().find(".re").css("display","block");
       
       
	 });

</script>

	<body style="background:#FFF">          
		<div id="sidebar">
			<a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
		
		
		</div>

		
		<div id="content" style="margin-left: 0px; background:#FFF">
			
		
			<div id="breadcrumb" style="padding-top: 7px;">
				<a href="right_home.html" title="返回首页" class="tip-bottom"><i class="icon-home"></i>主页</a>
				<a href="#" class="current">部门管理</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					 
                     
                   <div class="span12">                    
                       <div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-th"></i>
							</span>
							<h5>部门列表</h5>
                          <!--  <input type="text" id="text_info" style="margin-top:3px" />-->
						    <button class="btn btn-danger"  id="add" >
					  				<i class="icon-edit"> </i> 创建部门
							</button>
                            
                        </div>
						<div class="widget-content nopadding">
                       
							<table class="table table-bordered table-striped" id="show">
								<thead>
									<tr>
										<th width="25%">部门名称</th>
                                        <th width="25%">部门管理者</th>
										<th width="50%">操作</th>
									</tr>
								</thead>
								<tbody>
						       
                                <c:forEach items="${departmentList}" var="department" varStatus="status">
									<tr >
                                    
										<td style="text-align:center">${status.count }</td>
                                        <form action="admin/department_updatedeal.action" method="post">
                                        <input type="hidden" name="id" value="${department.id }"/>
                                        <td style="text-align:center" class="tr1"><input type="text" size="30" class="text" style=" border:none; cursor:pointer; background-color:transparent; height:30px; float:left" name="name" value="${department.name }"/>
                                        <span style="height:30px;margin:5px 0 0 10px; display:none; float:left" class="re">
                                        <input type="submit" value="" style=" background:url(../images/true.png);height:21px; width:22px;border:0;" class="rt">
                                        <input type="button" class="del-text"   style="background:url(../images/close.png);height:21px; width:22px;border:0;margin-left:3px;" ></span>
                                        
                                        
                                        </td>
                                        </form>
										<td style="text-align:center">
											<button class="btn btn-danger"
												onclick="window.location.href='admin/department_delete.action?id=${department.id }'">
												<i class="icon-remove icon-white"> </i> 删除
											</button>
                                            <span class="btns">
                                          <button class="btn btn-danger" >
												<i class="icon-pencil icon-white"> </i>修改
											</button>
                                          </span>
										</td>
									</tr>
                                 </c:forEach>
                        
								</tbody>
                                
							</table>
                         
						</div>
                        <div style=" width:100%; margin:25px 0 100px 150px"; align="center">
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
	            		<input type='text' name="currentPage" style=" width:50px;height:30px"/>
	            	</div>
	            	<div class='aa'>
	            		<input type='submit' value='Go'/>
	            	</div>
            	</form>
            	</div>
					</div>
				</div>
				<div class="row-fluid">
					<div id="footer" class="span12">
						2014 &copy;   . Brought to you by <a href="http://www.nitcloud.com/" target="view_window">河南省软微计算机技术有限责任公司</a>
					</div>
				</div>
			</div>
		</div>
		</div>
            <div id="bg"></div>
    <div class="box1" style="display:none">
    <h2><span style=" margin-left:25px">添加部门</span><a href="#" class="close" style="float:right"><img src="../images/cross1.png"></a></h2>
    <hr style="background:#333"><div style=" width:350px; margin: 0 auto">

   <form action="admin/department_adddeal.action" method="post">
 
   <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部门名：
      <input name="name" type="text" style=" height:30px"/></label>
      
   <input type="submit" value="确定并退出" style=" margin-left:90px; margin-right:15px; margin-bottom:25px" onclick="javascript:window.close()" class="btn btn-danger"/>
   <input  type="reset" value="重置" class="btn btn-danger" style=" margin-bottom:25px;"/>
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
