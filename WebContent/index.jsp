<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit">
<title>软微云盘</title>

<link rel="shortcut icon" href="images/ico.ico" />
<link href="css/yun_home_all.css" rel="stylesheet" />
<link rel="stylesheet" href="css/base.css">


<script type="text/javascript">
	function quit() {

		session.invalidate();
		response.sendRedirect("login.jsp");
	}
	function visib() {
		tt = document.getElementById("barUpload");
		tt.style.visibility = "visible";

	}
	function hidd() {
		xx = document.getElementById("barUpload");
		xx.style.visibility = "hidden";
	}
	function menudoc() {
		//document.getElementById("del").src="images/dele.png"
		//alert("fjdkf");
		document.getElementsById("menudoc").className = "sprite2 on";
		//document.getElementsById("menudoc").
	}
	function noneheader() {
		header = document.getElementById("header-shaw");
		header.style.display = "none";
	}
	function showheader() {
		header = document.getElementById("header-shaw");
		header.style.display = "block";
	}
	function mouseover() {
		document.getElementById("usermore").style.display = "block";
	}
	function mouseout() {
		document.getElementById("usermore").style.display = "none";
	}
</script>
<script src="js/yun_home_speed_all.js" type="text/javascript"></script>
<style type="text/css"></style>

<script type="text/javascript" charset="utf-8" async _install="1"
	src="js/FeatureManual.js"></script>
<script type="text/javascript" charset="utf-8" async _install="1"
	src="./js/pcs_util.js"></script>
<script type="text/javascript" charset="utf-8" async _install="1"
	src="./js/zoomTips.js"></script>
<script type="text/javascript" charset="utf-8" async _install="1"
	src="./js/zoom.js"></script>
<script type="text/javascript" charset="utf-8" async _install="1"
	src="./js/PageVisibility.js"></script>
<script type="text/javascript" charset="utf-8" async _install="1"
	src="./js/storage.js"></script>
<link rel="stylesheet" type="text/css" _install="1"
	href="./css/feature_manual.css">
<script type="text/javascript" charset="utf-8" async _install="1"
	src="./js/hotrec.js"></script>
<script type="text/javascript" charset="utf-8" async _install="1"
	src="./js/share_home.js"></script>
<script type="text/javascript" charset="utf-8" async _install="1"
	src="./js/clientdownload.js"></script>
<script type="text/javascript" charset="utf-8" async _install="1"
	src="./js/notice_head.js"></script>
