(function(){var _={};_.NOTI_HOME_MASTER="ShareHome_NOTIED_M";_.NOTI_HOME_SLAVE="ShareHome_NOTIED_S";_.notify=function(C){var H,G,F=Page.inViewMode(Page.VIEW_HOME_PAGE_SLAVE)?encodeURI(disk.getParam("third")):FileUtils.third,E=FileUtils.sysUK,D="http://"+location.host+"/share/home";if(Page.inViewMode()==Page.VIEW_SHARE_PROPERTY_OWN){C=_.NOTI_HOME_MASTER;G='<span class="share-tips">\u4f60\u6709\u81ea\u5df1\u7684\u5206\u4eab\u4e3b\u9875\u5566\uff0c\u53ea\u6709\u901a\u8fc7\u516c\u5f00\u94fe\u63a5\u5206\u4eab\u7684\u6587\u4ef6\u624d\u4f1a\u51fa\u73b0\u5728\u4f60\u7684\u5206\u4eab\u4e3b\u9875\u91cc\uff0c\u522b\u4eba\u90fd\u53ef\u4ee5\u6765\u8bbf\u95ee\u54e6\u3002</span> <a class="to-sharehome" hideFocus href="'+D+'" target="_blank">\u53bb\u6211\u7684\u5206\u4eab\u4e3b\u9875>></a>';}else{C=_.NOTI_HOME_SLAVE;G='<span class="share-tips">\u8fd9\u662f\u522b\u4eba\u770b\u5230\u7684\u4f60\u7684\u5206\u4eab\u4e3b\u9875\uff0c\u8fd9\u91cc\u53ea\u6709\u4f60\u901a\u8fc7\u516c\u5f00\u94fe\u63a5\u5206\u4eab\u7684\u6587\u4ef6\u54e6\u3002</span>';}H=localStorage.getItem(C);if(H){}else{var A=Page.showNotification(true,G);$("#header-shaw").before($(A));if(A==null){if(disk.DEBUG){console.warn("show plugin nofication failed, not an idea checking spot");}}else{var B=A.getElementsByTagName("div")[0];B.onclick=function(A){Page.showNotification(false);localStorage.setItem(C,1);var _=A||window.event;if(typeof _.stopPropagation!="undefined"){_.stopPropagation();}else{_.cancelBubble=true;}return false;};}}};_.main=function(){var _=this;};_.getPersonalInfo=function(){var A;if(Page.inViewMode(Page.VIEW_SHARE_PROPERTY_OWN)||Page.inViewMode(Page.VIEW_PROPERTY_OTHER)){A=FileUtils.sysUK;}else{if(Page.inViewMode(Page.VIEW_HOME_PAGE_SLAVE)){A=disk.getParam("uk");}}var _=disk.api.RestAPI.normalize(disk.api.RestAPI.GET_UINFO,FileUtils.bdstoken)+"&query_uk="+A+"&t="+new Date().getTime();$.get(_,function(A){try{var B=$.parseJSON(A);FileUtils.userInfo=B.user_info.intro;var _=$(".personal-info")[0],C=$(".share-personal-info")[0];if(FileUtils.userInfo){if(_){_.innerHTML=FileUtils.userInfo;_.attr("title",FileUtils.userInfo);if(_.width()>$(".personal-show").width()){$(".personal-edit-btn-container").addClass("personal-edit-no-p");}}if(C){C.innerHTML=FileUtils.userInfo;}}else{if(FileUtils.sysISSELF){if(_){_.innerHTML="\u8bf4\u660e\uff1a\u4f60\u8fd8\u6ca1\u6709\u4e2a\u4eba\u4ecb\u7ecd\u5462\u3002";}if(C){C.innerHTML="\u8bf4\u660e\uff1a\u4f60\u8fd8\u6ca1\u6709\u4e2a\u4eba\u4ecb\u7ecd\u5462\u3002";}}else{if(_){_.innerHTML="\u8bf4\u660e\uff1aTa\u5f88\u61d2\u4ec0\u4e48\u4e5f\u6ca1\u7559\u4e0b\u3002";}if(C){C.innerHTML="\u8bf4\u660e\uff1aTa\u5f88\u61d2\u4ec0\u4e48\u4e5f\u6ca1\u7559\u4e0b\u3002";}}}$(".sharenum .sellcnt").html((B.user_info.c2c_user_product_count||0)+"\u51fa\u552e");$(".sharenum .buycnt").html((B.user_info.c2c_user_buy_count||0)+"\u8d2d\u4e70");}catch(D){}});};_.resetFollowNum=function(){if($(".properties").length>0){var C=FileUtils.pubshare_count,A=FileUtils.fans_count,B=FileUtils.follow_count,_=Math.max(C,A,B);if(B>99999||A>99999){if(A>99999){$(".share-num .fanscnt em")[0].innerHTML=Math.round(A/10000)+"\u4e07";}if(B>99999){$(".share-num .concerncnt em")[0].innerHTML=Math.round(B/10000)+"\u4e07";}}else{if(_>9999){$(".share-num a em").attr("style","font-size:10px;");}else{if(_>999){$(".share-num a em").attr("style","font-size:12px;");}}}}};_.getTuiNum=function(){$.ajax({type:"post",url:disk.api.RestAPI.LIKE_GET,data:{type:0,query_uk:FileUtils.sysUK,source_id:FileUtils.share_id},timeout:100000,success:function(A){A=$.parseJSON(A);if(A&&A.errno==0){var B=0;B=A.like_count>999?"999+":A.like_count;if(A.like_status){$("#barAllTui").attr({title:"\u53d6\u6d88\u8d5e"}).html("<em></em><b>\u5df2\u8d5e("+B+')</b><span class="tui-number"></span>');}else{$("#barAllTui").attr({title:"\u8d5e"}).html("<em class='icon-tui'></em><b>\u8d5e("+B+")</b><span class='tui-number'></span>");}if(A.comment_count>0){$(".title-funcs .funcs-comment").text("\u8bc4\u8bba("+A.comment_count+")");}FileUtils.tuiStatus=A.like_status;FileUtils.tuiCount=A.like_count;_.addEventHandler();}}});};_.addEventHandler=function(){$("#barAllTui").click(function(B){var A=B.target,_={state:FileUtils.tuiStatus,sourceUk:FileUtils.sysUK,type:0,sourceId:FileUtils.share_id,bdstoken:FileUtils.bdstoken,ele:$("#barAllTui")};disk.tuiBtn(_,function(){var A=FileUtils.tuiCount;if(!_.state){FileUtils.tuiCount+=1;count=FileUtils.tuiCount>999?"999+":FileUtils.tuiCount;$(".tui-number").show().text("+1").delay(500).fadeOut(500,function(){$("#barAllTui").attr({title:"\u53d6\u6d88\u8d5e"}).html("<em></em><b>\u5df2\u8d5e("+count+')</b><span class="tui-number"></span>');});}else{FileUtils.tuiCount-=1;count=FileUtils.tuiCount>999?"999+":FileUtils.tuiCount;count=FileUtils.tuiCount<0?0:FileUtils.tuiCount;$(".tui-number").show().text("-1").delay(500).fadeOut(500,function(){$("#barAllTui").attr({title:"\u8d5e"}).html('<em class="icon-tui"></em><b>\u8d5e('+count+')</b><span class="tui-number"></span>');});}FileUtils.tuiStatus=!FileUtils.tuiStatus;});});};_.installBDShare=function(A){var _="Hi\uff0c\u597d\u4e1c\u897f\u4e00\u8d77\u5206\u4eab\uff0c\u7ed9\u5927\u5bb6\u5206\u4eab\u201c"+A+"\u201d\u6587\u4ef6\u5939\uff0c\u5feb\u6765\u770b\u770b\u5427~~\u6765\u81ea#\u767e\u5ea6\u4e91#";window.bds_config={bdText:_,des:_,text:_,searchPic:1,comment:_};document.getElementById("bdshell_js").src="http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion="+Math.ceil(new Date()/3600000);$(".title-funcs .funcs-share, #bdshare_panel, #bdshare").mouseover(function(){$("#bdshare_panel").show();$(".title-funcs .funcs-share em").addClass("moreselected");}).mouseout(function(){$("#bdshare_panel").hide();$(".title-funcs .funcs-share em").removeClass("moreselected");});};$(window).ready(function(){if(Page.inViewMode(Page.VIEW_SHARE_PROPERTY_OWN)||Page.inViewMode(Page.VIEW_HOME_PAGE_SLAVE)){_.main();_.getPersonalInfo();}if(Page.inViewMode(Page.VIEW_PROPERTY_OTHER)){_.resetFollowNum();if(FileUtils.share_public_type==1){_.getTuiNum();}_.installBDShare($(".link-title .link_names").text());}});})();