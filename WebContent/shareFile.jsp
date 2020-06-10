<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>软微网盘-全部文件</title>
<link rel="shortcut icon" href="images/ico.ico" />
<script type="text/javascript">
	function userchecked() {

		document.getElementById("usercheck").style.visibility = "visible";

	}
	function visibxx() {
		tt = document.getElementById("barDown");
		tt.style.visibility = "visible";

	}
	function hidd() {
		xx = document.getElementById("barDown");
		xx.style.visibility = "hidden";
	}
	function test() {
		var x = document.getElementsByName("ischeck");

		alert(x.length);
	}
	function delOver() {
		document.getElementById("del").src = "images/delepress.png"
	}
	function delOut() {
		document.getElementById("del").src = "images/dele.png"
	}
	function renaOver() {
		document.getElementById("rena").src = "images/renapress.png"
	}
	function renaOut() {
		document.getElementById("rena").src = "images/rena.png"
	}
</script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery.contextmenu.r2.js"></script>

<link rel="stylesheet" type="text/css"
	href="otherfiles/reset.v3.1.1_c7e4b08.css">
<link rel="stylesheet" type="text/css"
	href="otherfiles/global_523b957.css">
<link rel="stylesheet" type="text/css"
	href="otherfiles/panel_d41d8cd.css">
<link rel="stylesheet" type="text/css" href="otherfiles/all_36bbc94.css">
<link rel="stylesheet" type="text/css"
	href="otherfiles/dialog_7f8b960.css">
<link rel="stylesheet" type="text/css" href="otherfiles/mbox.css">
<link rel="stylesheet" type="text/css"
	href="otherfiles/widget_821fe3e.css">
<link rel="stylesheet" type="text/css"
	href="otherfiles/global-btn-icon_54fb8cd.css">
<link rel="stylesheet" type="text/css"
	href="otherfiles/layout2_36dac0d.css">
<link rel="stylesheet" type="text/css"
	href="otherfiles/disk-home_96b848c.css">
<link rel="stylesheet" type="text/css"
	href="otherfiles/toast_ae3cc5b.css">
<link rel="stylesheet" type="text/css"
	href="otherfiles/alertDialog_3c28717.css">
<link rel="stylesheet" type="text/css"
	href="otherfiles/toastPanel_e32020d.css">
<link rel="stylesheet" type="text/css"
	href="otherfiles/downloadManager_d01758a.css">
<link rel="stylesheet" type="text/css"
	href="otherfiles/shareOperateBtn_f761103.css">
<link rel="stylesheet" type="text/css"
	href="otherfiles/widget_750f2ba.css">
<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/right.css">