</head>
<body class="flag-1" _title="软微 网盘-全部文件">
	<script type="text/javascript">
		/*<![CDATA[*/
		(function() {
			if (window.location.hash.indexOf("category/type=2") <= 0) {
				return;
			}
			var _ = function(A) {
				var _ = document.createElement("style");
				_.type = "text/css";
				document.getElementsByTagName("head")[0].appendChild(_);
				if (_.styleSheet) {
					_.styleSheet.cssText = A;
				} else {
					_.appendChild(document.createTextNode(A));
				}
			};
			_(".location {display: none} #timeline-tabs {display: block}");
		})();/*]]>*/
	</script>
	<!--[if IE]><iframe id="historyIFrameEmulator" style="display:none" xmlns="http://www.w3.org/1999/xhtml"></iframe><![endif]-->
	<div class="doc" id="doc_main" style="margin-top: 0px;">
		<div class="doc-inner">
			<div class="doc-triple" style="height: 800px;">
				<div node-type="module-header-wrapper"
					style="height: 49px; background-color: #3083eb"
					xmlns="http://www.w3.org/1999/xhtml">
					<div node-type="module click-ele" data-key="BAR"
						class="module-header hd-main clearfix" style="width: auto;">

						<!-- logo -->
						<a node-type="click-ele pos-ele" data-key="LOGO"
							class="f-icon logo" hidefocus="true" title="软微" href="http:"
							xmlns="http://www.w3.org/1999/xhtml"> <img
							src="images/logo.png">
						</a>
						<!-- info -->
						<div class="info clearfix" xmlns="http://www.w3.org/1999/xhtml">
							<ul>
								<li node-type="pos-ele menu-nav" data-key="PERSONAL"
									class="info-i user-name has-pulldown no-vip"><em
									class="f-icon pull-arrow" style="display: block;"
									onmouseover="mouseover()"> <img
										src="res/static/images/pull.png">
								</em> <a node-type="vip-identity click-ele" data-key="PERSONAL_VIP"
									class="f-icon identity "
									href="http://yun.baidu.com/buy/center?tag=1" target="_blank"
									title="未开通VIP"></a> <span node-type="username"
									onmouseover="mouseover()" onmouseout="mouseout()"
									class="name top-username" style="width: auto;">
										${sessionScope.user.username } </span>
									<div node-type="menu-list" class="pulldown user-info"
										id="usermore" onmouseover="mouseover()"
										onmouseout="mouseout()">
										<iframe class="pulldown-canvas" frameborder="0" scrolling="no"
											style="margin-left: 0px;"> </iframe>
										<em class="arrow"></em>
										<div class="content">
											<span node-type="click-ele" data-key="PERSONAL_INFO"
												class="li"> <a href="logout.action">退出登录</a>
											</span> <span class="separate-li no-height"></span> <span
												node-type="click-ele" data-key="PERSONAL_AWARD" class="li">
												<a href="state.jsp" target="_blank">权利声明</a>
											</span> <span class="separate-li no-height"></span> <span
												node-type="click-ele" data-key="PERSONAL_BUY_CENTER"
												class="li"> <a href="services.jsp" target="_blank">服务协议</a>
											</span> <span class="separate-li no-height"></span>
										</div>
									</div></li>
								<!--  <li node-type="click-ele pos-ele" data-key="PERSONAL_LOGOUT" class="info-i default-text">
               							 <a class="client-dload"   href="logout.action"  >退出</a>
           							 </li> -->

							</ul>
						</div>
					</div>
				</div>

				<section class="bd b-rlv clearfix"
					style="height: 100%; width: 100%; position: fixed;">
					<section class="main clearfix"
						style="height: 100%; width: 100%; position: fixed;">
						<aside class="aside" style="width: 210px;">
							<div class="aside-inner b-rlv" id="aside">
								<div class="b-view genere scrollbar-holder">
									<div class="side-option-panel">
										<dl class="cl-dl-container clearfix">
											<dt class="clearfix">
												<a class="img-ico side-lwp7" href="http://###"
													target="_blank" title="下载软微WP版"><span></span>WP</a> <a
													class="img-ico side-lipad" href="###" target="_blank"
													title="下载软微iPad版"><span></span>iPad</a> <a
													class="img-ico side-lmactong" href="####"
													title="下载软微Mac同步盘"><span></span>Mac同步盘</a> <a
													class="img-ico side-lpctong" href="####" title="下载软微PC同步盘"><span></span>PC同步盘</a>
											</dt>
											<dd class="side-lqrcode">
												<img src="./js/baidu_app_link.png">扫描二维码下载
											</dd>
										</dl>
										<em class="side-arrow"></em>
									</div>
									<div class="b-view genere jfk-scrollbar" id="genere"
										style="height: 600px;">
										<div class="minheight-forfooter">
											<ul class="b-list-3" id="aside-menu">
												<li node-type="list-item" data-key="all" class="b-list-item">
													<a class="sprite2 on" hidefocus="true"
													href="allfile.action" target="rightFrame" id="tab-home"
													unselectable="on"> <span class="text1"> <span
															class="img-ico aside-disk"> </span>全部文件
													</span></a>
												</li>
												
												<li node-type="list-item" data-key="pic" class="b-list-item">
													<a cat="2" class="b-no-ln type-a-pic" hidefocus="true"
													target="rightFrame"
													href="getfilebytype.action?type=picture"
													onclick="showheader();"><span
														class="text1"> <span class="img-ico aside-mpic"></span>图片<em
															class="aside-hot-icon"></em></span></a>
												</li>
												
												<!-- <li class="b-list-item" name="menudoc"  onclick="this.className='sprite2 on'">  -->

												<li class="b-list-item" id="menudoc" onclick="menudoc()">
													<a cat="4" class="b-no-ln type-a-doc" hidefocus="true"
													target="rightFrame"
													href="getfilebytype.action?type=document"
													onclick="showheader();"><span
														class="text1"><span class="img-ico aside-mdoc"></span>文档</span></a>
												</li>
												
												
												<li class="b-list-item"><a cat="3"
													class="b-no-ln type-a-mov" hidefocus="true"
													target="rightFrame" href="getfilebytype.action?type=video"
													onclick="showheader();"><span
														class="text1"><span class="img-ico aside-mvideo"></span>视频</span></a></li>
												<li class="b-list-item"><a cat="7"
													class="b-no-ln type-a-app" hidefocus="true"
													target="rightFrame" href="getfilebytype.action?type=zip"
													onclick="showheader();"><span
														class="text1"><span class="img-ico aside-mbt"></span>压缩</span></a></li>
												<li class="b-list-item"><a cat="1"
													class="b-no-ln type-a-mus" hidefocus="true"
													target="rightFrame" href="getfilebytype.action?type=audio"
													onclick="showheader();"><span
														class="text1"><span class="img-ico aside-mmusic"></span>音乐</span></a></li>
												<li class="b-list-item"><a cat="6"
													class="b-no-ln type-a-oth" hidefocus="true"
													target="rightFrame" href="getfilebytype.action?type=other"
													onclick="showheader();"><span
														class="text1"><span class="img-ico aside-moth"></span>其它</span></a></li>
												<li class="b-list-item separator-1"></li>
												<li class="b-list-item"><a class="sprite2 b-no-ln"
													hidefocus="true" target="rightFrame" href="myshare.action"
													onclick="noneheader();" id="tab-share" unselectable="on"><span
														class="text1"><span class="img-ico aside-share"></span>我的分享</span>
												</a></li>
												<li class="b-list-item"><a class="sprite2 b-no-ln"
													hidefocus="true" target="rightFrame"
													href="departmentshare.action" onclick="noneheader();"
													id="tab-share" unselectable="on"><span class="text1"><span
															class="img-ico aside-trade"></span>部门分享</span> </a></li>
												<li class="b-list-item"><a class="sprite2 b-no-ln"
													hidefocus="true" target="rightFrame"
													href="cloudshare.action" onclick="noneheader();"
													id="tab-inbox" unselectable="on"> <span class="text1"><span
															class="img-ico aside-inbox"></span>云共享</span>
												</a></li>
												<li class="b-list-item separator-1"></li>

											</ul>


											<div class="weather">
												<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
													codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0"
													width="200" height="65" style="margin-left: 10px;">
													<param name="movie"
														value="http://t.xidie.com/skin/2010-1020.swf" />
													<param name="quality" value="high" />
													<param name="wmode" value="transparent" />
													<embed src="http://t.xidie.com/skin/2010-1020.swf"
														quality="high"
														pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash"
														type="application/x-shockwave-flash" width="200"
														height="65" wmode="transparent"></embed>
												</object>
											</div>
											
											<div style="padding-left:20px">
											       <span id="m"></span><br/>
       											   <span style="padding-left:10px" id="img"></span>
											</div>


										</div>


									</div>
									<!-- 文件上传滚动条 -->

									<div id="barUpload"
										style="margin-left: 18px; margin-top: 0px; visibility: hidden;">
										<table border="0" width="5%" cellspacing="0" cellpadding="4"
											style="border-collapse: collapse" bgcolor="#FFFFff"
											height="20">
											<tr>
												<td style="font-size: 2px; line-height: 100%" align=center
													width="150dip">文件上传中 <marquee
														style="border: 1px solid #000000" direction="right"
														width="150" scrollamount="5" scrolldelay="0"
														bgcolor="#ECF2FF">
														<table cellspacing="1" cellpadding="5">
															<tr height=8>
																<td bgcolor=#3399FF width=8></td>
																<td></td>
																<td bgcolor=#3399FF width=8></td>
																<td></td>
																<td bgcolor=#3399FF width=8></td>
																<td></td>
																<td bgcolor=#3399FF width=8></td>
																<td></td>
																<td bgcolor=#3399FF width=8></td>
																<td></td>
															</tr>
														</table>
													</marquee>
												</td>
											</tr>
										</table>
									</div>

									<div class="scrollbar-shadow scrollbar-top-shadow"
										style="opacity: 0;"></div>
									<div class="scrollbar-shadow scrollbar-bottom-shadow"
										style="opacity: 0;"></div>
								</div>
							</div>
						</aside>
						<section class="pan" id="subwindowContainer"
							style="margin-left: 209px;">

							<div class="pan-inner b-bdr-2" id="panInner">
								<section class="fns" style="height: 800px;">

									<iframe height="100%" width="100%" frameborder="0"
										src="data.action" name="rightFrame" id="rightFrame"
										title="rightFrame"></iframe>
									<!-- <iframe height="100%" width="100%" frameborder="0"
									src="rightFile.jsp" name="rightFrame" id="rightFrame"
									title="rightFrame"></iframe> -->

								</section>
							</div>
						</section>
					</section>
				</section>
			</div>
			<div class="scrollbar" id="scrollbar"
				style="display: none; left: auto; right: 0px; top: 129px;"
				unselectable="on">
				<div class="scrollbar-arrow scrollbar-arrow-up sprite"
					id="scrollbarArrowUp" unselectable="on" dir="up"></div>
				<div class="scrollbar-tracker" id="scrollbarTracker"
					unselectable="on" style="height: 504px;">
					<div class="scrollbar-thumb" id="scrollbarThumb" unselectable="on"
						style="height: 808.7105263157895px; top: 0px;"></div>
				</div>
				<div class="scrollbar-arrow scrollbar-arrow-down sprite"
					id="scrollbarArrowDown" unselectable="on" dir="down"></div>
			</div>
			<div class="scrollbar" id="scrollbarGrid"
				style="display: none; left: auto; right: 0px; top: 129px;"
				unselectable="on">
				<div class="scrollbar-arrow scrollbar-arrow-up sprite"
					id="scrollbarArrowUpGrid" unselectable="on"></div>
				<div class="scrollbar-tracker" id="scrollbarTrackerGrid"
					unselectable="on" style="height: 504px;">
					<div class="scrollbar-thumb" id="scrollbarThumbGrid"
						unselectable="on"></div>
				</div>
				<div class="scrollbar-arrow scrollbar-arrow-down sprite"
					id="scrollbarArrowDownGrid" unselectable="on"></div>
			</div>
		</div>
	</div>

	<div class="useless">
		<div class="dlg-hd">
			<div class="dlg-cnr-l"></div>
			<div class="dlg-cnr-r"></div>
		</div>
		<div class="dlg-ft">
			<div class="dlg-cnr-l"></div>
			<div class="dlg-cnr-r"></div>
		</div>
	</div>
	<form action="http://pan.baidu.com/share/set" class="useless"
		id="public-form" method="post" target="_blank">
		<input name="schannel" type="hidden"> <input name="fid_list"
			type="hidden"> <input name="channel_list" type="hidden">
		<input name="content" type="hidden">
	</form>

</body>
</html>