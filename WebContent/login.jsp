<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<link rel="shortcut icon" href="images/ico.ico" />
 
<title>软微云盘 - 安全免费 无限空间</title>
<link rel="stylesheet" href="css/select.css">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
$(function(){
	var l=0;
	$('.navs_li').click(function(){
		$(this).siblings().removeClass('on');
		$(this).addClass('on');
		var i=$(this).index();	
		var a1=160*i;	
		$(".s_line").animate({left:a1},200);
		var index = $(".navs_li").index($(this));
		$(".item_tab").hide();
		$(".item_tab").eq(index).show();
	});	
})
</script>
<script type="text/javascript" async="" src="./软微云盘 - 安全免费 无限空间_files/ga.js"></script><script>var G_start_time = new Date;</script>
<script type="text/javascript" src="js/login.js"></script>
<!--[if (lt IE 8.0)]><link type="text/css" rel="stylesheet" href="http://s8.qhimg.com/static/5efb15d385fe1584/index.src.css"><![endif]--><!--[if (!IE)|(gte IE 8.0)]><!--><link type="text/css" rel="stylesheet" href="css/index.src_datauri.css"><!--<![endif]-->

<script type="text/javascript" src="./软微云盘 - 安全免费 无限空间_files/1141.js"></script>


<script type="text/javascript">(function(){
	var e = "abbr,article,aside,audio,bb,canvas,datagrid,datalist,details,dialog,eventsource,figure,footer,hgroup,header,mark,menu,meter,nav,output,progress,section,time,video".split(','),
		i=0,
		length=e.length;
		while(i<length){
			document.createElement(e[i++])
		}
	})();</script>

<script>window.onerror = function(msg, jsurl, line){var s ="/resource/img/blank.gif?msg="+encodeURIComponent(msg)+'&jsurl='+encodeURIComponent(jsurl)+'&url='+encodeURIComponent(location)+'&line='+line+'&t='+Math.random();if(typeof Browser != 'undefined'){var _s = [];for(var i in Browser)_s.push(i+':"'+Browser[i]+'"');s += '&other='+encodeURIComponent('{'+_s.join(',')+'}');}var img = new Image();img.src=s;};var ypDomain = {web : '',api : '',qun: '',clusterid : ''};var group_limit_member = 1;</script>
<!-- <script src="js/jquery_last.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="css/validator1.css"></link>
<script src="js/formValidator.js" type="text/javascript"></script>
<script src="js/formValidatorRegex.js" type="text/javascript"></script>
<script src="js/DateTimeMask.js" type="text/javascript"></script> 
<script type="text/javascript">
$(document).ready(function(){
    $.formValidator.initConfig({onError:function(msg){alert(msg)}});
	$("#test1").formValidator({onshow:"",onfocus:"用户名不能为空",oncorrect:"用户名正确"}).InputValidator({min:6,max:20,onerror:"你输入的用户名非法,请确认"}).RegexValidator({regexp:"^[a-zA-Z0-9]+$",onerror:"用户名格式不正确"})
	$("#password1").formValidator({onshow:"",onfocus:"密码不能为空",oncorrect:"密码输入正确"}).InputValidator({min:6,max:20,onerror:"密码不正确,请确认"}).RegexValidator({regexp:"^[a-zA-Z0-9]+$",onerror:"密码格式不正确"});
	$("#test").formValidator({onshow:"",onfocus:"用户名不能为空",oncorrect:"用户名正确"}).InputValidator({min:6,max:20,onerror:"你输入的用户名非法,请确认"}).RegexValidator({regexp:"^[a-zA-Z0-9]+$",onerror:"用户名格式不正确"})
	$("#password").formValidator({onshow:"",onfocus:"密码不能为空",oncorrect:"密码输入正确"}).InputValidator({min:6,max:20,onerror:"密码不正确,请确认"}).RegexValidator({regexp:"^[a-zA-Z0-9]+$",onerror:"密码格式不正确"});
});
</script> -->

 <link rel="stylesheet" media="screen" href="css/styles.css" >
</head>

<body>


<div class="header clearfix">
    <div class="container">
        <a  style="background: url('images/logo.png'); float: left;height: 27px;margin-top: 20px;overflow: hidden;text-indent: -2000px;width: 157px;">软微云盘</a>
        <div class="navbar">
           
        
            <!-- <div class="nav">
                <ul class="clearfix">
                    <li>
                         <a href="http://huodong.###.cn/xt"  target="_blank" class="gg">36T免费空间</a>
                        <a href="http://www.nitcloud.com/"  target="_blank" class="gg">申请免费空间</a> 
                    </li>
                    <li>
                        <a href="http://www.nitcloud.com/">首页</a>
                    </li>
                    <li>
                        <a href="http://www.nitcloud.com/" target="_blank">下载</a>
                    </li>
                    <li>
                        <a href="http://www.nitcloud.com/" target="_blank">论坛</a>
                    </li>
                </ul>
            </div> -->
        </div>
    </div>