</head>
<body>
	<div id="doc" style="width: auto;">
		<div id="bd" class="clearfix">
			<div id="yao-main">
			
			<c:if test="${sharetype == 'myshare' }">
				<div class="allfile"><span style="font-size:18px; color:#358edd">我的分享</span></div>
			</c:if>
			<c:if test="${sharetype == 'cloudshare' }">
				<div class="allfile"><span style="font-size:18px; color:#358edd">云共享</span></div>
			</c:if>
			<c:if test="${sharetype == 'departmentshare' }">
				<div class="allfile"><span style="font-size:18px; color:#358edd">部门分享</span></div>
			</c:if>
			
				<div class="yao-b" style="margin-left: 0px;">
					<div class="module-crumbs">
						<div class="title global-clearfix">
							<!-- 文件列表  -->
							<div class="module-list-view"
								style="display: block;">
								<div class="list-view-home">
									<div class="title" style="padding-right: 17px;">
										<div class="item global-clearfix">
										
											<div data-key="name" class="col c1" style="width: 44%">
												<div class="chk">
													<span>文件名</span> 
													<span class="asc desc" style="visibility: hidden;"></span>

													<div id="usercheck"
														style="display: inline-block; height: 10px; width: 9px; position: relative; top: 1px; visibility: hidden;">
														<!-- 背景图  -->
														<a
															style="background: url('images/btn_sprit.gif') no-repeat scroll 0px -144px transparent; color: #333; display: inline-block; white-space: nowrap; outline: 0px none; text-decoration: none; font-size: 12px; height: 30px; line-height: 28px; padding-left: 1px; position: relative; margin-right: 0px; vertical-align: middle;"
															onClick="test()" node-type="btn-operate" data-key="share">
															<!-- 小图标  --> <span
															style="top: 7px; left: 14px; position: absolute; display: block; height: 20px; width: 20px; background: url('images/btn_icon.gif') no-repeat scroll -210px -233px transparent;"></span>
															<!-- 字体  --> <span
															style="font-weight: 100; display: block; background: url('images/btn_sprit.gif') no-repeat scroll right -144px #F2F6FF; text-decoration: none; text-align: center; cursor: pointer; color: #666; padding-right: 14px; height: 28px; line-height: 28px;">
															分享</span>
														</a>
														<!-- 下载  -->
														<a
															style="background: url('images/btn_sprit.gif') no-repeat scroll 0px -144px transparent; color: #333; display: inline-block; white-space: nowrap; outline: 0px none; text-decoration: none; font-size: 12px; height: 30px; line-height: 28px; padding-left: 1px; position: relative; margin-right: 0px; vertical-align: middle;"
															node-type="btn-operate" data-key="download"> <span
															style="top: 7px; left: 14px; position: absolute; display: block; height: 20px; width: 20px; background: url('images/btn_icon.gif') no-repeat scroll -210px -213px transparent;"></span>

															<span
															style="font-weight: 100; display: block; background: url('images/btn_sprit.gif') no-repeat scroll right -144px #F2F6FF; text-decoration: none; text-align: center; cursor: pointer; color: #666; padding-right: 14px; height: 28px; line-height: 28px;">
															下载</span>
														</a>
														<!-- 删除  -->
														<a
															style="background: url('images/btn_sprit.gif') no-repeat scroll 0px -144px transparent; color: #333; display: inline-block; white-space: nowrap; outline: 0px none; text-decoration: none; font-size: 12px; height: 30px; line-height: 28px; padding-left: 1px; position: relative; margin-right: 0px; vertical-align: middle;"
															node-type="btn-operate" data-key="share"> <span
															style="top: 7px; left: 14px; position: absolute; display: block; height: 20px; width: 20px; background: url('images/btn_icon.gif') no-repeat scroll -210px -279px transparent;"></span>

															<span
															style="font-weight: 100; display: block; background: url('images/btn_sprit.gif') no-repeat scroll right -144px #F2F6FF; text-decoration: none; text-align: center; cursor: pointer; color: #666; padding-right: 14px; height: 28px; line-height: 28px;">
															删除</span>
														</a> <span style="display: inline;"
															node-type="btn-operate btn-device" data-key="push"
															class="btn-device-wrapper"> </span>
													</div>
												</div>
											</div>

											<div data-key="size" class="col"
												style="width: 16%;">
												分享位置 <span class="asc desc"
													style="visibility: hidden;"></span>
											</div>
											
											<div data-key="size" class="col"
												style="width: 16%;">
												大小 <span class="asc desc"
													style="visibility: hidden;"></span>
											</div>

											<div data-key="time" class="col"
												style="width: 23%; border-right: none;">
												修改日期 <span class="asc desc"
													style="visibility: visible;"></span>
											</div>

										</div>
									</div>
									<div class="list"
										style="height: 616px; overflow: auto;">
										
										<c:forEach items="${files}" var="fileInfo">
											<c:if test="${fileInfo.isdirectory == 1 }">
											<div node-type="item" data-id="1116310753811463"
												data-category="6"
												onmouseout="this.className='item global-clearfix'"
												onmouseover="this.className='item global-clearfix item-hover'"
												data-extname="7z" class="item global-clearfix">

												<div class="col c1" style="width: 44%;">

													<span class="ico global-icon-16 global-icon-16-dir"></span>

													<!-- 文件名称 -->

													<div node-type="name" class="name" title="${fileInfo.filename }">

														<span class="name-text" 
														style="cursor:pointer"
														onclick="window.location.href='subdir.action?name=${fileInfo.filename }&dst=${dst }'">

																<input type="hidden" name="oldaddress" value="${fileInfo.filename }">
																<input type="text" id="docu1" name="name" 
																	class="name-text" value="${fileInfo.filename }"
																	style="margin-top: 8px; background-color: transparent; border: none; cursor:pointer"
																	disabled="disabled">
														
														</span>
													</div>

													<!-- 文件名称编辑 -->
													<div node-type="edit-name" class="edit-name">
														<input node-type="edit-name-box" class="box" type="text"
															value=""> <span node-type="edit-name-sure"
															class="sure"></span> <span node-type="edit-name-cancel"
															class="cancel"></span>
													</div>
													<!-- 行内按钮 -->
													<div class="btns">

														<a node-type="btn-item" title="分享" data-key="share"
															class="btn share" style="visibility: hidden;"
															href="shareFile.html"> </a> <a node-type="btn-item"
															title="重命名" href="rightFile.html" onmouseout="renaOut()"
															onMouseOver="renaOver()"> <img alt="dd"
															src="images/rena.png"
															onmouseover="this.src='images/renapress.png'"
															onmouseout="this.src='images/rena.png'">
														</a> <a node-type="btn-item" title="删除" href="deletefile.action?name=${fileInfo.filename }&dst=${dst }"
															onmouseover="delOver()" onMouseOut="delOut()"> <img
															alt="ss" id="del" src="images/dele.png"
															onmouseover="this.src='images/delepress.png'"
															onmouseout="this.src='images/dele.png'" />

														</a>


													</div>
												</div>

												<!-- 其他列 -->

												<div class="col" style="width: 16%">-</div>
												
												<div class="col" style="width: 16%">-</div>

												<div class="col" style="width: 23%">${fileInfo.date }
												</div>


												<!-- 复制 -->

											</div>
											</c:if>
										</c:forEach>
										<c:forEach items="${shareList}" var="fileInfo">
											<c:if test="${fileInfo.isdirectory == 0 }">
											<div node-type="item" data-id="1116310753811463"
												data-category="6"
												onmouseout="this.className='item global-clearfix'"
												onmouseover="this.className='item global-clearfix item-hover'"
												data-extname="7z" class="item global-clearfix">
												<!-- 第一列 -->
												<div class="col c1" style="width: 44%;" id="aaaaaa"
													onMouseDown="onmousedown(e)">
													<c:if test="${fileInfo.type.equals('audio') }">
														<span class="ico global-icon-16 global-icon-16-mp3"></span>
													</c:if>	
													<c:if test="${fileInfo.type.equals('video') }">
														<span class="ico global-icon-16 global-icon-16-avi"></span>
													</c:if>
													<c:if test="${fileInfo.type.equals('zip') }">
														<span class="ico global-icon-16 global-icon-16-zip"></span>
													</c:if>
													<c:if test="${fileInfo.type.equals('document') }">
														<span class="ico global-icon-16 global-icon-16-doc"></span>
													</c:if>
													<c:if test="${fileInfo.type.equals('picture') }">
														<span class="ico global-icon-16 global-icon-16-png"></span>
													</c:if>	
													<c:if test="${fileInfo.type.equals('other') }">
														<span class="ico global-icon-16 global-icon-16-other"></span>
													</c:if>	
	
													<div node-type="name" class="name" title="${fileInfo.filename }">
														<span class="name-text-wrapper"> <!--改<%-- <span node-type="name-text" class="name-text"><%=s.getFilename() %></span> --%>改-->
															<form action="rename.html" method="post">
																<input type="hidden" name="oldaddress" value="${fileInfo.filename }">
																<input id=${id } type="text" id="a" name="name"
																	class="name-text" value="${fileInfo.filename }"
																	style="margin-top: 8px; background-color: transparent; border: none"
																	disabled="disabled">
															</form>
														</span>
													</div>
	
													<!-- 文件名称编辑 -->
													<div node-type="edit-name" class="edit-name">
														<input node-type="edit-name-sure" class="box" type="text"
															value=""> <span node-type="edit-name-sure"
															class="sure"></span> <span node-type="edit-name-cancel"
															class="cancel"></span>
													</div>
	
													<!-- 行内按钮 -->
													<div class="btns">
														<c:if test="${myshare.equals('true') }">
															<a node-type="btn-item" title="取消共享" href="cancelshare.action?shareid=${fileInfo.id }"
																onmouseover="delOver()" onMouseOut="delOut()"> <img
																alt="ss" id="del" src="images/dele.png"
																onmouseover="this.src='images/delepress.png'"
																onmouseout="this.src='images/dele.png'" />
															</a>
														</c:if>
														 <a node-type="btn-item" title="下载" data-key="download"
															class="btn download" onClick="visib();" href="downloadsharefile?filepath=${fileInfo.filepath }&downloadName=${fileInfo.filename }"> </a>
	
													</div>
												</div>
	
												<!-- 其他列 -->
												<div class="col" style="width: 16%">
												<c:forEach items="${departmentList}" var="department">
								                	<c:if test="${department.id == fileInfo.department}">
														${department.name }
													</c:if>
								                </c:forEach>
								                <c:if test="${0 == fileInfo.department}">
														云共享
													</c:if>
												</div>
	
												<div class="col" style="width: 16%">${fileInfo.filesize }</div>
	
												<div class="col" style="width: 23%">${fileInfo.datetime }</div>
	
												<!-- 复制 -->
											</div>
											</c:if>
										</c:forEach>
									</div>
								</div>

							</div>
						</div>
						<div id="barDown" style="visibility: hidden"
							style="margin-left: 18px;margin-top: 10px">
							<table border="0" width="5%" cellspacing="0" cellpadding="4"
								style="border-collapse: collapse" bgcolor="#FFFFff" height="20">
								<tr>
									<td style="font-size: 2px; line-height: 100%" align=center
										width="150dip">文件正在下载中... <marquee
											style="border: 1px solid #000000" direction="right"
											width="150" scrollamount="5" scrolldelay="0"
											bgcolor="#ECF2FF">
											<table cellspacing="0" cellpadding="5">
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
										</marquee></td>
								</tr>
							</table>
						</div>
					</div>


					<!--[if gte IE 9]><div style="display:none">
