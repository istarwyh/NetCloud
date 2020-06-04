base = {
    _createScriptTag : function(a, b, c)
    {
        a.setAttribute("type", "text/javascript");
        c && a.setAttribute("charset", c);
        a.setAttribute("src", b);
        document.getElementsByTagName("head")[0].appendChild(a);
    },
    _removeScriptTag : function(a)
    {
        if (a.clearAttributes)
        {
            a.clearAttributes()
        }
        else
        {
            for ( var b in a)
            {
                if (a.hasOwnProperty(b))
                {
                    delete a[b];
                }
            }
        }
        if (a && a.parentNode)
        {
            a.parentNode.removeChild(a);
        }
        a = null
    },
    callByBrowser : function(b, c, d)
    {
        var e = document.createElement("SCRIPT"), scriptLoaded = 0, options = d || {}, charset = options["charset"], callback = c || function()
        {
        }, timeOut = options["timeOut"] || 0, timer;
        e.onload = e.onreadystatechange = function()
        {
            if (scriptLoaded)
            {
                return
            }
            var a = e.readyState;
            if ("undefined" == typeof a || a == "loaded" || a == "complete")
            {
                scriptLoaded = 1;
                try
                {
                    callback();
                    clearTimeout(timer);
                }
                finally
                {
                    e.onload = e.onreadystatechange = null;
                    base._removeScriptTag(e);
                }
            }
        };
        if (timeOut)
        {
            timer = setTimeout(function()
            {
                e.onload = e.onreadystatechange = null;
                base._removeScriptTag(e);
                options.onfailure && options.onfailure()
            }, timeOut)
        }
        base._createScriptTag(e, b, charset)
    }
}
function initMenu(){
    //菜单鼠标事件
    $("#nav").children().mouseover(function(){
        var menu = $(this).children(".top_list");
        if(menu.length>0)
        {
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
    $("#lmq_denglu").click(function(){
        if($(this).hasClass("dl_btn01")){
            $(this).removeClass("dl_btn01");
            $("#lmq_denglu_kuang").hide();
        }
        else{
            $("#lmq_denglu_kuang").show();
            $(this).addClass("dl_btn01");
        }
    });
    $(".denglu_kuang_bt_btn").click(function(){
        $("#lmq_denglu").removeClass();
        $("#lmq_denglu_kuang").hide();
    });
}
function initFooter(){
    $(".z_ser_btn").mouseover(function(){
        $(this).stop();
        $(this).animate({left:'0px'},100);
    }).mouseleave(function(){
        $(this).stop();
        $(this).animate({left:'-237px'},100);
        });
    var $gotp = $("<div id='goTopBtn' style='position:fixed;bottom:0px;z-index:999; width:32px; height:30px; display:none; cursor:pointer; _position:absolute;'><a href='javascript:void(0)'></a></div>").appendTo("body").click(function(){
        var e=document.documentElement;
        if(!$.browser.msie&&!$.browser.mozilla){
            e=document.body;
            }
        $(e).animate({scrollTop:0},200,function(){
            $gotp.hide();
            });
    });
    $(window).scroll(function(){
        var sh = $(window).scrollTop();
        if(sh==0)
        {
            $gotp.hide();
        }
        else
        {
            $gotp.show();
        }
    });

    var wiw = $(window).width();
    if(wiw-1172>0){
    var gtl=(wiw-1172)/2+1140+"px";
        $gotp.css("left",gtl);
        $gotp.css("right","auto");
    }else{
        $gotp.css("left","auto");
        $gotp.css("right","0px");
    }
    $(window).resize(function(){                        
    var wiw = $(window).width();
    if(wiw-1172<=0){
        $("#goTopBtn").css("left","auto");
        $("#goTopBtn").css("right","0px");
    }else{
    var gtl=(wiw-1172)/2+1140+"px";
        $("#goTopBtn").css("left",gtl);
        $("#goTopBtn").css("right","auto");
    }
    });
}
function goleft(){
    var wiw=document.documentElement.offsetWidth;
    var gtl=(wiw-1140)/2+1140+"px";
    document.getElementById('goTopBtn').style.left=gtl;
}