// JavaScript Document
// index tab切换 start
	function setTab03Syn ( i )
	{
		selectTab03Syn(i);
	}
	
	function selectTab03Syn ( i )
	{
		switch(i){
			case 1:
			document.getElementById("TabTab03Con1").style.display="block";
			document.getElementById("TabTab03Con2").style.display="none";
			document.getElementById("TabTab03Con3").style.display="none";
			document.getElementById("font1").style.color="#000000";
			document.getElementById("font2").style.color="#ffffff";
			document.getElementById("font3").style.color="#ffffff";
			break;
			case 2:
			document.getElementById("TabTab03Con1").style.display="none";
			document.getElementById("TabTab03Con2").style.display="block";
			document.getElementById("TabTab03Con3").style.display="none";
			document.getElementById("font1").style.color="#ffffff";
			document.getElementById("font2").style.color="#000000";
			document.getElementById("font3").style.color="#ffffff";
			break;
			case 3:
			document.getElementById("TabTab03Con1").style.display="none";
			document.getElementById("TabTab03Con2").style.display="none";
			document.getElementById("TabTab03Con3").style.display="block";
			document.getElementById("font1").style.color="#ffffff";
			document.getElementById("font2").style.color="#ffffff";
			document.getElementById("font3").style.color="#000000";
			break;
		}
	}
// index tab切换 end

(function($){
	$(function(){
			  
		/*IE6下修复png透明*/
		var isIe6 = $.browser.msie && $.browser.version == "6.0";
		if(isIe6){
			try{
				DD_belatedPNG.fix(".png");
				DD_belatedPNG.fix(".btn:not('.login_btn') span");
				DD_belatedPNG.fix('#imgSlider .scroll_dot_list li span');
				DD_belatedPNG.fix('.z_kf_r');
				DD_belatedPNG.fix('.z_bh_ico2');
				DD_belatedPNG.fix('.rightlist');
				
			} catch(e){}
		}
		
	
	});
})(jQuery);
//scrolltop
//$(document).ready(function(){
	//var $gotp = $("<div id='goTopBtn' style='position:fixed;bottom:0px;z-index:999; width:54px; height:54px; display:none; cursor:pointer; _position:absolute;'><a href='javascript:void(0)'></a></div>").appendTo("body").click(function(){
       // var e=document.documentElement;
        //if(!$.browser.msie&&!$.browser.mozilla){
            //e=document.body;
            //}
       // $(e).animate({scrollTop:0},200,function(){
            //$gotp.hide();
            //});
    //});
   // $(window).scroll(function(){
        //var sh = $(window).scrollTop();
        //if(sh==0)
        //{
            //$gotp.hide();
        //}
        //else
        //{
            //$gotp.show();
        //}
   // });
	//var wiw = $(window).width();
	//if(wiw-1172>0){
		//var gtl=(wiw-1172)/2+1140+"px";
		//$gotp.css("left",gtl);
		//$gotp.css("right","auto");
	//}else{
		//$gotp.css("left","auto");
		//$gotp.css("right","0px");
	//}
	//$(window).resize(function(){						
	//var wiw = $(window).width();
	//if(wiw-1172<=0){
		//$("#goTopBtn").css("left","auto");
		//$("#goTopBtn").css("right","0px");
	//}else{
		//var gtl=(wiw-1172)/2+1140+"px";
		//$("#goTopBtn").css("left",gtl);
		//$("#goTopBtn").css("right","auto");
	//}
 //});
//});