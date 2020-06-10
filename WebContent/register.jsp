<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">

<meta name="renderer" content="webkit">

<link rel="icon" href="images/ico.ico" sizes="16x16">
<link rel="icon" href="images/ico.ico" sizes="32x32">


<title>软微云盘 - 免费注册软微帐号</title>
<script type="text/javascript" async
	src="./软微云盘 - 免费注册软微帐号_files/ga.js"></script>
<script>
	var G_start_time = new Date;
</script>

<!--[if (lt IE 8.0)]><link type="text/css" rel="stylesheet" href="http://s6.qhimg.com/static/c651fe0a9dc58080/pan-reg.src.css"><![endif]-->
<!--[if (!IE)|(gte IE 8.0)]><!-->
<link type="text/css" rel="stylesheet"
	href="css/pan-reg.src_datauri.css">
<!--<![endif]-->
<!--[if (lt IE 8.0)]><link type="text/css" rel="stylesheet" href="http://s6.qhimg.com/static/539a8a2bf7feffe3/web/reg-common.css"><![endif]-->
<!--[if (!IE)|(gte IE 8.0)]><!-->
<link type="text/css" rel="stylesheet" href="css/reg-common_datauri.css">

<!--<![endif]-->
<script type="text/javascript" src="./软微云盘 - 免费注册软微帐号_files/1141.js"></script>

<!--[if lt IE 9]>
<script type="text/javascript">(function(){
	var e = "abbr,article,aside,audio,bb,canvas,datagrid,datalist,details,dialog,eventsource,figure,footer,hgroup,header,mark,menu,meter,nav,output,progress,section,time,video".split(','),
		i=0,
		length=e.length;
		while(i<length){
			document.createElement(e[i++])
		}
	})();</script>
<![endif]-->
<script src="js/jquery_last.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="css/validator.css"></link>
<script src="js/formValidator.js" type="text/javascript"></script>
<script src="js/formValidatorRegex.js" type="text/javascript"></script>
<script language="javascript" src="js/DateTimeMask.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
    $.formValidator.initConfig({onError:function(msg){alert(msg)}});
	$("#test1").formValidator({onshow:"请输入用户名6-20个字母或数字",onfocus:"用户名不能为空",oncorrect:"该用户名可以注册"}).InputValidator({min:6,max:20,onerror:"你输入的用户名非法,请确认"}).RegexValidator({regexp:"^[a-zA-Z0-9]+$",onerror:"用户名格式不正确"})
	$("#password1").formValidator({onshow:"请输入密码",onfocus:"密码不能为空",oncorrect:"密码合法"}).InputValidator({min:6,max:20,onerror:"密码不正确,请确认"}).RegexValidator({regexp:"^[a-zA-Z0-9]+$",onerror:"密码格式不正确"});
	$("#password2").formValidator({onshow:"请输入重复密码",onfocus:"两次密码必须一致",oncorrect:"密码一致"}).InputValidator({min:6,max:20,onerror:"密码不正确,请确认"}).CompareValidator({desID:"password1",operateor:"=",onerror:"2次密码不一致,请确认"});
	
});
</script>
<script type="text/javascript">
	/* <script language="javascript"> */
	function loadimage() {

		document.getElementById("randImage").src = "image.jsp?" + Math.random();

	}
</script>
<script type="text/javascript">
 window.onload=function(){
    var verifyObj = document.getElementById("Verify");
    verifyObj.onclick=function(){
        this.src="securitycodeimage.action?timestamp=" + Math.random();
    };
} 
</script>
<script type="text/javascript">
	$(function(){
		$(".submit").click(function() {
					if (document.getElementById("agree").checked == true) {
						return true;
					}else
					{
						alert("你必须同意我们的服务条款！");
						return false;
					}
				});
	});
</script>
 <style type="text/css" media="all">
body,div{font-size:12px;}
</style>
    <link rel="stylesheet" media="screen" href="css/styles.css" >
</head>
<body>
	<div class="header clearfix">
		<div class="container">
			<!--  <a href="##" class="logo">软微云盘</a> -->
			<a href="login.action"
				style="background: url(images/logo.png);
      float: left;height: 27px;margin-top: 20px;margin-left:200px;overflow: hidden;text-indent: -2000px;width: 157px;">软微云盘</a>
			<div class="navbar">


				<div class="nav">
					<ul class="clearfix">
						<!-- <li><a href="" target="_blank" class="gg">申请免费空间</a></li> -->
						<li><a href="login.action">首页</a></li>
						<!-- <li><a href="http://www.nitcloud.com/">下载</a></li>
						<li><a href="http://www.nitcloud.com/" target="_blank">论坛</a></li> -->
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div id="main">
		<h1 class="reg-title">欢迎注册软微云盘</h1>
		<div id="reg">
		  <table border="1" width="45%" height="250" style="border-width: 0px">
	<!-- MSTableType="layout" -->
	<tr>
		<td style="border-style: none; border-width: medium">　
        <form class="contact_form" action="registerdeal.action" method="post" name="form1" id="form1" onSubmit="return jQuery.formValidator.PageIsValid('1')">
    <ul>
        <li>
             <h2>欢迎注册</h2>
            
        </li>
        <li>
            <label for="name">用户名:</label>
            <input type="text" id="test1" name="username"  placeholder="请输入用户名6-20个字母或数字" required />
            <div id="test1Tip" style="width:250px"></div>
        </li>
        <li>
           <label for="password">密码:</label> 
			<input type="password" id="password1" name="password"
			placeholder="请输入密码6-20个字母或数字" required>
           <div id="password1Tip" style="width:250px"></div>
        </li>
        <li>
            <label for="rePassword">确认密码：</label> 
			<input type="password" id="password2" name="confirmpassword"
			placeholder="请输入密码6-20个字母或数字" required>
            <div id="password2Tip" style="width:250px"></div>
        </li>
         <li>
            <label for="rePassword">部门：</label> 
			<select name="department" id="xueli">
				<c:forEach items="${departmentList}" var="department">
					<option value="${department.id }">${department.name }</option>
				</c:forEach>
            </select>
            <div id="xueliTip" style="width:250px"></div>
        </li>
        <li>
            <label for="phrase">验证码：</label> 
				<input type="text" maxlength="4" id="phrase" name="rand"  required >
	           <img width="99" height="35" alt="code..." name="randImage"
								id="Verify" src="securitycodeimage.action"> <a
								href="javascript:loadimage();"><font class=pt95>
										换一张 </font> </a>
						
							<p class="phrase-tips">
								<c:if test="${requestScope.errorInfo != null}">
								<span id="tips-phrase" style="color:red" class="tips-phrase">${requestScope.errorInfo }</span>
							</c:if>
			</p>

        </li>
        <li>
        
          <input id="agree" type="checkbox" style="width:15px; height:15px;"
								name="is_agree"  checked="checked"
								value="1">我已经阅读并同意
		 <a href="services.jsp" class="fac" target="_blank">《软微云盘用户服务条款》</a>
        </li>
        <li>
        	<button class="submit" type="submit">注册</button>
        </li>
    </ul>
</form></td>
	</tr>
</table>
		</div>

</div>

	<div class="wrap">
		<div class="footer">
			<p class="links">
<a href="state.jsp" target="_blank">权利声明</a>
<a href="services.jsp" target="_blank">服务协议</a>
</p>

<p class="copyright">
版权所有 软件微电子学院Hadoop课程 京ICP备12345678号
		</p>
		</div>
	</div>


</body>
</html>