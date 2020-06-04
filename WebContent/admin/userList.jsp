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
<link rel="shortcut icon" href="images/logo.jpg" />
<base href="<%=basePath%>"></base>
<title>
	信息管理系统
</title>
	<link href="css/StudentStyle.css" rel="stylesheet" type="text/css" />
	<link href="css/jbox.css" rel="stylesheet" type="text/css" />
	<link href="css/ks.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="js/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="js/jquery.jBox-zh-CN.js" type="text/javascript"></script>
    <script src="js/Common.js" type="text/javascript"></script>
    <script src="js/Data.js" type="text/javascript"></script>
    <script src="js/changeOption.js" type="text/javascript"></script>
    <script src="js/rl.js" type="text/javascript"></script>
</head>
<body>



    <div class="page" style="width:825px">
        <div class="box mtop">
            <div class="rightbox" style="margin-left:0px">
                
    <h2 class="mbx">
       	 用户管理 &gt; <a href="admin/user_list.action?department=${dept.id }">${dept.name }用户列表</a>
    </h2>
    <div class="feilei">
        <a><strong>用户列表</strong></a>
        <c:if test="${fn:contains(sessionScope.admin.access, dept.name.concat(':add')) }">
       		<a href="admin/user_add.action?department=${dept.id }" style="margin-left:20px; padding: 2px 6px; border: 1px #4890cf solid; background: #fff; color: #000;"><strong>添加用户</strong></a>
       	</c:if>
       	<c:if test="${sessionScope.admin.access.equals('all') }">
       		<a href="admin/user_add.action?department=${dept.id }" style="margin-left:20px; padding: 2px 6px; border: 1px #4890cf solid; background: #fff; color: #000;"><strong>添加用户</strong></a>
       	</c:if>
    </div>
    <div class="fllist">
        
        <div class="cztable">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:center;">
                
                <tr>
                <th width="10%">编号</th>
                    <th style="width: 30%; text-align: center;">
                       		用户名
                    </th>
                    <th style="width: 20%; text-align: center;">
                        	用户权限
                    </th>
                    <th style="width: 50%; text-align: center;">
                        	操作
                    </th>
                </tr>
           
                <c:forEach items="${userList}" var="user" varStatus="status">
                <tr>
                	<td>${status.count }</td>
                    <td>
                        ${user.username }
                    </td>
                    <td>
                        <c:if test="${fn:length(user.access) > 0 }">
                        	<span style="color:green">管理员</span>
                        </c:if>
                        <c:if test="${fn:length(user.access) == 0 }">
                        	用户
                        </c:if>
                    </td>
                    <td>
                    	<c:if test="${fn:contains(sessionScope.admin.access, dept.name.concat(':update')) }">
                    		<a href="admin/user_update.action?id=${user.id }">修改</a>&nbsp;&nbsp;
                    	</c:if>
                    	<c:if test="${fn:contains(sessionScope.admin.access, dept.name.concat(':delete')) }">
                    		<a href="admin/user_delete.action?id=${user.id }&department=${user.department }">删除</a>&nbsp;&nbsp;
                    	</c:if> 
                    	<c:if test="${sessionScope.admin.access.equals('all') }">
	                    	<a href="admin/user_update.action?id=${user.id }">修改</a>&nbsp;&nbsp;
	                        <a href="admin/user_delete.action?id=${user.id }&department=${user.department }">删除</a>&nbsp;&nbsp;
	                        <a href="admin/user_setaccess.action?username=${user.username }">修改权限</a>
                    	</c:if>
                    </td>
                </tr>
                </c:forEach>
            </table>
            <div class='MainStyle'>
            	<div class=''>
            		<a href='admin/user_list.action?currentPage=1&department=${department }' target='_self'>首页</a>
            	</div>
            	
            	<c:if test="${page.hasPrePage }">
            		<div class=''>
	            		<a href='admin/user_list.action?currentPage=${currentPage - 1}&department=${department }' target='_self'>上一页</a>
	            	</div>
            	</c:if>
            	
            	<c:forEach var="pg" begin="1" end="${page.totalPage}">   
                    <div>
	            		<a href='admin/user_list.action?currentPage=${pg}&department=${department }' target='_self'>${pg}</a>
	            	</div>
                </c:forEach> 
            	
            	<c:if test="${page.hasNextPage }">
            		<div class=''>
	            		<a href='admin/user_list.action?currentPage=${page.currentPage + 1}&department=${department }' target='_self'>下一页</a>
	            	</div>
            	</c:if>
            	
            	<div class=''>
            		<a href='admin/user_list.action?currentPage=${page.totalPage }&department=${department }' target='_self'>尾页</a>
            	</div>
            	
            	<div class=''>总共<b>${page.totalCount }</b>条数据</div>
            	<div class=''>每页<b>${page.everyPage }</b>条数据</div>
            	<div class=''><b>${page.currentPage }</b>/${page.totalPage }</div>
            	
            	<form action="admin/user_list.action" method="post" style="display:inline">
            		<input type="hidden" name="department" value="${department }"/>
	            	<div class='SearchStyle'>
	            		<input type='text' name="currentPage"/>
	            	</div>
	            	<div class=''>
	            		<input type='submit' value='Go'/>
	            	</div>
            	</form>
            	</div>
        </div>
    </div>

            </div>
        </div>
    </div>

</body>
</html>
