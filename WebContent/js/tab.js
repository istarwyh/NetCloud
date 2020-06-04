//2012/10/25

//
function parentTabClick(obj)
{
	if($(obj).hasClass("open")){
		$(".p_navTit.js_parentTab").next().slideUp(500);
		$(".p_navTit.js_parentTab").removeClass("open");
		$(obj).next().slideUp(500);
		$(obj).removeClass("open")
	}else{
		$(".p_navTit.js_parentTab").next().slideUp(500);
		$(".p_navTit.js_parentTab").removeClass("open");
		$(obj).next().slideDown(500);
		$(obj).addClass("open");
	}
}
$(function(){
	$('.on').parent().parent().parent().children('.p_navTit').addClass('open');
	$('.on').parent().parent().parent().children('.p_navList').slideDown(500);
	//购买
	//$("a.js_buy").click(function(){
	//$(this).attr("href","http://www.baidu.com")
	//})
	
	//display tab效果
	var ptabli = $(".p_contTab").find("li");
	//alert(ptabli.length)
	ptabli.click(function(){
		$(this).addClass("active").siblings().removeClass("active");
		})	
	
	var faqH = $(".js_floattop_faq").length>0 ? $(".js_floattop_faq").offset().top : 0; 
	var H = $(".js_floattop").length>0 ? $(".js_floattop").offset().top : 0; 
	var isvH = $(".js_floattop_isv").length>0 ? $(".js_floattop_isv").offset().top : 0; 
	var caseH = $(".js_floattop_case").length>0 ? $(".js_floattop_case").offset().top : 0; 
	$(window).scroll(function () {
		var leftwidth =($(window).width()-1140)/2+268;//距离左侧的距离
		//var topheight =$(".p_container").offsetTop();
		if ($(this).scrollTop() > H) {
			//nav.hide();
			$(".js_floattop").css({
				left:leftwidth,
				width:862
			})
				
			$(".js_floattop").addClass("navstyle");
			$(".anchor").css({
				height:39,
				display:'block'
			})
			$(".p_contTrait").css("borderTop")
		} 
		if($(this).scrollTop()<H){
			//nav.hide();
			$(".js_floattop").removeClass("navstyle");
			$(".anchor").css({
				//height:0
			})
			$(".p_contTrait").css("borderTop","none")
		}
		//FAQ
		if ($(this).scrollTop() > faqH) {
			//nav.hide();
			$(".js_floattop_faq").css({
				left:leftwidth,
				width:862
			})
				
			$(".js_floattop_faq").addClass("navstyle");
			$(".anchor").css({
				height:39,
				display:'block'
			})
			$(".p_contTrait").css("borderTop")
		} 
		if($(this).scrollTop()<faqH){
			//nav.hide();
			$(".js_floattop_faq").removeClass("navstyle");
			$(".anchor").css({
				//height:0
			})
			$(".p_contTrait").css("borderTop","none")
		}
		//isv
		if ($(this).scrollTop() > isvH) {
			//nav.hide();
			$(".js_floattop_isv").css({
				left:leftwidth,
				width:862
			})
				
			$(".js_floattop_isv").addClass("navstyle");
			$(".anchor").css({
				height:39,
				display:'block'
			})
			$(".p_contTab").css("borderTop")
		} 
		if($(this).scrollTop()<isvH){
			//nav.hide();
			$(".js_floattop_isv").removeClass("navstyle");
			$(".anchor").css({
				//height:0
			})
			$(".p_contTab").css("borderTop","none")
		}
		//case
		if ($(this).scrollTop() > caseH) {
			//nav.hide();
			$(".js_floattop_case").css({
				left:leftwidth,
				width:862
			})
				
			$(".js_floattop_case").addClass("navstyle");
			$(".anchor").css({
				height:39,
				display:'block'
			})
			$(".p_contTrait").css("borderTop")
		} 
		if($(this).scrollTop()<caseH){
			//nav.hide();
			$(".js_floattop_case").removeClass("navstyle");
			$(".anchor").css({
				//height:0
			})
			$(".p_contTrait").css("borderTop","none")
		}
		
	
	});
	
	//展开隐藏tab  faq.
	$(".p_type_tit").each(function(index){		
		$(this).click(function(){
			if($(this).hasClass("open")){
				$(this).removeClass("open");
				$(this).addClass("close");
				$(this).siblings().slideUp(500);
			}else{
				$(".p_type_tit").removeClass("open");
				$(".p_type_tit").addClass("close");
				$(this).addClass("open");
				$(this).removeClass("close");
				$(this).siblings().slideDown(500);
				$(this).parents().siblings().find(".p_type_con").slideUp(500);
			}
		})
	})
	
	//features
	$(".p_matter").css({
		height:96,
		overflow:'hidden'
	})
	$("span.move_btn").each(function(index){
		$(this).click(function(){
			if($(this).hasClass("close_btn")){
				$(this).removeClass("close_btn");
				$(this).addClass("open_btn");
				$(this).siblings(".p_matter").css({
					height:'96',
					overflow:'hidden'
				})
				
			}else{
				$(this).addClass("close_btn");
				$(this).removeClass("open_btn");
				$(this).siblings(".p_matter").css({
					height:'auto',
					overflow:'auto'
				})
				//safe
				$(this).parents().parents().siblings('.p_safe_list').find("span.move_btn").removeClass("close_btn")
				$(this).parents().parents().siblings('.p_safe_list').find("span.move_btn").addClass("open_btn")
				$(this).parents().parents().siblings('.p_safe_list').find(".p_matter").css({
					height:'96',
					overflow:'hidden'
				})
				//feature
				$(this).parents().parents().siblings('.p_feature_list').find("span.move_btn").removeClass("close_btn")
				$(this).parents().parents().siblings('.p_feature_list').find("span.move_btn").addClass("open_btn")
				$(this).parents().parents().siblings('.p_feature_list').find(".p_matter").css({
					height:'96',
					overflow:'hidden'
				})
				
				
				
				
			}
		})
	})
	//2012-11-13  cooperation_four.html
	cooperationFour()//
	function cooperationFour(){
		var moveBtn = $(".js_moveBtn"),
			fourContent = $(".js_fourContent");
		moveBtn.click(function(){
			if($(this).hasClass("open")){
				$(this).removeClass("open");
				$(this).addClass("close");
				$(this).parents().parents().parents().siblings('.box_mode').find('.js_moveBtn').addClass("open");
				$(this).parents().parents().parents().siblings('.box_mode').find('.js_moveBtn').removeClass("close");
				$(this).parents().siblings('.js_fourContent').slideDown(500);
				$(this).parents().parents().parents().siblings('.box_mode').find('.js_fourContent').slideUp(500);
			}else{
				$(this).removeClass("close");
				$(this).addClass("open");
				$(this).parents().siblings('.js_fourContent').slideUp(500);
			}
		
		})
	
	}
	//2012/11/14 合作咨询
	function collaborate(){
		var html = ['<div class="bgcolor"></div>',
						'<div class="pop-up w360 js_alertdiv">',
						  '<div class="box">',
								'<div class="item_tit">',
									 '<div class="ext close"><a href="#" class="png"></a></div>',
									 '<ul>',
										'<li class="on"><span class="png bgimgno">合作咨询</span></li>',
									 '</ul>',
								'</div>',
								'<div class="pop-up_con">',
									'<div class="pop-up_con_join">',
										'<p>如果您有任何合作意向或意见反馈，可通过以下方式联系我们：</p> ',
										'<p><b>电话：</b><font>4000-955-988</font></p> ',
										'<p><b>邮箱：</b><a href="mailto://hwclouds.bd@huawei.com">hwclouds.bd@huawei.com</a></p>',
									'</div>',
							   '</div>',
						  '</div>',
					 '</div>'].join("");
		var html = $(html).prependTo("body").show();
		var alertdiv = $(".js_alertdiv"),
			 closebtn = $(".close");
		alertdiv.css({
			left:($(window).width()-alertdiv.width())/2,
			top:($(window).height()-alertdiv.height())/2
		})
		closebtn.click(function(){
			html.hide();
			$(".bgcolor").hide();
		})
	
	}
	
$(function(){
	//合作咨询
	var CallOpenBtn = $(".js_CallOpenBtn")
	CallOpenBtn.click(function(){
		collaborate();
	})
})
	
	
})