require("clouddisk-ui:widget/webspeed/webSpeedConfig-disk-home.js");</div>
<![endif]-->

				</div>
			</div>
		</div>
		<div id="ft"></div>
	</div>

	<!--[if gte IE 9]><script src="/yun-static/clouddisk-ui/js/webspeed/webSpeedFirst.js"></script>
<![endif]-->

	<div id="toast" class="toast-dialog toast-content box-shadow"
		style="display: none; left: 800px; top: 65px;">
		<div class="toast-outer">
			<div id="_disk_id_1" class="toast-msg ellipsis">
				<em class="toast-type loading"></em>
			</div>
		</div>
	</div>
	<div style="display: none">
		<a
			href="http://tongji.baidu.com/hm-web/welcome/ico?s=2246de2d6633217ea74fa00f3bc89b30"
			target="_blank"> <img border="0" src="./otherfiles/21.gif"
			width="20" height="20">
		</a>
	</div>
	<div id="uploadDialog"
		class="b-panel b-dialog upload-dialog dlg-sys-win-min">
		<div class="dlg-hd b-rlv dlg-hd-upload sprite-new bdr-n-blu-1">
			<div class="inline-mask" id="uploadHeadlineProgress"></div>
			<a hidefocus="true" unselectable="on"
				class="dlg-sys-btn dlg-sys-btn-cls b-fr" id="uploadDialogCloseTop"
				href="javascript:;" title="关闭"><dfn class="sprite-new">关闭</dfn>
			</a><a hidefocus="true" unselectable="on"
				class="dlg-sys-btn dlg-sys-btn-min b-fr"
				id="uploadDialogCloseMinimumTop" href="javascript:;" title="最小化"><dfn
					class="sprite-new">最大化</dfn> </a>
			<h4 class="dlg-h4-1 clearfix" id="uploadDialogHeadline">
				<strong class="b-fl" id="uploadDialogHeadlineStrong">上传文件</strong>
			</h4>
		</div>
		<div class="dlg-bd upload-dialog-hd b-rlv bdr-n-blu"
			id="uploadDialogBody">
			<div class="clearfix file-item upload-file-item upload-colgroup"
				id="uploadDialogColgroup">
				<div class="b-fl pf-c1 ellipsis">
					<span class="idt-10">标题</span>
				</div>
				<div class="b-fl pf-c2 size-cell">大小</div>
				<div class="b-fl pf-c5">上传目录</div>
				<div class="b-fl pf-c3">状态</div>
				<div class="b-fl pf-c4">操作</div>
			</div>
			<div class="upload-exception-msg bdr-n-cau"
				id="uploadExceptionMsgContainer">
				<div class="upload-exception-msg-inner clearfix">
					<a id="uploadExceptionRetry"
						class="upload-exception-msg-cmd b-fr sprite-new b-split-btn b-split-btn-1"
						href="javascript:;"><span class="sprite-new"><em
							class="sprite-new" style="display: none">重传失败文件</em> </span> </a>
					<p id="uploadExceptionMsg">
						有<b class="red"></b>个文件上传成功
					</p>
				</div>
			</div>
			<div class="dialog-content clearfix">
				<div class="uploading-files upload-dialog-col"
					id="uploadFileListContainer">
					<dl id="_disk_id_14" class="infinite-listview"
						style="margin-top: 0px;"></dl>
				</div>
				<div style="right: -1px; display: none;" class="scrollbar"
					unselectable="on" id="_disk_id_9">
					<div id="_disk_id_10"
						class="scrollbar-arrow scrollbar-arrow-up sprite"
						unselectable="on" dir="up"></div>
					<div style="height: 314px" class="scrollbar-tracker"
						unselectable="on" id="_disk_id_12">
						<div class="scrollbar-thumb" unselectable="on" id="_disk_id_13"
							style="height: 0px; top: 0px;"></div>
					</div>
					<div id="_disk_id_11"
						class="scrollbar-arrow scrollbar-arrow-down sprite"
						unselectable="on" dir="down"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>