</div>

<script>if(top !== self){
		top.location = location.href;
	}

	
	var startTime = new Date(),
		loginInitTime;</script>

<script type="text/javascript" src="./软微云盘 - 安全免费 无限空间_files/index-login.src.js"></script>
<script>if(!window.isCdnOk) document.write('<script type="text/javascript" src="/resource/js/web/index-login.src.js"><\/script>');</script>

<div class="slide-wrap">
	<div class="container">
		<div class="slide-box" style="left: -22.057953px;">
			<div class="slide" style="left: 960px;">
				<img src="images/t0182017e81cfee4f5c.jpg" width="960" height="388">
					<a class="btn download" href="http://www.nitcloud.com/" >下载客户端</a>
			</div>
			<div class="slide video-slide" style="left: 0px;">
				<img src="images/loginbg1.png" width="960" height="388">
			</div>
		</div>
	   <div class="slide-point-box" style="visibility: hidden;">
			<span class="" data-index="0"></span>
			<span data-index="1" class="cur-point"></span>
	   </div>
<div class="login-panel login-tab">
<h1>欢迎使用软微云盘</h1>

<div class="box_css">
	    <ul class="nav2">
	        <li class="navs_li on">普通用户登录</li>
	        <li class="navs_li">管理员登录</li>	        
	    </ul>
	    <div class="line">
	    	<span class="s_line">	    		
				<b></b>
	    	</span>
			<div style="clear: both;"></div>
		</div>		
		<div style="clear: both;"></div>
	</div>

<div class="zlbox_content">
		<div class="item_tab" style="display: block;">
           <div id="login">
 				<div id="modLoginWrap" class="mod-qiuser-pop">
					<div class="login-error login-error-msg" style="display: none;"></div>
					<iframe style="display:none" name="loginiframe"></iframe>
						<form id="loginForm"  method="post" action="userlogin.action" name="form1" id="form1" onSubmit="return tsubmit()">
					 <dl class="login-wrap">
             	<dt>
                	<span id="loginTitle"></span>
				</dt>
          		<dd>
					<div class="quc-clearfix login-item">
						<label for="loginAccount">帐号</label>
						<span class="input-bg">
							<input placeholder="用户名" type="text" tabindex="1" id="loginAccount" name="username" autocomplete="off" maxlength="100" class="ipt tipinput1">
                        </span>
					   <span style="color:red">${errorInfo }</span>
					   <br>
                     </div>
                 </dd>
                 <dd class="password">
						<div class="quc-clearfix login-item">
							<label for="lpassword">密码</label><span class="input-bg">
							<input placeholder="请输入您的密码" type="password" tabindex="2" id="lpassword" name="password" maxlength="20" autocomplete="off" class  ="ipt tipinput1"></span>
							
                        </div>
                 </dd>
				<!-- <dd class="find">
                	<label for="iskeepalive">
						<input type="checkbox" tabindex="4" name="iskeepalive" id="iskeepalive" > 下次自动登录
                    </label>
				</dd> -->
				<!--<dd class="rem" id="phraseLoginwarp" style="display:none">
					<label for="phraseLogin">验证码</label> 
					<span class="verify-code">
					<input type="text" tabindex="3" maxlength="4" placeholder="验证码" id="phraseLogin" name="phrase" class="ipt1 tipinput1" autocomplete="off"></span>
					<span class="yz">
                    	<img width="99" height="35" id="lwm" title="点击更换图片">
						<a class="ml8 fac" href="http://###.cn/#nogo" id="refreshCaptchaLogin">换一张</a>
                    </span>
					<p>
                    	<b class="tips-wrong  icon-phraseLogin"></b>
						<span id="tips-phraseLogin" class="tips-phrase">请输入图中的字母或数字，不区分大小写</span>
					</p>
                </dd>-->
				<dd class="submit" style="padding-top:0px">
               	 	<span>
                		<input type="submit" id="loginSubmit" value="登录" class="btn-login quc-psp-gstat">
						<a href="http://###.cn/###" class="fac reg-new-account">注册新帐号</a>
               		</span>
                </dd>
                <dd class="global-tips">
                    <div id="error_tips" class=""></div>
                </dd>
            </dl>
      </form>
  </div>
