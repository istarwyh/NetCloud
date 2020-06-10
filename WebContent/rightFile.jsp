<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ page
language="java" import="java.util.*" pageEncoding="utf-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>软微网盘-全部文件</title>
<link rel="shortcut icon" href="images/ico.ico" />
<script type="text/javascript">

	function userchecked(){
		
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
		document.getElementById("rena").src = "images/rena.png";
		
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

<link href="css/extend.css" rel="stylesheet" />
</head>
<script type="text/javascript"><!--  
$(function(){  
 $("#barCmdNewFolder").click(function(){  
   
   $("#main").after('<div node-type="item" data-category="6" '+
											'onmouseout="this.className=\'item global-clearfix\'" '+
											'onmouseover="this.className=\'item global-clearfix item-hover\'" '+
											'data-extname="7z" class="item global-clearfix">'+

					
											'<div class="col c1" style="width: 60%;">'+
											
											   '<span class="ico global-icon-16 global-icon-16-dir"></span>'+

                                                
                                                '<div node-type="name" class="name" title="">'+
													'<span> '+
												     '<form action="createdir.action" method="post" name="form1"><input type="hidden" name="dst" value="${dst }"><div>' + 
													     '<input name="name" type="text" onKeyDown="this.onkeyup();" '+ 
														 'onKeyUp="this.size=(this.value.length>20?this.value.length:20);" '+
														 'style="border:1px solid #CCC; margin-top:9px;height:21px;float:left;margin-left:38px" value="新建文件夹" size="20" onBlur="if(this.value==\'\') this.value=\'新建文件夹\';" ><span style="padding-top:9px;height:30px;float:left"><input type="submit" value="" style=" background:url(images/true.png);height:21px; width:22px;border:0;margin-left:-28px;"><input type="button" class="del-text"   style="background:url(images/close.png);height:21px; width:22px;border:0;margin-left:3px;" ></span></div></form>'+
														 '</span>'+
												'</div>'+
											
                                                  
												'<div node-type="edit-name" class="edit-name">'+
													'<input node-type="edit-name-box" class="box" type="text" value="">'+
													' <span node-type="edit-name-sure" class="sure"></span>'+
													 '<span node-type="edit-name-cancel" class="cancel"></span>'+
												'</div>'+
						
											'</div>'+
                                         

											'<div class="col" style="width: 16%">-</div>'+

											'<div class="col" style="width: 23%">'+
											
                                                '-'+
											'</div>'+


										'</div>'); 
										
    
 });  
 $('.del-text').live('click',function(){  
 $(this).parent().parent().parent().parent().parent().parent().parent().remove();  
 
 });
   
});  
 --></script>  
 <script type="text/javascript">
		function dosubmit() {
			document.form1.submit();
			visib();
		}
</script>

    <script>
    var id=0; 
    
    function submitForm(){
        id=window.setInterval(addressAction, 300);      
        $("#uploadform").submit();/*提交第一个表单*/       
      }
    
    function addressAction(){
        $.post(
          'progress.action',
          function(data){
            if(data.currentItem==0){
              $("#m", window.parent.document).text('0%');
            }else if(data.state.rate<100){
              $("#m", window.parent.document).text(data.state.readedBytes+'/'+data.state.totalBytes+':'+data.state.rate+'%');
              
              $("#img", window.parent.document).html("");   
              
              var num=data.state.rate/10;  
              
              for(var i=1;i<=num;i++){
                $("#img", window.parent.document).append("<img src='./images/grid.gif' />");
              }
              for(var j=1;j<=10-num;j++){
                $("#img", window.parent.document).append("<img src='./images/gray.gif' />");
              }
            }else if(data.state.rate==100) {       
                $("#m", window.parent.document).text('文件过大，正在保存。。。'); 
                $("#img", window.parent.document).html(""); 
                /* window.clearInterval(id); */
            }else if(data.state.rate==101) {       
                $("#m", window.parent.document).text('正在后台加密文件中。。。');   
                $("#img", window.parent.document).html(""); 
                /* window.clearInterval(id); */
            }else if(data.state.rate==102) {       
                $("#m", window.parent.document).text('正在上传文件至HDFS。。。');  
                $("#img", window.parent.document).html(""); 
                /* window.clearInterval(id); */
            }else{             
              $("#m", window.parent.document).text('');  
              $("#img", window.parent.document).html(""); 
            }
            
            if(data.state.rate==103) {
            	$("#m", window.parent.document).text('');  
                $("#img", window.parent.document).html(""); 
                window.clearInterval(id);
            }
            
          },
          'json'          
         );
      }
       

    </script>
<body>

	<div id="doc" style="width: auto;">
		<div id="bd" class="clearfix">
			<div id="yao-main">
				<div id="header-shaw">
					<div class="location clearfix b-header b-bdr-7">

						<ul class="b-list-2 bar-cmd-list">
							<li class="b-list-item b-rlv"><a class="lbtn icon-pl35"
								id="barCmdUpload" _i="6"><em class="icon-update"></em><b>上传文件</b></a>
								<form action="uploadfile.action" enctype="multipart/form-data"
									method="post" name="form1" id="uploadform" class="html5-uploader-ctrl">
									<input id="uploadfile" type="file" name="file" multiple
										class="html5-uploader-ctrl-fld" onChange="submitForm()">
								</form></li>
							<li class="b-list-item"><a class="icon-btn-createfile"
								style="text-decoration: none" hidefocus="true"
								target="rightFrame" href="javascript:void(0)"
								id="barCmdNewFolder" title="新建文件夹" _i="7">新建文件夹</a></li>
						</ul>
					</div>
				</div>
			<c:if test="${type != '' }">
				<div style="font-color:#358edd" class="allfile">${requestScope.type }</div>
			</c:if>
			
			<c:if test="${fn:length(sessionScope.dirs) == 0 }">
				<div class="allfile">全部文件</div>
			</c:if>
			
			<c:if test="${fn:length(sessionScope.dirs) != 0 }">
				<div class="allfile">
				<a href='updir.action'>返回上一级</a> | <a href='allfile.action'>全部文件</a> >
				<c:forEach items="${sessionScope.dirs}" var="dir" varStatus="status">
					<c:if test="${fn:length(sessionScope.dirs) != status.count }">
						<a href="jumpdir.action?filepath=${dir.filepath }">${dir.name }</a>>
					</c:if>
					<c:if test="${fn:length(sessionScope.dirs) == status.count }">
						${dir.name }
					</c:if>
				</c:forEach>
				</div>
			</c:if>
				
				<div class="yao-b" style="margin-left: 0px;">
					<div node-type="module" class="module-crumbs">
						<div class="title global-clearfix">
							<!-- 文件列表  -->
							<div node-type="module" class="module-list-view"
								style="display: block;">
								<div node-type="wrapper" class="list-view-home">
									<div node-type="title" class="title"
										style="padding-right: 17px;">

										<div class="item global-clearfix">
											<!-- 第一列 -->
											<div node-type="title-col" data-key="name" class="col c1"
												style="width: 60%">


												<div class="chk">
													<span>文件名</span> <span node-type="order-status"
														class="asc desc" style="visibility: hidden;"></span>


													<div id="usercheck"
														style="display: inline-block; height: 10px; width: 9px; position: relative; top: 1px; visibility: hidden;">
														<!-- 背景图  -->
														<a
															style="background: url('images/btn_sprit.gif') no-repeat scroll 0px -144px transparent; color: #333; display: inline-block; white-space: nowrap; outline: 0px none; text-decoration: none; font-size: 12px; height: 30px; line-height: 28px; padding-left: 1px; position: relative; margin-right: 0px; vertical-align: middle;"
															onClick="test()" node-type="btn-operate" data-key="share">
															<!-- 小图标  --> <span
															style="top: 7px; left: 14px; position: absolute; display: block; height: 20px; width: 20px; background: url('images/btn_icon.gif') no-repeat scroll -210px -233px transparent;"></span>
															<!-- 字体  --> <span
															style="font-weight: 100; display: block; background: url('images/btn_sprit.gif') no-repeat scroll right -144px #F2F6FF; text-decoration: none; text-align: center; cursor: pointer; color: #666; padding-right: 14px; height: 28px; line-height: 28px;">分
																享</span>
														</a>
														<!-- 下载  -->
														<a
															style="background: url('images/btn_sprit.gif') no-repeat scroll 0px -144px transparent; color: #333; display: inline-block; white-space: nowrap; outline: 0px none; text-decoration: none; font-size: 12px; height: 30px; line-height: 28px; padding-left: 1px; position: relative; margin-right: 0px; vertical-align: middle;"
															node-type="btn-operate" data-key="download"> <span
															style="top: 7px; left: 14px; position: absolute; display: block; height: 20px; width: 20px; background: url('images/btn_icon.gif') no-repeat scroll -210px -213px transparent;"></span>

															<span
															style="font-weight: 100; display: block; background: url('images/btn_sprit.gif') no-repeat scroll right -144px #F2F6FF; text-decoration: none; text-align: center; cursor: pointer; color: #666; padding-right: 14px; height: 28px; line-height: 28px;">下
																载</span>
														</a>
														<!-- 删除  -->
														<a
															style="background: url('images/btn_sprit.gif') no-repeat scroll 0px -144px transparent; color: #333; display: inline-block; white-space: nowrap; outline: 0px none; text-decoration: none; font-size: 12px; height: 30px; line-height: 28px; padding-left: 1px; position: relative; margin-right: 0px; vertical-align: middle;"
															node-type="btn-operate" data-key="share"> <span
															style="top: 7px; left: 14px; position: absolute; display: block; height: 20px; width: 20px; background: url('images/btn_icon.gif') no-repeat scroll -210px -279px transparent;"></span>

															<span
															style="font-weight: 100; display: block; background: url('images/btn_sprit.gif') no-repeat scroll right -144px #F2F6FF; text-decoration: none; text-align: center; cursor: pointer; color: #666; padding-right: 14px; height: 28px; line-height: 28px;">删
																除</span>
														</a> <span style="display: inline;"
															node-type="btn-operate btn-device" data-key="push"
															class="btn-device-wrapper"> </span>

													</div>
												</div>
											</div>

											<!-- 	其他列 -->

											<div node-type="title-col" data-key="size" class="col"
												style="width: 16%;">
												大小 <span node-type="order-status" class="asc desc"
													style="visibility: hidden;"></span>
											</div>

											<div node-type="title-col" data-key="time" class="col"
												style="width: 23%; border-right: none;">
												修改日期 <span node-type="order-status" class="asc desc"
													style="visibility: visible;"></span>
											</div>

										</div>



										<!-- 新建文件夹 -->
										<div node-type="new-dir" class="item global-clearfix"
											style="display: none;">
											<!-- 第一列 -->
											<div class="col c1" style="width: 60%;">

												<span class="ico global-icon-16 global-icon-16-dir">
												</span>
												<!-- 文件名称编辑 -->
												<div class="edit-name" style="display: block;">
													<input node-type="new-dir-box" class="box" type="text"
														value=""> <span node-type="new-dir-sure"
														class="sure"></span> <span node-type="new-dir-cancel"
														class="cancel"></span>
												</div>
											</div>

											<!-- 其他列 -->

											<div class="col" style="width: 16%">-</div>

											<div class="col" style="width: 23%">-</div>

										</div>



									</div>
									<div node-type="list" class="list"
										style="height: 616px; overflow: auto;">

										<div node-type="item" data-id="1116310753811463"
											data-category="6" id="main"
											onmouseout="this.className='item global-clearfix'"
											onmouseover="this.className='item global-clearfix item-hover'"
											data-extname="7z" class="item global-clearfix">


											<!-- 第一列 -->

											<!-- 复制 -->

										</div>

										<c:forEach items="${files}" var="fileInfo">
										<c:if test="${fileInfo.isdirectory == 1 }">
										<div node-type="item" data-id="1116310753811463"
											data-category="6"
											onmouseout="this.className='item global-clearfix'"
											<c:if test="${(rename == null) }">
												onmouseover="this.className='item global-clearfix item-hover'"
											</c:if>
											<c:if test="${(rename != null) && !(fn:contains(fileInfo.filename, rename) && (fn:length(rename) == fn:length(fileInfo.filename)))}">
												onmouseover="this.className='item global-clearfix item-hover'"
											</c:if>
											data-extname="7z" class="item global-clearfix">


											<div class="col c1" style="width: 60%;">

												<span class="ico global-icon-16 global-icon-16-dir"></span>

												<!-- 文件名称 -->

												<div node-type="name" class="name" title="${fileInfo.filename }">
													
														<c:if test="${(rename != null) && (fn:contains(fileInfo.filename, rename) && (fn:length(rename) == fn:length(fileInfo.filename)))}">
															<span class="name-text-wrapper">
															<form action="renamefile.action" method="post" name="form1">
															<input type="hidden" name="dst" value="${dst }">
															<input type="hidden" name="oldname" value="${fileInfo.filename }">
															<div>
																<input name="name" type="text" onkeydown="this.onkeyup();" 
																onkeyup="this.size=(this.value.length>20?this.value.length:20);" 
																style="border:1px solid #CCC; margin-top:9px;height:21px;float:left;margin-left:38px" 
																value="${fileInfo.filename }" size="20" onblur="if(this.value=='') this.value='${fileInfo.filename }';" 
																>
																<span style="padding-top:9px;height:30px;float:left">
																<input type="submit" value="" 
																style=" background:url(images/true.png);height:21px; width:22px;border:0;margin-left:-28px;">
																<input type="button" onclick="javascript:window.location.href='data.action'" class="del-text" style="background:url(images/close.png);height:21px; width:22px;border:0;margin-left:3px;">
																</span>
															</div>
															</form>
															</span>
														</c:if>
														
														<c:if test="${(rename != null) && !(fn:contains(fileInfo.filename, rename) && (fn:length(rename) == fn:length(fileInfo.filename)))}">
															<span class="name-text-wrapper" onclick="window.location.href='downdir.action?name=${fileInfo.filename }'">
															<form action="rename.html" method="post">
																<input type="hidden" name="oldaddress"
																	value="${fileInfo.filename }"> <input type="text"
																	name="name" class="name-text" value="${fileInfo.filename }"
																	style="margin-top: 8px; background-color: transparent; border: none; cursor: pointer"
																	size="40" id="name-text" readonly />
															</form>
															</span>
														</c:if>
														
														<c:if test="${rename == null }">
															<span class="name-text-wrapper" onclick="window.location.href='downdir.action?name=${fileInfo.filename }'">
															<form action="rename.html" method="post">
																<input type="hidden" name="oldaddress"
																	value="${fileInfo.filename }"> <input type="text"
																	name="name" class="name-text" value="${fileInfo.filename }"
																	style="margin-top: 8px; background-color: transparent; border: none; cursor: pointer"
																	size="40" id="name-text" readonly />
															</form>
															</span>
														</c:if> 
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
														title="重命名" href="rename.action?name=${fileInfo.filename }" id="rename"
														onmouseout="renaOut()" onMouseOver="renaOver()"> <img
														alt="dd" src="images/rena.png"
														onmouseover="this.src='images/renapress.png'"
														onmouseout="this.src='images/rena.png'">
													</a> <a node-type="btn-item" title="删除" href="deletefile.action?name=${fileInfo.filename }"
														onmouseover="delOver()" onMouseOut="delOut()">
														<img alt="ss" id="del" src="images/dele.png"
														onmouseover="this.src='images/delepress.png'"
														onmouseout="this.src='images/dele.png'" />

													</a>


												</div>
											</div>

											<!-- 其他列 -->

											<div class="col" style="width: 16%">-</div>

											<div class="col" style="width: 23%">${fileInfo.date }</div>


											<!-- 复制 -->

										</div>
										</c:if>
										</c:forEach>
										
										
										<c:forEach items="${files}" var="fileInfo">
											<c:if test="${fileInfo.isdirectory == 0 }">
										<div node-type="item" data-id="1116310753811463"
											data-category="6"
											onmouseout="this.className='item global-clearfix'"
											<c:if test="${(rename == null) }">
												onmouseover="this.className='item global-clearfix item-hover'"
											</c:if>
											<c:if test="${(rename != null) && !(fn:contains(fileInfo.filename, rename) && (fn:length(rename) == fn:length(fileInfo.filename)))}">
												onmouseover="this.className='item global-clearfix item-hover'"
											</c:if>
											data-extname="7z" class="item global-clearfix">
											<!-- 第一列 -->
											<div class="col c1" style="width: 60%;" id="aaaaaa"
												onMouseDown="onmousedown(e)">
													<c:if test="${fileInfo.filetype.equals('audio') }">
														<span class="ico global-icon-16 global-icon-16-mp3"></span>
													</c:if>	
													<c:if test="${fileInfo.filetype.equals('video') }">
														<span class="ico global-icon-16 global-icon-16-avi"></span>
													</c:if>
													<c:if test="${fileInfo.filetype.equals('zip') }">
														<span class="ico global-icon-16 global-icon-16-zip"></span>
													</c:if>
													<c:if test="${fileInfo.filetype.equals('document') }">
														<span class="ico global-icon-16 global-icon-16-doc"></span>
													</c:if>
													<c:if test="${fileInfo.filetype.equals('picture') }">
														<span class="ico global-icon-16 global-icon-16-png"></span>
													</c:if>
													<c:if test="${fileInfo.filetype.equals('other') }">
														<span class="ico global-icon-16 global-icon-16-other"></span>
													</c:if>		

												<div node-type="name" class="name" title="${fileInfo.filename }">
													<span class="name-text-wrapper">
														<c:if test="${(rename != null) && (fn:contains(fileInfo.filename, rename) && (fn:length(rename) == fn:length(fileInfo.filename)))}">
															<span class="name-text-wrapper">
															<form action="renamefile.action" method="post" name="form1">
															<input type="hidden" name="dst" value="${dst }">
															<input type="hidden" name="oldname" value="${fileInfo.filename }">
															<div>
																<input name="name" type="text" onkeydown="this.onkeyup();" 
																onkeyup="this.size=(this.value.length>20?this.value.length:20);" 
																style="border:1px solid #CCC; margin-top:9px;height:21px;float:left;margin-left:38px" 
																value="${fileInfo.filename }" size="20" onblur="if(this.value=='') this.value='${fileInfo.filename }';" 
																>
																<span style="padding-top:9px;height:30px;float:left">
																<input type="submit" value="" 
																style=" background:url(images/true.png);height:21px; width:22px;border:0;margin-left:-28px;">
																<input type="button" onclick="javascript:window.location.href='data.action'" class="del-text" style="background:url(images/close.png);height:21px; width:22px;border:0;margin-left:3px;">
																</span>
															</div>
															</form>
															</span>
														</c:if>
														
														<c:if test="${(rename != null) && !(fn:contains(fileInfo.filename, rename) && (fn:length(rename) == fn:length(fileInfo.filename)))}">
															<span class="name-text-wrapper">
															<form action="rename.html" method="post">
																<input type="hidden" name="oldaddress"
																	value="${fileInfo.filename }"> <input type="text"
																	name="name" class="name-text" value="${fileInfo.filename }"
																	style="margin-top: 8px; background-color: transparent; border: none; cursor: pointer"
																	size="40" id="name-text" readonly />
															</form>
															</span>
														</c:if>
														
														<c:if test="${rename == null }">
															<span class="name-text-wrapper">
															<form action="rename.html" method="post">
																<input type="hidden" name="oldaddress"
																	value="${fileInfo.filename }"> <input type="text"
																	name="name" class="name-text" value="${fileInfo.filename }"
																	style="margin-top: 8px; background-color: transparent; border: none; cursor: pointer"
																	size="40" id="name-text" readonly />
															</form>
															</span>
														</c:if> 
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


													<span class="more-wrapper"> <span
														node-type="btn-more" title="分享" class="btn more" id="st"></span>
														<div node-type="more-list" class="more-list"
															style="display: none;">
																<a node-type="btn-item" class="more-item"
																	href="sharefilebytype.action?name=${fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(fileInfo.url, '#', '%23'), '%', '%25'), '&', '%26'), '[', '%5B'), ']', '%5D') }&shareLocation=0">云共享</a>
															<c:forEach items="${departmentList}" var="department">
																<a node-type="btn-item" class="more-item"
																	href="sharefilebytype.action?name=${fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(fileInfo.url, '#', '%23'), '%', '%25'), '&', '%26'), '[', '%5B'), ']', '%5D') }&shareLocation=${department.id }">${department.name }</a>
															</c:forEach>
														</div>
													</span> <a node-type="btn-item" title="重命名" href="rename.action?name=${fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(fileInfo.filename, '#', '%23'), '%', '%25'), '&', '%26'), '[', '%5B'), ']', '%5D') }"
														onmouseout="renaOut()" onMouseOver="renaOver()"> <img
														alt="dd" src="images/rena.png"
														onmouseover="this.src='images/renapress.png'"
														onmouseout="this.src='images/rena.png'" />
													</a> <a node-type="btn-item" title="删除" href="deletefile.action?name=${fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(fileInfo.filename, '#', '%23'), '%', '%25'), '&', '%26'), '[', '%5B'), ']', '%5D') }"
														onmouseover="delOver()" onMouseOut="delOut()"> <img
														alt="ss" id="del" src="images/dele.png"
														onmouseover="this.src='images/delepress.png'"
														onmouseout="this.src='images/dele.png'" /> 
													</a> <a node-type="btn-item" title="下载" data-key="download"
														<%-- class="btn download" onClick="visib();" href="downloadfile.action?downloadName=${fileInfo.filename }"> </a> --%>
														class="btn download" onClick="visib();" href="download?downloadName=${fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(fileInfo.filename, '#', '%23'), '%', '%25'), '&', '%26'), '[', '%5B'), ']', '%5D') }"> </a>
												</div>
											</div>

											<!-- 其他列 -->

											<div class="col" style="width: 16%">
												${fileInfo.size }
											</div>

											<div class="col" style="width: 23%">
												${fileInfo.date }
											</div>

										</div>
											</c:if>
										</c:forEach>

									</div>
									<div id="barDown" style="visibility: hidden"
										style="margin-left: 18px;margin-top: 10px">
										<table border="0" width="5%" cellspacing="0" cellpadding="4"
											style="border-collapse: collapse" bgcolor="#FFFFff"
											height="20">
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

				
				<!--<script type="text/javascript">
               $(function() {
				   $("#rename").click(function() {
					    alert("aaaaaaaaaaa");
						 $(this).parent().parent().parent().find("#name-text").css("border","2px solid #CCC");
						
					   });
				 });
            </script>-->
				<script type="text/javascript">
                               $(function() {
								     $(".more-wrapper").hover(function() {
										     $(this).find(".more-list").toggle();
										 });
								     /* $(".name").click(function() {
										     $(".allfile").html("<a href='javascript:void(0)'>返回上一级</a> | <a href='javascript:void(0)'>全部文件</a> >" + $(this).find(".name-text").val());
										 }); */
								   });
								  
								
                            </script>
                           
</body>
</html>