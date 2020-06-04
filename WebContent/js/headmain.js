// JavaScript Document

$(document).ready(function(){
						
//	$("#lmq_denglu").click(function(){
//		$("#lmq_denglu_kuang").toggle();
//		$("#lmq_denglu").toggleClass("dl_btn01");
//		});
//	$(".denglu_kuang_bt_btn").click(function(){
//			$("#lmq_denglu_kuang").hide();
//			$("#lmq_denglu").removeClass("dl_btn01");
//											 });
	//登录
	$("#t1").val('用户名/邮箱/手机');
		$("#t1,#t2").click(function(){
				if($("#t1").val()=='用户名/邮箱/手机'){
					$(this).css("color","#5A5A5A").val('');				
					}			
					}).blur(function(){
						if($("#t1").val()==''){
							$("#t1").css("color","#b2b2b2").val('用户名/邮箱/手机')}
						})
//////////////////////
var Close = function(event){     
  	$(".z_ser_btn").stop().animate({right:-237});
   	$(".z_ser_btn").css("width","277px");
	};
var Open = function(event){
   $('.z_ser_btn').stop().animate({right:0},300);
    $(".z_ser_btn").css("width","277px");
   };
var Stop = function(event){
  e = event || window.event;
  if(e.stopPropagation){
   e.stopPropagation();
  }else {
   e.cancelBubble = true;
  }
 };
 $("#kfbtn").bind('mouseover',Open);
 //$(".z_kf_r").bind({mouseleave:function(){
//			t=setTimeout(function(){	
//			$(".z_ser_btn").stop().animate({right:-237});
//   			$(".z_ser_btn").css("width","277px");
//									},800)		
//   },mouseenter:function(){	
//	clearTimeout(t);						
//	$('.z_ser_btn').stop().animate({right:0},300);
//    $(".z_ser_btn").css("width","277px");
//	   }  
//   });
 $(".kfclose").bind('click',Close);
///////////////////////////////

 //菜单鼠标事件
 $("#nav").children().mouseover(function(){
     var menu = $(this).children(".top_list");
     if(menu.length>0)
     {
         var l = menu.find("dl").length;
         menu.width(l*160);
         menu.show();
         $(this).addClass("overr");
     }
 }).mouseleave(function(){
     var menu = $(this).children(".top_list");
     if(menu.length>0)
     {
         $(this).removeClass("overr");
         menu.hide();
     }
     });
});

//需要删除
function logints(){
	$("#login_ts").toggle();
	}
	//需要删除