</div>
           
        </div>
		<div class="item_tab" style="display: none;">
            <div id="login">
 				<div id="modLoginWrap" class="mod-qiuser-pop">
					<div class="login-error login-error-msg" style="display: none;"></div>
					<iframe style="display:none" name="loginiframe"></iframe>
						<form id="aloginForm"  method="post" action="admin/adminlogin.action" onSubmit="return atsubmit()">
					 <dl class="login-wrap">
             	<dt>
                	<span id="loginTitle"></span>
				</dt>
          		<dd>
					<div class="quc-clearfix login-item">
						<label for="loginAccount">帐号</label>
						<span class="input-bg">
							<input placeholder="用户名" type="text" tabindex="1" id="aloginAccount" name="username" autocomplete="off" maxlength="100" class="ipt tipinput1">
                        </span>
					   <span style="color:red">${errorInfo }</span>
					   <br>
                     </div>
                 </dd>
                 <dd class="password">
						<div class="quc-clearfix login-item">
							<label for="lpassword">密码</label><span class="input-bg">
							<input placeholder="请输入您的密码" type="password" tabindex="2" id="alpassword" name="password" maxlength="20" autocomplete="off" class="ipt tipinput1"></span>
                        </div>
                 </dd>
				
				<dd class="submit" style="padding-top:0px">
               	 	<span>
                		<input type="submit"  id="loginSubmit" value="登录" class="btn-login quc-psp-gstat">
               		</span>
                </dd>
                <dd class="global-tips">
                    <div id="error_tips" class=""></div>
                </dd>
            </dl>
      </form>
  </div>
</div>
           
        </div>
	</div>



<div class="change">
  <a href="register.action">注册帐号</a>
</div>
</div>
	</div>
</div>
<div class="wrap clearfix" style="padding:60px;">
	<div class="download-list">
		<div class="dl-btn-box clearfix">
			<a href="#" class="client-btn"></a>
			<a class="mobile-btn"></a>
		</div>
	</div>
	<div class="qrcode-download">
		<img src="images/xingyunnet.jpg" alt="" width="97" height="97">
		<div class="qrcode-download-desc">
				手机扫描<br>微信关注
		</div>

	</div>
</div>
<div class="mask videoslide-mask" unselectable="on" style="z-index: 10; display: none;"></div>
<div class="videoslide-main" style="display:none">
	<div class="videoslide">
		<embed src="css/bcloud.swf" allowfullscreen="true" quality="high" width="640" height="XXX" align="middle" 
		allowscriptaccess="always" flashvars="uu=789b624579&amp;vu=927a026566&amp;auto_play=1&amp;gpcflag=1&amp;width=640&amp;height=XXX" 
		type="application/x-shockwave-flash">
	</div>
	<div class="close"></div>
</div>
<div class="mobile-dl-dia-bg"></div>
<div class="mobile-dl-dia">
	<div class="mobile-dl-dia-title clearfix">
		<span>根据你的手机系统选择版本下载</span>
		<a class="mobile-dl-dia-close">×</a>
	</div>
</div>

<div class="wrap">
 	<div class="footer"> 
        <p class="links">
            <a href="state.jsp" target="_blank">权利声明</a>
            <a href="services.jsp" target="_blank">服务协议</a>
        </p>
        <br>
        <p class="copyright">
            版权所有 软件微电子学院Hadoop课程 京ICP备12345678号
        </p>
        <br>
        <br>
	</div>
</div> 



<script type="text/javascript">
var SERVER_TIME = '';
	var monitorConfig = {
        pageUrl : 'http://###.cn/'
    }

		ypLogin.initLogin();
	try{
        if(external && external.GetSID && external.AppCmd){
            external.AppCmd(external.GetSID(window),"","Yunpan","SetQid",'',function(r,s){});
        }
    }catch(e){}
		loginInitTime = (new Date())-startTime;</script>
<script type="text/javascript" src="./软微云盘 - 安全免费 无限空间_files/index.src.js"></script>
<script>W('.download-list .mobile-btn').click(function(){
		var docRect = Dom.getDocRect();
		if(Browser.ie6){}
		else {
			W('.mobile-dl-dia-bg').show().css({
				width: docRect.width+'px',
				height: docRect.height+'px'
			});
		}
		var dia = W('.mobile-dl-dia');
		dia.show();
		var rect = dia.getRect();
		dia.css({
			left: docRect.scrollX + (docRect.width-rect.width)/2+'px',
			top: docRect.scrollY + (docRect.height-rect.height)/2+'px'
		});


	});
	W('.mobile-dl-dia-close').click(function(){
		W('.mobile-dl-dia').hide();
		W('.mobile-dl-dia-bg').hide();
	});
		//remove the iphone beta download btn 
    if(/iphone/i.test(navigator.userAgent.toLowerCase())){
        W('.iphone-dl-box .iphone-beta-dl-btn').css('visibility', 'hidden');
        W('.iphone-dl-box .iphone-beta-dl-info').css('visibility', 'hidden');
    }</script>

<!--</div>
</div>-->

<script type="text/javascript" src="./软微云盘 - 安全免费 无限空间_files/m.js"></script>


</body></html>