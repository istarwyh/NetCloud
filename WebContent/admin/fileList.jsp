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
       	 文件管理 &gt; <a>文件列表</a>
    </h2>
    <div class="feilei">
        <a><strong>文件列表</strong></a>
    </div>
    <div class="fllist">
        
        <div class="cztable">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:center;">
                
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
	                    	<a href="downloadfilebyadmin?filepath=${file.url }&downloadName=${file.filename }">下载文件</a>
	                    </c:if>
	                    <c:if test="${sessionScope.admin.access.equals('all') }">
	                    	<a href="downloadfilebyadmin?filepath=${file.url }&downloadName=${file.filename }">下载文件</a>
	                    </c:if>
                    </td>
                </tr>
                </c:forEach>
            </table>
            <%-- <div class='MainStyle'>
            	<div class=''>
            		<a href='admin/admin_list.action?currentPage=1' target='_self'>首页</a>
            	</div>
            	
            	<c:if test="${page.hasPrePage }">
            		<div class=''>
	            		<a href='admin/admin_list.action?currentPage=${currentPage - 1}' target='_self'>上一页</a>
	            	</div>
            	</c:if>
            	
            	<c:forEach var="pg" begin="1" end="${page.totalPage}">   
                    <div>
	            		<a href='admin/admin_list.action?currentPage=${pg}' target='_self'>${pg}</a>
	            	</div>
                </c:forEach> 
            	
            	<c:if test="${page.hasNextPage }">
            		<div class=''>
	            		<a href='admin/admin_list.action?currentPage=${page.currentPage + 1}' target='_self'>下一页</a>
	            	</div>
            	</c:if>
            	
            	<div class=''>
            		<a href='admin/admin_list.action?currentPage=${page.totalPage }' target='_self'>尾页</a>
            	</div>
            	
            	<div class=''>总共<b>${page.totalCount }</b>条数据</div>
            	<div class=''>每页<b>${page.everyPage }</b>条数据</div>
            	<div class=''><b>${page.currentPage }</b>/${page.totalPage }</div>
            	
            	<form action="admin/admin_list.action" method="post" style="display:inline">
	            	<div class='SearchStyle'>
	            		<input type='text' name="currentPage"/>
	            	</div>
	            	<div class=''>
	            		<input type='submit' value='Go'/>
	            	</div>
            	</form>
            	</div> --%>
        </div>
    </div>

            </div>
        </div>
    </div>

</body>
</html>
